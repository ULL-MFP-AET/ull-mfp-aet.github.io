#!/bin/bash
ORG="ULL-MFP-AET-2324"
TEAMS=$(gh org-teams -o "$ORG")
echo $TEAMS
