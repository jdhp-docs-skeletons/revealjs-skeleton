#!/bin/sh

# The MIT License
#
# Copyright (c) 2016 Jérémie DECOCK <jd.jdhp@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


# SAFETY TESTS ################################################################

# TODO: assert "$(dirname "$0") == "$(pwd)"
#       ...


# LOAD VARIABLES ##############################################################

source ./meta.sh

echo "TODO_AUTHOR_NAME: ${TODO_AUTHOR_NAME}"
echo "TODO_AUTHOR_EMAIL: ${TODO_AUTHOR_EMAIL}"
echo "TODO_AUTHOR_WEB_SITE: ${TODO_AUTHOR_WEB_SITE}"
echo "TODO_COPYRIGHT_NOTICE: ${TODO_COPYRIGHT_NOTICE}"
echo "TODO_DOCUMENT_DATE: ${TODO_DOCUMENT_DATE}"
echo "TODO_INSTITUTE: ${TODO_INSTITUTE}"
echo "TODO_DOCUMENT_SUBJECT: ${TODO_DOCUMENT_SUBJECT}"
echo "TODO_DOCUMENT_KEYWORDS: ${TODO_DOCUMENT_KEYWORDS}"
echo "TODO_DOCUMENT_TITLE: ${TODO_DOCUMENT_TITLE}"
echo "TODO_DOCUMENT_SUBTITLE: ${TODO_DOCUMENT_SUBTITLE}"
echo "TODO_DOCUMENT_FILE_BASE_NAME: ${TODO_DOCUMENT_FILE_BASE_NAME}"
echo "TODO_DOCUMENT_WEB_SITE_URL: ${TODO_DOCUMENT_WEB_SITE_URL}"
echo "TODO_DOCUMENT_HTML_URL: ${TODO_DOCUMENT_HTML_URL}"
echo "TODO_DOCUMENT_PDF_URL: ${TODO_DOCUMENT_PDF_URL}"
echo "TODO_DOCUMENT_GITHUB_ACCOUNT: ${TODO_DOCUMENT_GITHUB_ACCOUNT}"
echo "TODO_DOCUMENT_GITHUB_REPOSITORY_NAME: ${TODO_DOCUMENT_GITHUB_REPOSITORY_NAME}"
echo "TODO_DOCUMENT_GITHUB_URL ${TODO_DOCUMENT_GITHUB_URL}"
echo "TODO_DOCUMENT_ISSUE_TRACKER_URL: ${TODO_DOCUMENT_ISSUE_TRACKER_URL}"
echo "TODO_HTML_TMP_DIR: ${TODO_HTML_TMP_DIR}"


# SETUP GIT ###################################################################

git remote rename origin skeleton
git remote add origin git@github.com:${TODO_DOCUMENT_GITHUB_ACCOUNT}/${TODO_DOCUMENT_GITHUB_REPOSITORY_NAME}.git
git push -u origin french-version

git submodule init
git submodule update


# MAKE SUBSTITUTIONS ##########################################################

sed -i "" \
    -e "s/TODO_AUTHOR_NAME/${TODO_AUTHOR_NAME}/g" \
    -e "s/TODO_AUTHOR_EMAIL/${TODO_AUTHOR_EMAIL}/g" \
    -e "s TODO_AUTHOR_WEB_SITE ${TODO_AUTHOR_WEB_SITE} g" \
    -e "s|TODO_COPYRIGHT_NOTICE|${TODO_COPYRIGHT_NOTICE}|g" \
    -e "s|TODO_DOCUMENT_DATE|${TODO_DOCUMENT_DATE}|g" \
    -e "s|TODO_INSTITUTE|${TODO_INSTITUTE}|g" \
    -e "s|TODO_DOCUMENT_SUBJECT|${TODO_DOCUMENT_SUBJECT}|g" \
    -e "s|TODO_DOCUMENT_KEYWORDS|${TODO_DOCUMENT_KEYWORDS}|g" \
    -e "s;TODO_DOCUMENT_TITLE;${TODO_DOCUMENT_TITLE};g" \
    -e "s;TODO_DOCUMENT_SUBTITLE;${TODO_DOCUMENT_SUBTITLE};g" \
    -e "s/TODO_DOCUMENT_FILE_BASE_NAME/${TODO_DOCUMENT_FILE_BASE_NAME}/g" \
    -e "s TODO_DOCUMENT_WEB_SITE_URL ${TODO_DOCUMENT_WEB_SITE_URL} g" \
    -e "s TODO_DOCUMENT_HTML_URL ${TODO_DOCUMENT_HTML_URL} g" \
    -e "s TODO_DOCUMENT_PDF_URL ${TODO_DOCUMENT_PDF_URL} g" \
    -e "s/TODO_DOCUMENT_GITHUB_ACCOUNT/${TODO_DOCUMENT_GITHUB_ACCOUNT}/g" \
    -e "s/TODO_DOCUMENT_GITHUB_REPOSITORY_NAME/${TODO_DOCUMENT_GITHUB_REPOSITORY_NAME}/g" \
    -e "s TODO_DOCUMENT_GITHUB_URL ${TODO_DOCUMENT_GITHUB_URL} g" \
    -e "s TODO_DOCUMENT_ISSUE_TRACKER_URL ${TODO_DOCUMENT_ISSUE_TRACKER_URL} g" \
    -e "s/TODO_HTML_TMP_DIR/${TODO_HTML_TMP_DIR}/g" \
    AUTHORS \
    meta.make \
    README.rst \
    .gitignore \
    main.html \
    content/title_page.md


# FIX TITLES UNDERLINE LENGTH IN RESTRUCTUREDTEXT FILES #######################

DOCUMENT_TITLE_UNDERLINE=$(echo "${TODO_DOCUMENT_TITLE}" | tr '[:print:]' '=')

sed -i "" \
    -e "s/^====$/${DOCUMENT_TITLE_UNDERLINE}/" \
    README.rst

