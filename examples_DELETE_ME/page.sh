#!/bin/bash

if [ -z "$1" ]
then
  _make="1"
else
  _make="$1"
fi

make $_make
cat out.dump > temp.txt
cat 1.html > out.html
cat 2.html >> temp.txt
cat temp.txt >> out.html
rm temp.txt

# Hide page quick links.
if [ $_make == "3" ]
then
  sed -i "s|addOptionLinks();| //addOptionLinks();|" out.html
elif [ $_make == "4" ]
then
  sed -i "s|addOptionLinks();| //addOptionLinks();|" out.html
fi

# Show expanded Quick link menu.
if [ $_make == "2" ]
then
  sed -i "s|id=\"curlSuggestedOut\" style=\"display:none\"|id=\"curlSuggestedOut\" style=\"display:block\"|" out.html
elif [ $_make == "4" ]
then
  sed -i "s|id=\"curlSuggestedOut\" style=\"display:none\"|id=\"curlSuggestedOut\" style=\"display:block\"|" out.html
fi
