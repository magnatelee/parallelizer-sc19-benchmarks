#!/bin/bash

set -e

root_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

mkdir "$1"
cd "$1"

_GPU_ARCH=${GPU_ARCH:-pascal}

SAVEOBJ=1 STANDALONE=1 OBJNAME=./pennant.manual time $root_dir/../../regent.py $root_dir/../PENNANT/Manual/pennant.rg -fflow 0 -fopenmp 0 -fcuda 1 -fcuda-offline 1 -fcuda-arch "$_GPU_ARCH" -flog 1  |& tee compile_manual

SAVEOBJ=1 STANDALONE=1 OBJNAME=./pennant.auto   time $root_dir/../../regent.py $root_dir/../PENNANT/Auto/pennant_sequential.rg -fflow 0 -fcuda 1 -fcuda-offline 1 -fcuda-arch "$_GPU_ARCH" -flog 1 -fparallelize-use-colocation 0  |& tee compile_auto

cp $root_dir/*_pennant*.sh .
