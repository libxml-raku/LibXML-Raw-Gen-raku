use v6;
# -- DO NOT EDIT --
# generated by: bin/libxml-generator.raku

unit module LibXML::Raw::Gen::nanohttp;
# minimal HTTP implementation:
#    minimal HTTP implementation allowing to fetch resources like external subset. 
use LibXML::Raw::Defs :$XML2, :xmlCharP;

our sub xmlNanoHTTPAuthHeader(Pointer $ctx --> Str) is native(XML2) is export {*}
our sub xmlNanoHTTPCleanup() is native(XML2) is export {*}
our sub xmlNanoHTTPClose(Pointer $ctx) is native(XML2) is export {*}
our sub xmlNanoHTTPContentLength(Pointer $ctx --> int32) is native(XML2) is export {*}
our sub xmlNanoHTTPEncoding(Pointer $ctx --> Str) is native(XML2) is export {*}
our sub xmlNanoHTTPFetch(Str $URL, Str $filename, char ** $contentType --> int32) is native(XML2) is export {*}
our sub xmlNanoHTTPInit() is native(XML2) is export {*}
our sub xmlNanoHTTPMethod(Str $URL, Str $method, Str $input, char ** $contentType, Str $headers, int32 $ilen --> Pointer) is native(XML2) is export {*}
our sub xmlNanoHTTPMethodRedir(Str $URL, Str $method, Str $input, char ** $contentType, char ** $redir, Str $headers, int32 $ilen --> Pointer) is native(XML2) is export {*}
our sub xmlNanoHTTPMimeType(Pointer $ctx --> Str) is native(XML2) is export {*}
our sub xmlNanoHTTPOpen(Str $URL, char ** $contentType --> Pointer) is native(XML2) is export {*}
our sub xmlNanoHTTPOpenRedir(Str $URL, char ** $contentType, char ** $redir --> Pointer) is native(XML2) is export {*}
our sub xmlNanoHTTPRead(Pointer $ctx, Pointer $dest, int32 $len --> int32) is native(XML2) is export {*}
our sub xmlNanoHTTPRedir(Pointer $ctx --> Str) is native(XML2) is export {*}
our sub xmlNanoHTTPReturnCode(Pointer $ctx --> int32) is native(XML2) is export {*}
our sub xmlNanoHTTPSave(Pointer $ctxt, Str $filename --> int32) is native(XML2) is export {*}
our sub xmlNanoHTTPScanProxy(Str $URL) is native(XML2) is export {*}
