unit class LibXML::Raw::Gen:ver<0.0.1>;

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
