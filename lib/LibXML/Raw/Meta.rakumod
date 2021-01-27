unit class LibXML::Raw::Meta;

use LibXML::Document;
use LibXML::Element;

my subset EnumDefElem of LibXML::Element where .tagName eq 'enum';
my subset FileDefElem of LibXML::Element where .tagName eq 'file';
my subset FieldDefElem of LibXML::Element where .tagName eq 'field';
my subset FunctionDefElem of LibXML::Element where .tagName eq 'function';
my subset StructDefElem of LibXML::Element where .tagName eq 'struct';
my subset TypeDefElem of LibXML::Element where .tagName eq 'typedef';

has LibXML::Document $.doc is built;
has LibXML::Element  $!Root;
class File {...}
class Struct {...}
has File  %!Files handles<AT-KEY>;
has Struct %!Structs;

class Type {
    has Str $.of;
    method Str {
        constant TypeMap = %(
            'char *' => 'Str',
            'char'   => 'byte',
            'const char *' => 'Str', # managed?
            'const xmlChar *' => 'xmlCharP', # managed?
            'xmlChar *' => 'xmlCharP',
            'double' => 'num64',
            'int' => 'int32',
            'unsigned int' => 'uint32',
            'int *' => 'Pointer[int32]',
            'const xmlChar * *' => 'Pointer[xmlCharP]', # managed?
            'void *' => 'Pointer',
            'void * *' => 'Pointer[Pointer]',
            'long' => 'long',
            'unsigned long' => 'ulong',
            'void' => Str,
        );

        do with $!of {
            s/'struct _'(.*)' *'/$0/;
            (TypeMap{$_}:exists)
                ?? TypeMap{$_}
                !! .subst(/'Ptr'$/, '');
        } // Str;
    }

}
class Field {
    has $.name;
    has Type $!type;
    method type { $!type.Str }
    has $.info;
    submethod TWEAK(:$type) { $!type .= new: :of($_) with $type }
}

multi sub abbrev($name where /^(xml|xslt|<[A..Z]><[a..z]>*)/, $base where /^($($0))[$|<!before [<[a..z]>]>]/) {
    my $n = $0.chars;
    abbrev($name.substr($n,*), $base.substr($n, *));
}
multi sub abbrev($name where /(<[A..Z]><[a..z]>*)$/, $base where /($($0))$/) {
    my $n = $0.chars;
    abbrev($name.substr(0, *-$n), $base.substr(0, *-$n) );
}
multi sub abbrev($name, $type) is default { $name }

class Function {
    has $.name;
    has $.info;
    has Field $.return;
    has Field @.args;
    has $.lib = 'XML2';
    sub arg-str(Field:D $_) {
        .type.Str ~ ' $' ~ .name;
    }
    method Str(:$method) {
        my @args = @!args.clone;
        my $ret-type = .type with $!return;
        my $ret-str = do with $ret-type { " --> " ~ $_ } // '';
        my $info = $!info ?? " # " ~ $!info.trim !! '';
        my $type = $method ?? @args.shift.type !! $!return.type;

        my $short-name = do with $type { abbrev($!name, $_) } else { $!name };
        my $arg-str = @args.map(&arg-str).join: ', ';
        $short-name = $!name if !$method && $!name.chars - $short-name.chars <= 4;
        my $sym = $short-name eq $!name ?? ($method ?? '' !! " is export") !! " is symbol('$!name')";

        my $decl = $method ?? 'method' !! 'our sub';
        "$decl $short-name\({$arg-str}{$ret-str}\) is native\($!lib\)$sym \{*\}$info";
    }
}

class Struct {
    has $.name;
    has Field @.fields;
    has Function @.subs;
    has Function @.methods;
}

class Typedef {
    has $.name;
    has $.type;
}

class File {
    has $.name;
    has $.summary;
    has $.description;
    has Hash %.enums;
    has Typedef @.typedefs;
    has Struct @.structs;
    has Function @.subs;

    method def($) is default { $*ERR.print('.') }
}

