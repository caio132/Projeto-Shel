#!/bin/bash

TEMP=1

MENU(){
OPCAO=$(dialog				\
	--stdout			\
	--title 'Menu'			\
	--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Gerenciar Pacotes'		\
	2 'Sair'			)
	case $OPCAO in
		1) GREP ;;
		2) FIM ;;
		*) exit 0
	esac
}
function IPAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do pacote a ser instalado" 0 0)
apt-get install $NOME
dialog --title "Informação" --msgbox "Pacote instalado com sucesso" 0 0
GREP
}
function DPAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do pacote a ser desinstalado" 0 0)
apt-get remove $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Pacote desinstalado com sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Pacote não encontrado" 0 0
fi
GREP
}
function AREP(){
apt-get dist-upgrade 
dialog --title "Informação" --msgbox "Sistema atualizado com sucesso" 0 0
GREP
}
function LSPA(){
apt list --installed | cat -n /tmp/lispar.txt > /tmp/lispar.txt
dialog --textbox /tmp/lispar.txt 0 0
GREP
}
function APA(){
apt-get update 
dialog --title "Informação" --msgbox "Atualização Completa" 0 0
GREP
}
GREP(){
OPCAO=$(dialog						\
	--stdout 					\
	--title "MENU"					\
	--menu "Escolha uma opção"			\
	0 0 0						\
	1 "Instalar pacote"				\
	2 "Desinstalar pacote"				\
	3 "Atualizar sistema" 				\
	4 "Listar pacotes"				\
	5 "Atualizar pacotes"				\
	6 "Voltar")

	case $OPCAO in

		1) IPAC    ;;
		2) DPAC	   ;;
		3) AREP    ;;
		4) LSPA    ;;
		5) APA     ;;
	        6) MENU    ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GREP ;;
	esac
}

while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
