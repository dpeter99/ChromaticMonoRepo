#!/bin/bash
 
NAME=$(basename "$0")
NAME=${NAME%.*}.exe
TOOLCHAIN_BINDIR=external/x86_64-elf-gcc/bin
 
exec "${TOOLCHAIN_BINDIR}"/"${NAME}" "$@"