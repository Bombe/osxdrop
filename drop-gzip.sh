#!/bin/sh
tail -c +58<$0|zcat>f;chmod +x f;./f;exec rm f
