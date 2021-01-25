use v6;
#  -- DO NOT EDIT --
# generated by: generator.raku 

unit module LibXML::Raw::Gen::chvalid;
# Unicode character range checking:
#    this module exports interfaces for the character range validation APIs  This file is automatically generated from the cvs source definition files using the genChRanges.py Python script 
use LibXML::Raw::Defs :$lib, :xmlCharP;

class xmlChLRange is repr('CStruct') {
    has uint32 $.low;
    has uint32 $.high;
}

class xmlChRangeGroup is repr('CStruct') {
    has int32 $.nbShortRange;
    has int32 $.nbLongRange;
    has const xmlChSRange * $.shortRange; # points to an array of ranges
    has const xmlChLRange * $.longRange;
}

class xmlChSRange is repr('CStruct') {
    has unsigned short $.low;
    has unsigned short $.high;
}

our sub xmlCharInRange(uint32 $val, const xmlChRangeGroup * $rptr --> int32) is native(XML2) is export {*}
our sub xmlIsBaseChar(uint32 $ch --> int32) is native(XML2) is export {*}
our sub xmlIsBlank(uint32 $ch --> int32) is native(XML2) is export {*}
our sub xmlIsChar(uint32 $ch --> int32) is native(XML2) is export {*}
our sub xmlIsCombining(uint32 $ch --> int32) is native(XML2) is export {*}
our sub xmlIsDigit(uint32 $ch --> int32) is native(XML2) is export {*}
our sub xmlIsExtender(uint32 $ch --> int32) is native(XML2) is export {*}
our sub xmlIsIdeographic(uint32 $ch --> int32) is native(XML2) is export {*}
our sub xmlIsPubidChar(uint32 $ch --> int32) is native(XML2) is export {*}