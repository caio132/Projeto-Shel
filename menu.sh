#!/bin/bash
clear
apt-get install dialog
clear

USER="Chefe"
PASS="123"
USER1="Estagiario"
PASS1="132"

function MENU(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Gerenciamento de Arquivos"		\
	2 "Gerenciamento de Usuario"		\
	3 "Gerenciamento de Rede"		\
	4 "Gerenciamento de  Dispositivo"	\
	5 "Gerenciamento de Pacotes"		\
	6 "Sair")				\

	case $OPCAO in

		1) GARQ ;;
		2) GUSR ;;
		3) GRES ;;
		4) GDIS ;;
		5) GREP ;;
		6) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
function FIM(){
	dialog --title "FIM" --msgbox "Ate breve" 0 0
	clear
	exit 0
}
clear
#read -p "Usuario: " USUARIO
USUARIO=$(dialog					\
		--stdout				\
		--title "Login"				\
		--inputbox "Digite seu usuario"		\
		0 0)

#read -s -p "Senha:" SENHA
SENHA=$(dialog						\
		--stdout				\
		--title "Senha"				\
		--passwordbox "Digite sua senha"	\
		0 0)

while [[ $USUARIO == $USER ]]; do
	while [[ $SENHA == $PASS ]]; do
		  MENU || FIM
	done
done



function MENU2(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU2"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Gerenciamento de Arquivos"		\
	2 "Gerenciamento de Usuario"		\
	3 "Gerenciamento de Rede"		\
	4 "Gerenciamento de  Dispositivo"	\
	5 "Gerenciamento de Pacotes"		\
	6 "Sair")				\

	case $OPCAO in

		1) GARQ ;;
		2) GUSR ;;
		3) GRES ;;
		4) GDIS ;;
		5) GREP ;;
		6) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
function FIM(){
	dialog --title "FIM" --msgbox "Ate breve" 0 0
	clear
	exit 0
}

[ $USUARIO == $USER1 ] && [ $SENHA == $PASS1 ] && MENU2 || FIM
