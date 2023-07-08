##########################################################################
#
# Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
#
# This software is licensed as described in the file LICENSE, which
# you should have received as part of this distribution.
#
# You may opt to use, copy, modify, merge, publish, distribute and/or sell
# copies of the Software, and permit persons to whom the Software is
# furnished to do so, under the terms of the COPYING file.
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
# KIND, either express or implied.
#
# SPDX-License-Identifier: curl
#
##########################################################################
# default installation directory
INSTALLDIR=/usr/local/bin

install:
	cp ../roffit $(DESTDIR)$(INSTALLDIR)

1:
	@perl ../roffit --bare < I_curl.1 > out.dump		
	@./fixSpecialCharacters.sh
	@./fixBrokenLinks.sh
	@if test -f out.dump; then \
	  echo "SUCCESS"; \
	fi

2:
	@perl ../roffit --bare < II_curlSuggested.1 > out.dump		
	@./fixSpecialCharacters.sh
	@./fixBrokenLinks.sh
	@if test -f out.dump; then \
	  echo "SUCCESS"; \
	fi
	
3:
	@perl ../roffit --bare < III_curlCond.1 > out.dump
	@./fixSpecialCharacters.sh
	@./fixBrokenLinks.sh
	@if test -f out.dump; then \
	  echo "SUCCESS"; \
	fi	
	
4:
	@perl ../roffit --bare < IV_curlCondSuggested.1 > out.dump
	@./fixSpecialCharacters.sh
	@./fixBrokenLinks.sh
	@if test -f out.dump; then \
	  echo "SUCCESS"; \
	fi	