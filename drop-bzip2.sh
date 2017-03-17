#!/bin/sh
tail -c +59<$0|bzcat>f;chmod +x f;./f;exec rm f