method source {
    %?RESOURCES<libxml2-api.xml>
}

method !process-files(Str:D $xpath) {
    for $!Root{$xpath} -> FileDefElem $_ {
        my $name = .Str with .<@name>;
        my $summary = .<summary>[0].textContent;
        my $description = .<description>[0].textContent;
        my File $file .= new: :$name, :$summary, :$description;
        %!Files{$file.name} = $file;
        $*ERR.print('.');
    }
}

method !process-enums(Str:D $xpath) {
    for $!Root{$xpath} -> EnumDefElem $_ {
        my $name = .Str with .<@name>;
        my $type = .Str with .<@type>;
        my $file-name = .Str with .<@file>;
        my $value = .Str with .<@value>.Int;

        my $file = %!Files{$file-name} //= File.new: :name($file-name);
        $file.enums{$type}{$name} = $value;
        $*ERR.print('+');
    }
}

method !process-struct-fields(StructDefElem:D $_, Str:D $xpath, Struct :$struct!, ) {
    for .{$xpath} -> FieldDefElem $_ {
        my $name = .Str with .<@name>;
        my $type = .Str with .<@type>;
        my $info = .Str with .<@info>;

        my Field $field .= new: :$name, :$type, :$info;
        $struct.fields.push: $field;
        $*ERR.print('<');
    }
}

method !process-functions(Str:D $xpath) {
    for $!Root{$xpath} -> FunctionDefElem $_ {
        my $name = .Str with .<@name>;
        my $type = .Str with .<@type>;
        my $file-name = .Str with .<@file>;
        my $info = .Str with .<info>;

        my Field ($return, @args);
        with .<return>[0] {
            my $type = .Str with .<@type>;
            my $info = .Str with .<@info>;
            $return .= new: :$type, :$info;
        }
        with .<arg> {
            @args = .map: {
                my $name = .Str with .<@name>;
                my $type = .Str with .<@type>;
                my $info = .Str with .<@info>;
                Field.new: :$name, :$type, :$info;
            }
        }

        my Function $function .= new: :$name, :$return, :@args;

        my $method-type = .type with @args[0];
        my $return-type = .type with $return;
        my $method-struct = %!Structs{$_} with $method-type;
        my $return-struct = %!Structs{$_} with $return-type;
        with $method-struct {
            .methods.push: $function;
        }
        else {
            with $return-struct {
                .subs.push: $function;
            }
            else {
                my $file = %!Files{$file-name} //= File.new: :name($file-name);
                $file.subs.push: $function;
            }
        }
        $*ERR.print('>');
    }
}

method !process-structs(Str:D $xpath) {
    for $!Root{$xpath} -> StructDefElem $_ {
        my $name = .Str with .<@name>;
        my $file-name = .Str with .<@file>;

        my $file = %!Files{$file-name} //= File.new: :name($file-name);
        my Struct $struct .= new: :$name;
        self!process-struct-fields($_, 'field', :$struct);
        %!Structs{$name} //= $struct;
        $file.structs.push: $struct;
        $*ERR.print('*');
    }
}

method !process-typedefs(Str:D $xpath) {
    for $!Root{$xpath} -> TypeDefElem $_ {
        my $name = .Str with .<@name>;
        unless $name.ends-with('Ptr') {
            my $type = .Str with .<@type>;
            my $file-name = .Str with .<@file>;

            my $file = %!Files{$file-name} //= File.new: :name($file-name);
            my Typedef $typedef .= new: :$name, :$type;
            $file.typedefs.push: $typedef;
            $*ERR.print('T');
        }
    }
}

method files {
    %!Files.values.sort(*.name);
}

submethod TWEAK(:$file = self.source) {
    $!doc .= parse: :$file;
    $!Root = $!doc.root;

    self!process-files('files/file');
    self!process-enums('symbols/enum');
    self!process-structs('symbols/struct');
    self!process-typedefs('symbols/typedef');
    self!process-functions('symbols/function');
}
