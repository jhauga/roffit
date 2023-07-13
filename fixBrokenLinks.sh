#!/bin/bash

# This is a supporting script that runs after the html is
# generated. It fixes links followed by punctuations and
# changes empty protocols to null links.

# Fix links where quoted.
_lineNumber=$(grep -n "&quot;\<a " testpage.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumber}s|(href=\")([^\"]*)(&quot;)|\1\2|g" testpage.dump

# Fix links followed by punctuations.
sed -i -E "s|(href=\"[^\"]*)([[:punct:]]+)(\">)([^\"]+)&quot;([[:punct:]]*)(</a>)|\1\3\4\6\"\5|g" testpage.dump
sed -i -E "s|(href=\"[^\"]*)([[:punct:]]+)(\">)([^\"]*)([[:punct:]]*)(</a>)|\1\3\4\6\5|g" testpage.dump

# Fix incomplete http://, https://, and ftp://
# http
_lineNumberhttp=$(grep -n 'href="http://"' testpage.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumberhttp}s|href=\"http://\">(http://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" testpage.dump # e.g. (http://),
sed -i -E "${_lineNumberhttp}s|href=\"http://\)\">(http://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" testpage.dump # e.g. (http://) 
sed -i "s|href=\"http://\"|href=\"javascript:void(0)\"|g" testpage.dump # e.g. http://,
sed -i "s|<a href=\"http:\">http://</a>|<a href=\"javascript:void(0)\">http://</a>|g" testpage.dump # e.g. ("http://")
sed -i "s|<a href=\"http:/\">http://</a>|<a href=\"javascript:void(0)\">http://</a>|g" testpage.dump # e.g. "http://",
# https
_lineNumberhttp=$(grep -n 'href="https://"' testpage.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumberhttp}s|href=\"https://\">(https://)(\))(</a>)|href=\"javascript:void(0)\">\1\3\2|g" testpage.dump # e.g. (https://),
sed -i -E "${_lineNumberhttp}s|href=\"https://\)\">(https://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" testpage.dump # e.g. (https://)
sed -i "s|href=\"https://\"|href=\"javascript:void(0)\"|g" testpage.dump # e.g. https://,
sed -i "s|<a href=\"https:\">https://</a>|<a href=\"javascript:void(0)\">https://</a>|g" testpage.dump # e.g. ("https://")
sed -i "s|<a href=\"https:/\">https://</a>|<a href=\"javascript:void(0)\">https://</a>|g" testpage.dump # e.g. "https://",
# ftp
_lineNumberftp=$(grep -n 'href="ftp://"' testpage.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumberhttp}s|href=\"ftp://\">(ftp://)(\))(</a>)|href=\"javascript:void(0)\">\1\3\2|g" testpage.dump # e.g. (ftp://),
sed -i -E "${_lineNumberhttp}s|href=\"ftp://\)\">(ftp://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" testpage.dump # e.g. (ftp://)
sed -i "s|href=\"ftp://\"|href=\"javascript:void(0)\"|g" testpage.dump # e.g. ftp://,
sed -i "s|<a href=\"ftp:\">ftp://</a>|<a href=\"javascript:void(0)\">ftp://</a>|g" testpage.dump # e.g. ("ftp://")
sed -i "s|<a href=\"ftp:/\">ftp://</a>|<a href=\"javascript:void(0)\">ftp://</a>|g" testpage.dump # e.g. ftp://
