#!/bin/sh
exit 1
ls |awk '{ORS=":"D}tolower($0) !~ /(work|share|wang|backup|misc|lab)/ {print "/"$1} END{ORS="\n"; print ""}'