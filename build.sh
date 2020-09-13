#!/bin/bash
#nasm -felf64 main.asm

if [ $# -le 0 ]; then
    echo  "le = " $#
    echo "Usage:" $0  " [filename]  [cpp source] (optional)  where \"filename\" is an .asm file"
    exit
else
    asmfile=$1
    exename="${1%%.*}"
    obj=${exename}.o
fi


if [ $# -eq 2 ]; then
    csource=$2
    cobj="${2%%.*}".o
fi


nasm -f elf64 $asmfile

ret=$?

if [ $ret -ne 0 ]; then
    echo "Error assemling " $asmfile "( ret = " $ret " )"
else
    if [ $# -eq 1 ]; then
        gcc -static  $obj -o $exename
    elif [  $# -eq 2 ]; then
        gcc -static  $csource   $obj -o $exename 
    fi

    ret=$?
    if [ $ret -ne 0 ]; then 
        echo "GCC error"
    else
        ./$exename  
    fi
    
fi

