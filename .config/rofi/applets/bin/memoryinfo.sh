#!/bin/bash

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
info=$(free -h | awk 'NR!=1 {print $0}')
mem_total=$(echo $info | grep MeM: | awk '{print $2}')

