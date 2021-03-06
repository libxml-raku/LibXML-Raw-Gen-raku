use v6;
# -- DO NOT EDIT --
# generated by: bin/libxml-generator.raku

unit module LibXML::Raw::Gen::schematron;
# XML Schemastron implementation:
#    interface to the XML Schematron validity checking. 
use LibXML::Raw::Defs :$XML2, :xmlCharP;

enum xmlSchematronValidOptions is export (
    XML_SCHEMATRON_OUT_BUFFER => 512,
    XML_SCHEMATRON_OUT_ERROR => 8,
    XML_SCHEMATRON_OUT_FILE => 256,
    XML_SCHEMATRON_OUT_IO => 1024,
    XML_SCHEMATRON_OUT_QUIET => 1,
    XML_SCHEMATRON_OUT_TEXT => 2,
    XML_SCHEMATRON_OUT_XML => 4,
);

class xmlSchematron is repr('CPointer') {
    method xmlSchematronFree() is native(XML2) {*}
    method xmlSchematronNewValidCtxt(int32 $options --> xmlSchematronValidCtxt) is native(XML2) {*}
}

class xmlSchematronParserCtxt is repr('CPointer') {
    our sub xmlSchematronNewMemParserCtxt(Str $buffer, int32 $size --> xmlSchematronParserCtxt) is native(XML2) is export {*}
    our sub xmlSchematronNewParserCtxt(Str $URL --> xmlSchematronParserCtxt) is native(XML2) is export {*}

    method xmlSchematronFreeParserCtxt() is native(XML2) {*}
    method xmlSchematronParse( --> xmlSchematron) is native(XML2) {*}
}

class xmlSchematronValidCtxt is repr('CPointer') {
    method xmlSchematronFreeValidCtxt() is native(XML2) {*}
    method xmlSchematronSetValidStructuredErrors(xmlStructuredErrorFunc $serror, Pointer $ctx) is native(XML2) {*}
    method xmlSchematronValidateDoc(xmlDoc $instance --> int32) is native(XML2) {*}
}
