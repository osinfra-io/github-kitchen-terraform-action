#!/bin/sh -l

git config credential.helper store
git config --global --replace-all url.https://github.com/.insteadOf ssh://git@github.com/
git config --global --add url.https://github.com/.insteadOf git@github.com:

python /test.py $1
