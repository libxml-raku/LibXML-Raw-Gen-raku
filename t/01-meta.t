use Test;
use LibXML::Raw::Meta;
my LibXML::Raw::Meta $meta;

lives-ok  { $meta .= new }

my $source-file = $meta.source-file('docbCreateFileParserCtxt');
is $source-file.name, 'DOCBparser';

done-testing;
