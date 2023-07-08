#!/bin/bash

_lineNumber=$(grep -n "&quot;\<a " out.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumber}s|(href=\")([^\"]*)(&quot;)|\1\2|g" out.dump
_lineNumberhttp=$(grep -n '("\>http://' out.dump | cut -d ":" -f 1)
sed -i "${_lineNumberhttp}s|)\">http://|\" data-null-http=\"1\">http://|g" out.dump
_nullhttp=$(grep -n 'data-null-http=\"1\"' out.dump | cut -d ":" -f 1)
sed -i -E "${_nullhttp}s|href=\"([^\"]*)\" data-null-http=\"1\"|href=\"javascript:void(0)\" data-null-http=\"0\"|g" out.dump
_lineNumberhttp=$(grep -n 'href="http://"' out.dump | cut -d ":" -f 1)
sed -i "${_lineNumberhttp}s|href=\"http://\"|href=\"javascript:void(0)\"|g" out.dump
_lineNumberftp=$(grep -n '("\>ftp://' out.dump | cut -d ":" -f 1)
sed -i "${_lineNumberftp}s|)\">ftp://|\" data-null-link=\"1\">ftp://|g" out.dump
_nullftp=$(grep -n 'data-null-link=\"1\"' out.dump | cut -d ":" -f 1)
sed -i -E "${_nullftp}s|href=\"([^\"]*)\" data-null-link=\"1\"|href=\"javascript:void(0)\" data-null-link=\"0\"|g" out.dump
_lineNumberftp=$(grep -n 'href="ftp://"' out.dump | cut -d ":" -f 1)
sed -i "${_lineNumberftp}s|href=\"ftp://\"|href=\"javascript:void(0)\"|g" out.dump

