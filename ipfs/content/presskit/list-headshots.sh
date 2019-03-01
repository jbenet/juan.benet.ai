#!/bin/sh

tmpl='"<a href=\"./"$0"\"><img width=\"400px\" src=\"headshots/"$0"\" /></a>"'
ls headshots | egrep "(jpg|png|gif)" | awk "\$0=$tmpl"
