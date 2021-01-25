use v6;
#  -- DO NOT EDIT --
# generated by: generator.raku 

unit module LibXML::Raw::Gen::entities;
# interface for the XML entities handling:
#    this module provides some of the entity API needed for the parser and applications. 
use LibXML::Raw::Defs :$lib, :xmlCharP;

enum xmlEntityType is export (
    XML_EXTERNAL_GENERAL_PARSED_ENTITY => 2,
    XML_EXTERNAL_GENERAL_UNPARSED_ENTITY => 3,
    XML_EXTERNAL_PARAMETER_ENTITY => 5,
    XML_INTERNAL_GENERAL_ENTITY => 1,
    XML_INTERNAL_PARAMETER_ENTITY => 4,
    XML_INTERNAL_PREDEFINED_ENTITY => 6,
);

class xmlEntitiesTable is repr('CPointer') {
    our sub xmlCreateEntitiesTable( --> xmlEntitiesTable) is native(XML2) is export {*}

    method xmlCopyEntitiesTable( --> xmlEntitiesTable) is native(XML2) {*}
    method xmlFreeEntitiesTable() is native(XML2) {*}
}

our sub xmlCleanupPredefinedEntities() is native(XML2) is export {*}
our sub xmlEncodeSpecialChars(const xmlDoc * $doc, xmlCharP $input --> xmlCharP) is native(XML2) is export {*}
our sub xmlInitializePredefinedEntities() is native(XML2) is export {*}