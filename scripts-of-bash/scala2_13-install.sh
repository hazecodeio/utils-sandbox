#!/bin/bash

suffix=2.13
sdk_home=/opt/_langs/scala/scala2.13-current
sdk_bin=$sdk_home/bin
dst=/usr/bin

find $sdk_bin -type f -regextype posix-extended -regex '(./|/).*' | grep --color -iE '[a-Z]+\.[a-Z]+$' -v | grep --color -iE '[a-Z]+$' -o | xargs echo -n | jq -R 'split(" ") | .[]' | sudo -- xargs -i update-alternatives --install $dst/{}$suffix {}$suffix $sdk_bin/{} 1
