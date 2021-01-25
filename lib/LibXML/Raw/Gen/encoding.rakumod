use v6;
#  -- DO NOT EDIT --
# generated by: generator.raku 

unit module LibXML::Raw::Gen::encoding;
# interface for the encoding conversion functions:
#    interface for the encoding conversion functions needed for XML basic encoding and iconv() support.  Related specs are rfc2044        (UTF-8 and UTF-16) F. Yergeau Alis Technologies [ISO-10646]    UTF-8 and UTF-16 in Annexes [ISO-8859-1]   ISO Latin-1 characters codes. [UNICODE]      The Unicode Consortium, "The Unicode Standard -- Worldwide Character Encoding -- Version 1.0", Addison- Wesley, Volume 1, 1991, Volume 2, 1992.  UTF-8 is described in Unicode Technical Report #4. [US-ASCII]     Coded Character Set--7-bit American Standard Code for Information Interchange, ANSI X3.4-1986. 
use LibXML::Raw::Defs :$lib, :xmlCharP;

enum xmlCharEncoding is export (
    XML_CHAR_ENCODING_2022_JP => 19,
    XML_CHAR_ENCODING_8859_1 => 10,
    XML_CHAR_ENCODING_8859_2 => 11,
    XML_CHAR_ENCODING_8859_3 => 12,
    XML_CHAR_ENCODING_8859_4 => 13,
    XML_CHAR_ENCODING_8859_5 => 14,
    XML_CHAR_ENCODING_8859_6 => 15,
    XML_CHAR_ENCODING_8859_7 => 16,
    XML_CHAR_ENCODING_8859_8 => 17,
    XML_CHAR_ENCODING_8859_9 => 18,
    XML_CHAR_ENCODING_ASCII => 22,
    XML_CHAR_ENCODING_EBCDIC => 6,
    XML_CHAR_ENCODING_ERROR => -1,
    XML_CHAR_ENCODING_EUC_JP => 21,
    XML_CHAR_ENCODING_NONE => 0,
    XML_CHAR_ENCODING_SHIFT_JIS => 20,
    XML_CHAR_ENCODING_UCS2 => 9,
    XML_CHAR_ENCODING_UCS4BE => 5,
    XML_CHAR_ENCODING_UCS4LE => 4,
    XML_CHAR_ENCODING_UCS4_2143 => 7,
    XML_CHAR_ENCODING_UCS4_3412 => 8,
    XML_CHAR_ENCODING_UTF16BE => 3,
    XML_CHAR_ENCODING_UTF16LE => 2,
    XML_CHAR_ENCODING_UTF8 => 1,
);

class uconv_t is repr('CStruct') {
    has UConverter * $.uconv; # for conversion between an encoding and UTF-16
    has UConverter * $.utf8; # for conversion between UTF-8 and UTF-16
    has UCharpivot_buf[ICU_PIVOT_BUF_SIZE] $.pivot_buf;
    has UChar * $.pivot_source;
    has UChar * $.pivot_target;
}

class xmlCharEncodingHandler is repr('CStruct') {
    has Str $.name;
    has xmlCharEncodingInputFunc $.input;
    has xmlCharEncodingOutputFunc $.output;
    has iconv_t $.iconv_in;
    has iconv_t $.iconv_out;
    has uconv_t * $.uconv_in;
    has uconv_t * $.uconv_out;

    our sub xmlFindCharEncodingHandler(Str $name --> xmlCharEncodingHandler) is native(XML2) is export {*}
    our sub xmlGetCharEncodingHandler(xmlCharEncoding $enc --> xmlCharEncodingHandler) is native(XML2) is export {*}
    our sub xmlNewCharEncodingHandler(Str $name, xmlCharEncodingInputFunc $input, xmlCharEncodingOutputFunc $output --> xmlCharEncodingHandler) is native(XML2) is export {*}

    method xmlAllocOutputBuffer( --> xmlOutputBuffer) is native(XML2) {*}
    method xmlRegisterCharEncodingHandler() is native(XML2) {*}
}

our sub UTF8Toisolat1(unsigned char * $out, Pointer[int32] $outlen, const unsigned char * $in, Pointer[int32] $inlen --> int32) is native(XML2) is export {*}
our sub isolat1ToUTF8(unsigned char * $out, Pointer[int32] $outlen, const unsigned char * $in, Pointer[int32] $inlen --> int32) is native(XML2) is export {*}
our sub xmlAddEncodingAlias(Str $name, Str $alias --> int32) is native(XML2) is export {*}
our sub xmlCharEncCloseFunc(xmlCharEncodingHandler * $handler --> int32) is native(XML2) is export {*}
our sub xmlCharEncFirstLine(xmlCharEncodingHandler * $handler, xmlBuffer $out, xmlBuffer $in --> int32) is native(XML2) is export {*}
our sub xmlCharEncInFunc(xmlCharEncodingHandler * $handler, xmlBuffer $out, xmlBuffer $in --> int32) is native(XML2) is export {*}
our sub xmlCharEncOutFunc(xmlCharEncodingHandler * $handler, xmlBuffer $out, xmlBuffer $in --> int32) is native(XML2) is export {*}
our sub xmlCleanupCharEncodingHandlers() is native(XML2) is export {*}
our sub xmlCleanupEncodingAliases() is native(XML2) is export {*}
our sub xmlDelEncodingAlias(Str $alias --> int32) is native(XML2) is export {*}
our sub xmlDetectCharEncoding(const unsigned char * $in, int32 $len --> xmlCharEncoding) is native(XML2) is export {*}
our sub xmlGetCharEncodingName(xmlCharEncoding $enc --> Str) is native(XML2) is export {*}
our sub xmlGetEncodingAlias(Str $alias --> Str) is native(XML2) is export {*}
our sub xmlInitCharEncodingHandlers() is native(XML2) is export {*}
our sub xmlParseCharEncoding(Str $name --> xmlCharEncoding) is native(XML2) is export {*}
