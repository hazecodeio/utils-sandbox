#!/bin/bash

suffix=21
sdk_home=/opt/langs/java/jdk21-current
sdk_bin=$sdk_home/bin

find $sdk_bin -type f -regextype posix-extended -regex '(./|/).*' | grep --color -iE '[a-Z]+\.[a-Z]+$' -v | grep --color -iE '[a-Z]+$' -o | xargs echo -n | jq --arg suffix $suffix -R 'split(" ") | .[]' | sudo -- xargs -i update-alternatives --remove-all {}$suffix
