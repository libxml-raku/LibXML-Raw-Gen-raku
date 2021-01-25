use v6;
# -- DO NOT EDIT --
# generated by: bin/libxml-generator.raku

unit module LibXML::Raw::Gen::threads;
# interfaces for thread handling:
#    set of generic threading related routines should work with pthreads, Windows native or TLS threads 
use LibXML::Raw::Defs :$XML2, :xmlCharP;

class xmlMutex is repr('CPointer') {
    our sub xmlNewMutex( --> xmlMutex) is native(XML2) is export {*}

    method xmlFreeMutex() is native(XML2) {*}
    method xmlMutexLock() is native(XML2) {*}
    method xmlMutexUnlock() is native(XML2) {*}
}

class xmlRMutex is repr('CPointer') {
    our sub xmlNewRMutex( --> xmlRMutex) is native(XML2) is export {*}

    method xmlFreeRMutex() is native(XML2) {*}
    method xmlRMutexLock() is native(XML2) {*}
    method xmlRMutexUnlock() is native(XML2) {*}
}

our sub xmlCleanupThreads() is native(XML2) is export {*}
our sub xmlDllMain(Pointer $hinstDLL, ulong $fdwReason, Pointer $lpvReserved --> int32) is native(XML2) is export {*}
our sub xmlGetThreadId( --> int32) is native(XML2) is export {*}
our sub xmlInitThreads() is native(XML2) is export {*}
our sub xmlIsMainThread( --> int32) is native(XML2) is export {*}
our sub xmlLockLibrary() is native(XML2) is export {*}
our sub xmlUnlockLibrary() is native(XML2) is export {*}
