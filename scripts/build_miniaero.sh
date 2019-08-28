#!/bin/bash

set -e

root_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

mkdir "$1"
cd "$1"

_GPU_ARCH=${GPU_ARCH:-pascal}

SAVEOBJ=1 time $root_dir/../../regent.py $root_dir/../MiniAero/Manual/miniaero.rg -fflow 0 -fopenmp 0 -fcuda 1 -fcuda-offline 1 -fcuda-arch "$_GPU_ARCH" -flog 1  2>&1 | tee compile_manual
mv miniaero miniaero.manual

SAVEOBJ=1 time $root_dir/../../regent.py $root_dir/../MiniAero/Auto/miniaero_sequential.rg  -fflow 0 -fopenmp 0 -fcuda 1 -fcuda-offline 1 -fcuda-arch "$_GPU_ARCH" -flog 1 -fparallelize-use-colocation 0  2>&1 | tee compile_auto
mv miniaero_sequential miniaero.auto

cp $root_dir/../../../bindings/regent/libregent.so .
mv $root_dir/../MiniAero/Manual/libminiaero.so .
mv $root_dir/../MiniAero/Auto/libminiaero_sequential.so .

cp $root_dir/*_miniaero*.sh .
