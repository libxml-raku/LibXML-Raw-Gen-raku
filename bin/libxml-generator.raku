#!env perl6
use LibXML::Raw::Meta;
use LibXML::Raw::Gen;

sub MAIN(Str $api?, Str :$mod='LibXML', Str :$lib='XML2') {
    my LibXML::Raw::Meta $meta .= new: :file($api // LibXML::Raw::Meta.source);
    my LibXML::Raw::Gen $generator .= new: :$meta;
    $generator.write-files: :$mod, :$lib;
}
