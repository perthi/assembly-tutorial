#!/bin/bash
#nasm -felf64 main.asm

if [ $# -ne 1 ]; then
    echo "Usage:" $0  " [filename] where \"filename\" is an .asm file"
    exit
else
    echo "ONE =  " $1
    asmfile=$1
    exename="${1%%.*}"
    obj=${exename}.o
fi



echo "filename = " $filename


nasm -f elf64 $asmfile

ret=$?

if [ $ret -ne 0 ]; then
    echo "Error assemling " $asmfile "( ret = " $ret " )"
else
    gcc -static  $obj -o $exename  
    ./$exename
fi
