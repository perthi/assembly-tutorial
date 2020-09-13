#!/bin/bash
#nasm -felf64 main.asm

if [ $# -ne 1 ]; then
    echo "Usage:" $0  " [filename]" 
else
    echo "ONE =  " $1
    asmfile=$1
    exename="${1%%.*}"
    obj=${exename}.o
fi



echo "filename = " $filename


nasm -f elf64 $asmfile  && gcc -static  $obj -o $exename  

./$exename
