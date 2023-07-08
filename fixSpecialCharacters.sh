#!/bin/bash

echo For best results enter 1 and change \"fixSpecialCharacters.sh\" accordingly.
echo \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\**\*\*\*\*\*\*\*\*
echo 1 \= options with special characters present
echo 0 \= no options with special characters present
echo \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\**\*\*\*\*\*\*\*\*
echo ""
read _hasSpecialChar
_hasOptWithSpecialChar="$_hasSpecialChar"

# Uncomment and format as 1, 2 pair where 1 is full option and 2 is what will be in anchor.
#_optWithSpecialChar=("-#full, --options" "-whatTouseInstead" "-!repeat, --option" "-pattern")
# As used with curl manpage.html example.
#_optWithSpecialChar=("-:, --next" "--next" "-\&#35;, --progress-bar" "--progress-bar")

# Default to this array if 0.
_defaultSpecialChar=("-\`" "-backtick" "-\~" "-tilde" "-\!" "-explamation-mark" "-\@" "-aperand" "-\#" "-hash" "-\&\#35;" "-hash" "-\$" "-dollar-sign" "-\%" "-percent-sign" "-^" "-caret" "-\&" "-ampersand" "-\&amp;" "-ampersand" "-\*" "-asterisk" "-(" "-open-parenthesis" "-)" "-close-parenthesis" "--" "-dash" "-=" "-equal-sign" "-\[" "-open-bracket" "-\]" "-close-bracket" "-{" "-open-curly" "-}" "-close-curly" "-\;" "-semicolon" "-\:" "-colon" "-\|" "-vertical-bar" "-<" "-less-than" "-\&lt;" "-less-than" "->" "-greater-than" "-\&gt;" "-greater-than" "-," "-comma" "-." "-period" "-\/" "-slash" "-?" "-question-mark")

if [ $_hasOptWithSpecialChar -eq 1 ]
then
  if [ -v _optWithSpecialChar ]
  then
    _length=${#_optWithSpecialChar[@]}
    for ((i = 0; i<_length; i+=2))
    do
      _curElement=${_optWithSpecialChar[i]}
      _replaceWith=${_optWithSpecialChar[i+1]}
      sed -i "s|<a name=\"-\"></a><span class=\"nroffip\">$_curElement</span>|<a name=\"$_replaceWith\"></a><span class=\"nroffip\">$_curElement</span>|g" out.dump
      sed -i "s|<a class=\"emphasis\" href=\"#-\">$_curElement</a>|<a class=\"emphasis\" href=\"#$_replaceWith\">$_curElement</a>|g" out.dump
    done
  else
    _length=${#_defaultSpecialChar[@]}
    for ((i = 0; i<_length; i+=2))
    do
      _curElement=${_defaultSpecialChar[i]}
      _replaceWith=${_defaultSpecialChar[i+1]}
      sed -i "s|<a name=\"-\"></a><span class=\"nroffip\">$_curElement|<a name=\"$_replaceWith\"></a><span class=\"nroffip\">$_curElement|g" out.dump
      sed -i "s|<a class=\"emphasis\" href=\"#-\">$_curElement|<a class=\"emphasis\" href=\"#$_replaceWith\">$_curElement|g" out.dump
    done
  fi
fi

# Any additional statements for issues unique to html output.
#sed -i "s|<span Class=\"emphasis\">-\&\#35;, --progress-bar</span>|<a class=\"emphasis\" href=\"#--progress-bar\">-\&#35;, --progress-bar</a>|g" out.dump
