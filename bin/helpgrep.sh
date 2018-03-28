#!/bin/bash
local cmd=$1 opt=$2
${cmd} --help | grep -e "$opt"
