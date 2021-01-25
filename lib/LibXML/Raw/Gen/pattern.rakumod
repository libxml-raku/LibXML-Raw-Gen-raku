use v6;
#  -- DO NOT EDIT --
# generated by: generator.raku 

unit module LibXML::Raw::Gen::pattern;
# pattern expression handling:
#    allows to compile and test pattern expressions for nodes either in a tree or based on a parser state. 
use LibXML::Raw::Defs :$lib, :xmlCharP;

enum xmlPatternFlags is export (
    XML_PATTERN_DEFAULT => 0,
    XML_PATTERN_XPATH => 1,
    XML_PATTERN_XSFIELD => 4,
    XML_PATTERN_XSSEL => 2,
);

class xmlPattern is repr('CPointer') {
    our sub xmlPatterncompile(xmlCharP $pattern, xmlDict * $dict, int32 $flags, const xmlChar ** $namespaces --> xmlPattern) is native(XML2) is export {*}

    method xmlFreePattern() is native(XML2) {*}
    method xmlFreePatternList() is native(XML2) {*}
    method xmlPatternFromRoot( --> int32) is native(XML2) {*}
    method xmlPatternGetStreamCtxt( --> xmlStreamCtxt) is native(XML2) {*}
    method xmlPatternMatch(xmlNode $node --> int32) is native(XML2) {*}
    method xmlPatternMaxDepth( --> int32) is native(XML2) {*}
    method xmlPatternMinDepth( --> int32) is native(XML2) {*}
    method xmlPatternStreamable( --> int32) is native(XML2) {*}
}

class xmlStreamCtxt is repr('CPointer') {
    method xmlFreeStreamCtxt() is native(XML2) {*}
    method xmlStreamPop( --> int32) is native(XML2) {*}
    method xmlStreamPush(xmlCharP $name, xmlCharP $ns --> int32) is native(XML2) {*}
    method xmlStreamPushAttr(xmlCharP $name, xmlCharP $ns --> int32) is native(XML2) {*}
    method xmlStreamPushNode(xmlCharP $name, xmlCharP $ns, int32 $nodeType --> int32) is native(XML2) {*}
    method xmlStreamWantsAnyNode( --> int32) is native(XML2) {*}
}
