#!/usr/bin/python3
import os
import yaml
import subprocess
import sys

test_dir = "./kitchen-terraform/test/fixtures/ecs_service"

test_files = []

for root, dirs, files in os.walk(os.path.abspath(test_dir)):
    for file in files:
        filepath = os.path.join(root, file)
        test_files.append(filepath)


for i in test_files:
    with open('/kitchen-tmpl.yml') as stream:
        data = yaml.safe_load(stream)
        data['driver']['variable_files'][0] = i
        print("## Running for {} file ##".format(i))

# create kitchen.yml with test tfvars file
        with open('kqb') as kitchen:
            yaml.safe_dump(data, kitchen, default_flow_style=False,
                           explicit_start=True, allow_unicode=True, encoding='utf-8')
        kitchen.close()

#run kitchen tests
        subprocess.call(['bundle', 'exec', 'kitchen', sys.argv[1]])
        stream.close()




