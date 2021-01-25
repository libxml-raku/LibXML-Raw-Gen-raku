use v6;
#  -- DO NOT EDIT --
# generated by: generator.raku 

unit module LibXML::Raw::Gen::relaxng;
# implementation of the Relax-NG validation:
#    implementation of the Relax-NG validation 
use LibXML::Raw::Defs :$lib, :xmlCharP;

enum xmlRelaxNGParserFlag is export (
    XML_RELAXNGP_CRNG => 2,
    XML_RELAXNGP_FREE_DOC => 1,
    XML_RELAXNGP_NONE => 0,
);

enum xmlRelaxNGValidErr is export (
    XML_RELAXNG_ERR_ATTREXTRANS => 20,
    XML_RELAXNG_ERR_ATTRNAME => 14,
    XML_RELAXNG_ERR_ATTRNONS => 16,
    XML_RELAXNG_ERR_ATTRVALID => 24,
    XML_RELAXNG_ERR_ATTRWRONGNS => 18,
    XML_RELAXNG_ERR_CONTENTVALID => 25,
    XML_RELAXNG_ERR_DATAELEM => 28,
    XML_RELAXNG_ERR_DATATYPE => 31,
    XML_RELAXNG_ERR_DUPID => 4,
    XML_RELAXNG_ERR_ELEMEXTRANS => 19,
    XML_RELAXNG_ERR_ELEMNAME => 13,
    XML_RELAXNG_ERR_ELEMNONS => 15,
    XML_RELAXNG_ERR_ELEMNOTEMPTY => 21,
    XML_RELAXNG_ERR_ELEMWRONG => 38,
    XML_RELAXNG_ERR_ELEMWRONGNS => 17,
    XML_RELAXNG_ERR_EXTRACONTENT => 26,
    XML_RELAXNG_ERR_EXTRADATA => 35,
    XML_RELAXNG_ERR_INTEREXTRA => 12,
    XML_RELAXNG_ERR_INTERNAL => 37,
    XML_RELAXNG_ERR_INTERNODATA => 10,
    XML_RELAXNG_ERR_INTERSEQ => 11,
    XML_RELAXNG_ERR_INVALIDATTR => 27,
    XML_RELAXNG_ERR_LACKDATA => 36,
    XML_RELAXNG_ERR_LIST => 33,
    XML_RELAXNG_ERR_LISTELEM => 30,
    XML_RELAXNG_ERR_LISTEMPTY => 9,
    XML_RELAXNG_ERR_LISTEXTRA => 8,
    XML_RELAXNG_ERR_MEMORY => 1,
    XML_RELAXNG_ERR_NODEFINE => 7,
    XML_RELAXNG_ERR_NOELEM => 22,
    XML_RELAXNG_ERR_NOGRAMMAR => 34,
    XML_RELAXNG_ERR_NOSTATE => 6,
    XML_RELAXNG_ERR_NOTELEM => 23,
    XML_RELAXNG_ERR_TEXTWRONG => 39,
    XML_RELAXNG_ERR_TYPE => 2,
    XML_RELAXNG_ERR_TYPECMP => 5,
    XML_RELAXNG_ERR_TYPEVAL => 3,
    XML_RELAXNG_ERR_VALELEM => 29,
    XML_RELAXNG_ERR_VALUE => 32,
    XML_RELAXNG_OK => 0,
);

class xmlRelaxNG is repr('CPointer') {
    method xmlRelaxNGFree() is native(XML2) {*}
    method xmlRelaxNGNewValidCtxt( --> xmlRelaxNGValidCtxt) is native(XML2) {*}
}

class xmlRelaxNGParserCtxt is repr('CPointer') {
    our sub xmlRelaxNGNewMemParserCtxt(Str $buffer, int32 $size --> xmlRelaxNGParserCtxt) is native(XML2) is export {*}
    our sub xmlRelaxNGNewParserCtxt(Str $URL --> xmlRelaxNGParserCtxt) is native(XML2) is export {*}

    method xmlRelaxNGFreeParserCtxt() is native(XML2) {*}
    method xmlRelaxNGGetParserErrors(xmlRelaxNGValidityErrorFunc * $err, xmlRelaxNGValidityWarningFunc * $warn, void ** $ctx --> int32) is native(XML2) {*}
    method xmlRelaxNGParse( --> xmlRelaxNG) is native(XML2) {*}
    method xmlRelaxNGSetParserErrors(xmlRelaxNGValidityErrorFunc $err, xmlRelaxNGValidityWarningFunc $warn, Pointer $ctx) is native(XML2) {*}
    method xmlRelaxNGSetParserStructuredErrors(xmlStructuredErrorFunc $serror, Pointer $ctx) is native(XML2) {*}
    method xmlRelaxParserSetFlag(int32 $flags --> int32) is native(XML2) {*}
}

class xmlRelaxNGValidCtxt is repr('CPointer') {
    method xmlRelaxNGFreeValidCtxt() is native(XML2) {*}
    method xmlRelaxNGGetValidErrors(xmlRelaxNGValidityErrorFunc * $err, xmlRelaxNGValidityWarningFunc * $warn, void ** $ctx --> int32) is native(XML2) {*}
    method xmlRelaxNGSetValidErrors(xmlRelaxNGValidityErrorFunc $err, xmlRelaxNGValidityWarningFunc $warn, Pointer $ctx) is native(XML2) {*}
    method xmlRelaxNGSetValidStructuredErrors(xmlStructuredErrorFunc $serror, Pointer $ctx) is native(XML2) {*}
    method xmlRelaxNGValidateDoc(xmlDoc $doc --> int32) is native(XML2) {*}
    method xmlRelaxNGValidateFullElement(xmlDoc $doc, xmlNode $elem --> int32) is native(XML2) {*}
    method xmlRelaxNGValidatePopElement(xmlDoc $doc, xmlNode $elem --> int32) is native(XML2) {*}
    method xmlRelaxNGValidatePushCData(xmlCharP $data, int32 $len --> int32) is native(XML2) {*}
    method xmlRelaxNGValidatePushElement(xmlDoc $doc, xmlNode $elem --> int32) is native(XML2) {*}
}

our sub xmlRelaxNGCleanupTypes() is native(XML2) is export {*}
our sub xmlRelaxNGDump(FILE * $output, xmlRelaxNG $schema) is native(XML2) is export {*}
our sub xmlRelaxNGDumpTree(FILE * $output, xmlRelaxNG $schema) is native(XML2) is export {*}
our sub xmlRelaxNGInitTypes( --> int32) is native(XML2) is export {*}
