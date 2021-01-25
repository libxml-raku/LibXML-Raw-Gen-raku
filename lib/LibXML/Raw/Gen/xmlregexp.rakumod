use v6;
#  -- DO NOT EDIT --
# generated by: generator.raku 

unit module LibXML::Raw::Gen::xmlregexp;
# regular expressions handling:
#    basic API for libxml regular expressions handling used for XML Schemas and validation. 
use LibXML::Raw::Defs :$lib, :xmlCharP;

enum xmlExpNodeType is export (
    XML_EXP_ATOM => 2,
    XML_EXP_COUNT => 5,
    XML_EXP_EMPTY => 0,
    XML_EXP_FORBID => 1,
    XML_EXP_OR => 4,
    XML_EXP_SEQ => 3,
);

class xmlExpCtxt is repr('CPointer') {
    our sub xmlExpNewCtxt(int32 $maxNodes, xmlDict $dict --> xmlExpCtxt) is native(XML2) is export {*}

    method xmlExpCtxtNbCons( --> int32) is native(XML2) {*}
    method xmlExpCtxtNbNodes( --> int32) is native(XML2) {*}
    method xmlExpExpDerive(xmlExpNode $exp, xmlExpNode $sub --> xmlExpNode) is native(XML2) {*}
    method xmlExpFree(xmlExpNode $exp) is native(XML2) {*}
    method xmlExpFreeCtxt() is native(XML2) {*}
    method xmlExpGetLanguage(xmlExpNode $exp, const xmlChar ** $langList, int32 $len --> int32) is native(XML2) {*}
    method xmlExpGetStart(xmlExpNode $exp, const xmlChar ** $tokList, int32 $len --> int32) is native(XML2) {*}
    method xmlExpNewAtom(xmlCharP $name, int32 $len --> xmlExpNode) is native(XML2) {*}
    method xmlExpNewOr(xmlExpNode $left, xmlExpNode $right --> xmlExpNode) is native(XML2) {*}
    method xmlExpNewRange(xmlExpNode $subset, int32 $min, int32 $max --> xmlExpNode) is native(XML2) {*}
    method xmlExpNewSeq(xmlExpNode $left, xmlExpNode $right --> xmlExpNode) is native(XML2) {*}
    method xmlExpParse(Str $expr --> xmlExpNode) is native(XML2) {*}
    method xmlExpStringDerive(xmlExpNode $exp, xmlCharP $str, int32 $len --> xmlExpNode) is native(XML2) {*}
    method xmlExpSubsume(xmlExpNode $exp, xmlExpNode $sub --> int32) is native(XML2) {*}
}

class xmlExpNode is repr('CPointer') {
    method xmlExpIsNillable( --> int32) is native(XML2) {*}
    method xmlExpMaxToken( --> int32) is native(XML2) {*}
    method xmlExpRef() is native(XML2) {*}
}

class xmlRegExecCtxt is repr('CPointer') {
    method xmlRegExecErrInfo(const xmlChar ** $string, Pointer[int32] $nbval, Pointer[int32] $nbneg, xmlChar ** $values, Pointer[int32] $terminal --> int32) is native(XML2) {*}
    method xmlRegExecNextValues(Pointer[int32] $nbval, Pointer[int32] $nbneg, xmlChar ** $values, Pointer[int32] $terminal --> int32) is native(XML2) {*}
    method xmlRegExecPushString(xmlCharP $value, Pointer $data --> int32) is native(XML2) {*}
    method xmlRegExecPushString2(xmlCharP $value, xmlCharP $value2, Pointer $data --> int32) is native(XML2) {*}
    method xmlRegFreeExecCtxt() is native(XML2) {*}
}

class xmlRegexp is repr('CPointer') {
    our sub xmlRegexpCompile(xmlCharP $regexp --> xmlRegexp) is native(XML2) is export {*}

    method xmlRegFreeRegexp() is native(XML2) {*}
    method xmlRegNewExecCtxt(xmlRegExecCallbacks $callback, Pointer $data --> xmlRegExecCtxt) is native(XML2) {*}
    method xmlRegexpExec(xmlCharP $content --> int32) is native(XML2) {*}
    method xmlRegexpIsDeterminist( --> int32) is native(XML2) {*}
}

our sub xmlRegexpPrint(FILE * $output, xmlRegexp $regexp) is native(XML2) is export {*}
