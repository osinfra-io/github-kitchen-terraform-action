#!/usr/bin/env bash

cp /kitchen-tmpl.yml kitchen-terraform/
cp /test.py kitchen-terraform/
pushd kitchen-terraform/

python test.py $1

