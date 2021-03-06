include meta.make

###############################################################################

SUBDIRS = figs

SRCFILES = Makefile \
           main.html \
           content/*.md

.PHONY : all clean init open pdf jdhp publish $(SUBDIRS)

all: open


# SUBDIRS #####################################################################

$(SUBDIRS):
	$(MAKE) --directory=$@


# OPEN IN WEB BROWSER #########################################################

# TODO: follow the full setup procedure (with NodeJS) described there
#       https://github.com/hakimel/reveal.js/#full-setup

# Inspired by https://git.kernel.org/cgit/git/git.git/tree/config.mak.uname
# See also http://stackoverflow.com/questions/3466166/

# If uname not available then UNAME_S is set to 'unknown' 
UNAME_S := $(shell sh -c 'uname -s 2>/dev/null || echo unknown')

open: html
# Linux ###############################
# See: http://askubuntu.com/questions/8252/
ifeq ($(UNAME_S),Linux)
	@xdg-open main.html
endif

# MacOSX ##############################
ifeq ($(UNAME_S),Darwin)
	@open -a firefox main.html
	#open -a Google\ Chrome main.html
endif

# Windows #############################
ifneq (,$(findstring CYGWIN,$(UNAME_S)))
	@#start chrome  main.html
	@start firefox  main.html
endif
ifneq (,$(findstring MINGW32,$(UNAME_S)))
	@#start chrome  main.html
	@start firefox  main.html
endif
ifneq (,$(findstring MSYS,$(UNAME_S)))
	@#start chrome  main.html
	@start firefox  main.html
endif


## MAKE DOCUMENT ##############################################################

# HTML ############

html: $(SRCFILES) $(SUBDIRS)

# PDF #############

pdf: $(FILE_BASE_NAME).pdf

# TODO: follow the full setup procedure (with NodeJS) described there
#       https://github.com/hakimel/reveal.js/#full-setup

$(FILE_BASE_NAME).pdf: $(SRCFILES) $(SUBDIRS)
	@echo "Not fully available yet"           # TODO
# Linux ###############################
# See: http://askubuntu.com/questions/8252/
ifeq ($(UNAME_S),Linux)
	@xdg-open main.html?print-pdf
endif

# MacOSX ##############################
ifeq ($(UNAME_S),Darwin)
	@open -a Google\ Chrome main.html?print-pdf
endif

# Windows #############################
ifneq (,$(findstring CYGWIN,$(UNAME_S)))
	@start chrome  main.html?print-pdf
endif
ifneq (,$(findstring MINGW32,$(UNAME_S)))
	@start chrome  main.html?print-pdf
endif
ifneq (,$(findstring MSYS,$(UNAME_S)))
	@start chrome  main.html?print-pdf
endif


# PUBLISH #####################################################################

publish: jdhp

publish-html: jdhp-html

publish-pdf: jdhp-pdf

jdhp: jdhp-html
#jdhp: jdhp-html jdhp-pdf     # TODO

jdhp-html: html
	# JDHP_DOCS_URI is a shell environment variable that contains the
	# destination URI of the HTML files.
	@if test -z $$JDHP_DOCS_URI ; then exit 1 ; fi
	
	# Copy HTML
	@rm -rf $(HTML_TMP_DIR)/
	@mkdir $(HTML_TMP_DIR)/
	cp -v main.html $(HTML_TMP_DIR)/
	cp -vr content $(HTML_TMP_DIR)/
	cp -vr style $(HTML_TMP_DIR)/
	cp -vr figs $(HTML_TMP_DIR)/
	rm -rf $(HTML_TMP_DIR)/figs/logos
	
	# Upload the HTML files
	rsync -r -v -e ssh $(HTML_TMP_DIR)/ ${JDHP_DOCS_URI}/$(FILE_BASE_NAME)/
	
jdhp-pdf: $(FILE_BASE_NAME).pdf
	## JDHP_DL_URI is a shell environment variable that contains the destination
	## URI of the PDF files.
	#@if test -z $$JDHP_DL_URI ; then exit 1 ; fi
	#
	## Upload the PDF file
	#rsync -v -e ssh $(FILE_BASE_NAME).pdf ${JDHP_DL_URI}/pdf/


## CLEAN ######################################################################

clean:
	@echo "Remove generated files"
	@rm -rvf $(HTML_TMP_DIR)/
	$(MAKE) clean --directory=figs

init: clean
	@echo "Remove target files"
	@rm -f $(FILE_BASE_NAME).pdf
