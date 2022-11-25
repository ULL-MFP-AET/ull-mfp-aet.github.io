#!/bin/bash
set -e
# install gh-org-commits extension
DATE="2022-11-20"
lab="profile"
ORG=ULL-MFP-AET-2223
gh org-commits -f _data/team-names.txt -d $DATE -l $lab -o $ORG
