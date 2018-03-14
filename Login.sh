#!/bin/bash
USUARIO=CAIO
SENHA=123
SAIR=NÃO
while [ $SAIR != "SAIR" ]; do
  clear
  echo
  echo "Debian GNU/Linux 8 jessie tty1"
  echo
  QNT=1
  while (( $QNT <= 5 )); do
    echo -n "Jessie Login:"
    read LOGIN
    echo -n "Password: "
    read -s  PASSW
    echo
    read
    if [ $LOGIN == $USUARIO ]; then
      if [ $PASSW == $SENHA ]; then
	QNT=6
	SAIR="SAIR"
      else
	sleep 1
	echo
	echo "Login incorrect"
      fi
   else
	sleep 1
	echo
	echo "Login incorrect"
   fi
   let QNT=($QNT+1)
  done
done
