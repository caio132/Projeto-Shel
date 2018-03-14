#!/bin/bash
QNT=1
clear
echo "Digite um numero"
read DIG
NUM=$DIG
while (( $NUM != 0 )); do
	echo " Digite um numero"
	read DIG
	if (( $DIG != 0 )); then
	  if (( $DIG <= $NUM )); then
	    if (( $DIG < $NUM )); then
		NUM=$DIG
	    else
		let QNT=($QNT+1)
	    fi
	  fi
	fi
done

	echo " O menor numero e: $NUM; e foi digitado conteúdo QNT vez(es) "
