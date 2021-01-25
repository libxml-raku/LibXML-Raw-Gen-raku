use v6;
#  -- DO NOT EDIT --
# generated by: generator.raku 

unit module LibXML::Raw::Gen::xpathInternals;
# internal interfaces for XML Path Language implementation:
#    internal interfaces for XML Path Language implementation used to build new modules on top of XPath like XPointer and XSLT 
use LibXML::Raw::Defs :$lib, :xmlCharP;

our sub xmlXPathDebugDumpCompExpr(FILE * $output, xmlXPathCompExpr $comp, int32 $depth) is native(XML2) is export {*}
our sub xmlXPathDebugDumpObject(FILE * $output, xmlXPathObject $cur, int32 $depth) is native(XML2) is export {*}
our sub xmlXPathIsNodeType(xmlCharP $name --> int32) is native(XML2) is export {*}
our sub xmlXPathStringEvalNumber(xmlCharP $str --> num64) is native(XML2) is export {*}
