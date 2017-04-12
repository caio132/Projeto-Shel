#!/bin/bash
USER="Caio"
PASS="123"
function GARQ(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU
}
function GUSR(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU
}
function GERD(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU
}
function GDIS(){
	clear
	dialog --title "Construção." --msgbox "Estamos em construção" 0 0
	MENU
}
function GREP(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU
}
function MENU(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Gerenciar Arquivos"			\
	2 "Gerenciar Usuario"			\
	3 "Gerenciar Rede"			\
	4 "Gerenciar Dispositivo"		\
	5 "Gerenciar Repositorio"		\
	6 "Sair")				\
	
	case $OPCAO in
	
		1) GARQ ;;
		2) GUSR ;;
		3) GRED ;;
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
		--title "Login"				\
		--passwordbox "Digite sua senha"	\
		0 0)

[ $USUARIO == $USER ] && [ $SENHA == $PASS ] && MENU || FIM
