use Test;
use LibXML::Raw::Meta;
my LibXML::Raw::Meta $meta;

lives-ok  { $meta .= new }

done-testing;
