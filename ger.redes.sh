#!/bin/bash

TEMP=1

MENU(){
OPCAO=$(dialog				\
	--stdout			\
	--title 'Menu'			\
	--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Gerenciar Redes'		\
	2 'Sair'			)
	case $OPCAO in
		1) GRES ;;
		2) FIM ;;
		*) exit 0
	esac
}
function LRES(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}
function LRPEC(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}
function CRMA(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}
function DPRE(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}
function APRE(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}
function VRFI(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}
function MMAC(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}
function RSIS(){
dialog --title "Menu" --msgbox "estamos em construção"
GRES
}

function GRES(){
OPCAO=$(dialog					      \
	--stdout				      \
	--title "MENU"				      \
	--menu "Escolha uma opção"		      \ 
	0 0 0 					      \
	1 "Listar redes"			      \
	2 "Listar rede especifica"		      \
	3 "Configurar rede manualmente"		      \
	4 "Desativar placa de rede"		      \
	5 "Ativar placa de rede"		      \
	6 "Visualizar redes fisicas "		      \
	7 "Mudar MAC"				      \
	8 "Reiniciar Sistema"			      \
	9 "Voltar")				      \
	
	case $OPCAO in
	
		1) LRES ;;
		2) LRPEC ;;
		3) CRMA ;;
		4) DPRE ;;
		5) APRE ;;
		6) VRFI ;;
		7) MMAC ;;
		8) RSIS ;;
		9) MENU ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
