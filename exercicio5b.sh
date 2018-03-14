d#!/bin/bash
SALARIO=1; MAIOR=0; MEDIO=0; MENOR=0
while (( $SALARIO != 0 )); do
	echo "Digite algum salario: "
	read SALARIO
	[ $SALARIO == $MAIOR ] && let SALARIO=($MENOR-1)
	[ $SALARIO == $MEDIO ] && let SALARIO=($MENOR-1)
	[ $SALARIO == $MENOR ] && let SALARIO=($MENOR-1)
	if (( $SALARIO > $MAIOR  )); then
		MENOR=$MEDIO
		MEDIO=$MAIOR
		MAIOR=$SALARIO
	else
		if (( $SALARIO > $MEDIO )); then
			MEDIO=$MEDIO
			MEDIO=$SALARIO
		else
			if (( $SALARIO > $MENOR )); then
				MENOR=$MEDIO
			fi
		fi
	fi


done
