#!/bin/bash

#find ~/dev/api-calls-sandbox -type f -regex '.*.properties'| xargs cat
eval export `find $(dirname $0) -type f -regextype posix-extended -regex "^(../|./|/).*(_env-)*.properties$" | xargs cat`