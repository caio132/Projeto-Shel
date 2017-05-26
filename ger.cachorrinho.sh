#!/bin/bash
MENU(){
OPCAO=$(dialog				\
	--stdout			\
	--title 'Menu'			\
	--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Gerenciar Arquivos'		\
	2 'Sair'			)
	case $OPCAO in
		1) GRES ;;
		2) FIM ;;
		*) exit 0
	esac
}
function GRES(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU"				\
	--menu "Escolha uma opção"		\
	0 0 0 					\
	1 "Listar redes"			\
	2 "Listar rede especifica"		\
	3 "Configurar rede manualmente"		\
	4 "Desativar placa de rede"		\
	5 "Ativar placa de rede"		\
	6 "Mudar MAC"				\
	7 "Reiniciar Sistema"			\
	8 "Adicionar nova rede" 		\
	9 "Sair")

	case $OPCAO in

		1) LRES ;;
		2) LREES ;;
		3) CRMA ;;
		4) DPRE ;;
		5) APRE ;;
		6) MMAC ;;
		7) RSIS ;;
		8) ARED ;;
		9) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
FIM(){
	dialog --title "FIM" --msgbox "Ate breve" 0 0
	clear
	exit 0
}

GARQ=$(){
function LRES(){
ip addr > /tmp/lsredes.txt
dialog --textbox /tmp/lsredes.txt 0 0
GRES
}

function LREES(){
NOME=$(dialog --stdout --title "Rede" --inputbox "Digite o nome da rede que você deseja listar" 0 0)
ifconfig $NOME > /tmp/lisconf.txt
dialog --textbox /tmp/lisconf.txt 0 0
GRES
}

function CRMA(){
NOME=$(dialog --stdout --title "Rede" --inputbox "Digite o nome da rede que você deseja configurar" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
IP=$(dialog --stdout --title "Rede" --inputbox "Digite o nome do IP Adrress da sua rede" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
MASCARA=$(dialog --stdout --title "Rede" --inputbox "Digite o nome da Máscara da sua rede" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
ifconfig $NOME $IP netmask $MASCARA
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Rede alterada com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	CRMA
fi
GRES
}
function DPRE(){
NOME=$(dialog --stdout --title "Rede" --inputbox "Digite o nome da rede que deseja desativar" 0 0)
ifconfig eth0 down
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Rede desativada com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	DPRE
fi
GRES
}

function APRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome da rede que você deseja ativar" 0 0)
ifconfig eth0 up
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Rede ativada com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	APRE
fi
GRES
}

function MMAC(){
NOME=$(dialog --stdout --title "Rede" --inputbox "Digite o Nome da rede" 0 0)
MAC=$(dialog --stdout --title "Rede" --inputbox "Digite o novo MAC" 0 0)
ifconfig $NOME hw ether $MAC
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'MAC alterado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	MMAC
fi
GRES
}

function RSIS(){
/etc/init.d/networkin restart
dialog --title "Informação" --msgbox "Sistema reiniciado com sucesso" 0 0
GRES
}
function ARED(){


GRES
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
