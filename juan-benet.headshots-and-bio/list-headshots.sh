#!/bin/sh

tmpl='"<a href=\"./"$0"\"><img width=\"400px\" src=\"./"$0"\" /></a>"'
ls | egrep "(jpg|png|gif)" | awk "\$0=$tmpl"
