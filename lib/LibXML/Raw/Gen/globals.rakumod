use v6;
# -- DO NOT EDIT --
# generated by: bin/libxml-generator.raku

unit module LibXML::Raw::Gen::globals;
# interface for all global variables of the library:
#    all the global variables and thread handling for those variables is handled by this module.  The bottom of this file is automatically generated by build_glob.py based on the description file global.data 
use LibXML::Raw::Defs :$XML2, :xmlCharP;

class xmlGlobalState is repr('CStruct') {
    has Str $.xmlParserVersion;
    has xmlSAXLocator $.xmlDefaultSAXLocator;
    has xmlSAXHandlerV1 $.xmlDefaultSAXHandler;
    has xmlSAXHandlerV1 $.docbDefaultSAXHandler;
    has xmlSAXHandlerV1 $.htmlDefaultSAXHandler;
    has xmlFreeFunc $.xmlFree;
    has xmlMallocFunc $.xmlMalloc;
    has xmlStrdupFunc $.xmlMemStrdup;
    has xmlReallocFunc $.xmlRealloc;
    has xmlGenericErrorFunc $.xmlGenericError;
    has xmlStructuredErrorFunc $.xmlStructuredError;
    has Pointer $.xmlGenericErrorContext;
    has int32 $.oldXMLWDcompatibility;
    has xmlBufferAllocationScheme $.xmlBufferAllocScheme;
    has int32 $.xmlDefaultBufferSize;
    has int32 $.xmlSubstituteEntitiesDefaultValue;
    has int32 $.xmlDoValidityCheckingDefaultValue;
    has int32 $.xmlGetWarningsDefaultValue;
    has int32 $.xmlKeepBlanksDefaultValue;
    has int32 $.xmlLineNumbersDefaultValue;
    has int32 $.xmlLoadExtDtdDefaultValue;
    has int32 $.xmlParserDebugEntities;
    has int32 $.xmlPedanticParserDefaultValue;
    has int32 $.xmlSaveNoEmptyTags;
    has int32 $.xmlIndentTreeOutput;
    has Str $.xmlTreeIndentString;
    has xmlRegisterNodeFunc $.xmlRegisterNodeDefaultValue;
    has xmlDeregisterNodeFunc $.xmlDeregisterNodeDefaultValue;
    has xmlMallocFunc $.xmlMallocAtomic;
    has xmlError $.xmlLastError;
    has xmlParserInputBufferCreateFilenameFunc $.xmlParserInputBufferCreateFilenameValue;
    has xmlOutputBufferCreateFilenameFunc $.xmlOutputBufferCreateFilenameValue;
    has Pointer $.xmlStructuredErrorContext;

    our sub xmlGetGlobalState( --> xmlGlobalState) is native(XML2) is export {*}

    method xmlInitializeGlobalState() is native(XML2) {*}
}

our sub xmlCleanupGlobals() is native(XML2) is export {*}
our sub xmlDeregisterNodeDefault(xmlDeregisterNodeFunc $func --> xmlDeregisterNodeFunc) is native(XML2) is export {*}
our sub xmlInitGlobals() is native(XML2) is export {*}
our sub xmlOutputBufferCreateFilenameDefault(xmlOutputBufferCreateFilenameFunc $func --> xmlOutputBufferCreateFilenameFunc) is native(XML2) is export {*}
our sub xmlParserInputBufferCreateFilenameDefault(xmlParserInputBufferCreateFilenameFunc $func --> xmlParserInputBufferCreateFilenameFunc) is native(XML2) is export {*}
our sub xmlRegisterNodeDefault(xmlRegisterNodeFunc $func --> xmlRegisterNodeFunc) is native(XML2) is export {*}
our sub xmlThrDefBufferAllocScheme(xmlBufferAllocationScheme $v --> xmlBufferAllocationScheme) is native(XML2) is export {*}
our sub xmlThrDefDefaultBufferSize(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefDeregisterNodeDefault(xmlDeregisterNodeFunc $func --> xmlDeregisterNodeFunc) is native(XML2) is export {*}
our sub xmlThrDefDoValidityCheckingDefaultValue(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefGetWarningsDefaultValue(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefIndentTreeOutput(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefKeepBlanksDefaultValue(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefLineNumbersDefaultValue(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefLoadExtDtdDefaultValue(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefOutputBufferCreateFilenameDefault(xmlOutputBufferCreateFilenameFunc $func --> xmlOutputBufferCreateFilenameFunc) is native(XML2) is export {*}
our sub xmlThrDefParserDebugEntities(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefParserInputBufferCreateFilenameDefault(xmlParserInputBufferCreateFilenameFunc $func --> xmlParserInputBufferCreateFilenameFunc) is native(XML2) is export {*}
our sub xmlThrDefPedanticParserDefaultValue(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefRegisterNodeDefault(xmlRegisterNodeFunc $func --> xmlRegisterNodeFunc) is native(XML2) is export {*}
our sub xmlThrDefSaveNoEmptyTags(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefSetGenericErrorFunc(Pointer $ctx, xmlGenericErrorFunc $handler) is native(XML2) is export {*}
our sub xmlThrDefSetStructuredErrorFunc(Pointer $ctx, xmlStructuredErrorFunc $handler) is native(XML2) is export {*}
our sub xmlThrDefSubstituteEntitiesDefaultValue(int32 $v --> int32) is native(XML2) is export {*}
our sub xmlThrDefTreeIndentString(Str $v --> Str) is native(XML2) is export {*}
