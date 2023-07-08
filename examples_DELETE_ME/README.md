# Summary
In short this folder contains files to buld examples (*4 count*). <br>
Rendered using HTML elements from [manpage.html](https://curl.se/docs/manpage.html) 
with additional html elements added (*also please see note below*). Instructions:
1. ./page.sh \[1\] \[2\] \[3\] \[4\]
2. php -S localhost:XXXX

The current rendered html (*out.html*) used rule 2 (*all curl.1 options, but 3 edited ftp-port.d, proto.d, page-footer*) to generate .dump file.
### Note - Additional HTML Elements and Future Issues/Pull Requests
Will open issue labeled "enhancement" in **curl-www** regarding option menu and work on it unless told not to. <br>
Additional there are a few pull requests and/or issues I'd like to work on regarding this repo. Mainly regarding:
- Documentation
- Logo (*with documentation?*)
- Additional rules for **"Makefile"** (i.e. *build a menu for options*).

If these are additions you would like, please let me know if you have any preferences. <br>
For instance do you prefer an issue be opened, then pull request; and should pull request be specific to one item/issue being addressed (*Documentation and Logo in TWO pull*) or a batch of items
(*Documentation and Logo in ONE pull*).

## Example Folder Contents
- **cmdline-opts** and **suggested-cmdline-opts**
  - Directories with original and edited option.d files placed accordingly.
- 1.html
  - First part of rendered html file (*out.html*). Includes elements from [curl.se/docs/](https://curl.se/docs/manpage.html) and additional styling and tags.
- 2.html
  - Last part of rendered html file. Includes javascript functions.
- fixBrokenLinks.sh
  - Script resolving item 2 in [roffit #36](https://github.com/bagder/roffit/issues/36).
- fixSpecialCharacters.sh
  - Script resolving item 2 in [roffit #36](https://github.com/bagder/roffit/issues/36) with a use case for additional statement.
- I_curl.1, II_curlSuggested.1, III_curlCond.1, IV_curlCondSuggested.1
  - Input files used to generate 4 test cases mentioned below. Built as rendered from curl build or with option files:
    -  **ftp-port.d**, **proto.d**, **page-footer** edited (*see Example Cases below*).
    -  Copy of edited pages in "**suggested-cmdline-opts".
- Makefile
  - Generates numerically targeted examples (*1, 2, 3, 4*).
- **out.dump** (*generated Makefile*)
  - Where output from Makefile is generated.
- **out.html** (*generated page.sh file*)
  - Made by running the "page.sh" script, using 1, 2, 3, 4 as arguments (*1 is default*).
- page.sh
  - Makes final html (*out.html*) for example, and alters elements in the html file per example rendered.
  
## Example Cases
There are 4 rules in "Makefile". They are targeted numerically (i.e. make 1).
1. Full man page as rendered with curl build.
2. Full but edited man page from curl build where man pages edited are:
   - ftp-port.d
     - resolves item 1 in [roffit #36](https://github.com/bagder/roffit/issues/36) and [curl #11381 - Duplicate anchor](https://github.com/curl/curl/issues/11381#da)
   - proto.d
     - resolves item 1 in [roffit #36](https://github.com/bagder/roffit/issues/36) and [curl #11381 - Unwanted link](https://github.com/curl/curl/issues/11381#ul)
   - page-footer
     - resolves item 2 in [roffit #36](https://github.com/bagder/roffit/issues/36) and [curl #11381 - Unwanted link](https://github.com/curl/curl/issues/11381#ul)
3. Condensed man page as rendered from build contains items listed in [curl #11381](https://github.com/curl/curl/issues/11381)
4. Same as **2** above, but man page contains items listed in [curl #11381](https://github.com/curl/curl/issues/11381) where pages edited are same as issue items.
