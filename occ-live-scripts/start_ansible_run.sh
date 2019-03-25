#!/bin/bash

PWD=$(pwd)
ansible-playbook ${PWD}/ansible-files/oct-docker-stack/main.yml --extra-vars "dockerfile_locs=${PWD}/docker-files" -vvv
