#!/bin/bash -eu

ROOT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

mkdir "$1"
cd "$1"

_GPU_ARCH="${GPU_ARCH:-pascal}"

SAVEOBJ=1 OBJNAME=./spmv.auto time "$ROOT_DIR"/../../regent.py "$ROOT_DIR"/../SpMV/Auto/spmv_sequential.rg -fflow 0 -fcuda 1 -fcuda-offline 1 -fcuda-arch "$_GPU_ARCH" -flog 1 -fparallelize-use-colocation 0 |& tee compile_auto

cp "$ROOT_DIR"/../../../bindings/regent/libregent.so .
cp "$ROOT_DIR"/*_spmv*.sh .
