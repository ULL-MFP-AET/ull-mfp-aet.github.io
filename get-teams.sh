#!/bin/bash
ORG="ULL-MFP-AET-2223"
TEAMS=$(gh org-teams -o "$ORG")
echo $TEAMS
