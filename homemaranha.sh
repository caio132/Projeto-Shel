#!/bin/bash
MENU(){
OPCAO=$(dialog				\
	--stdout			\
	--title 'Menu'			\
	--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Gerenciar REDE'		\
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
	6 "Visualizar redes fisicas "		\
	7 "Mudar MAC"				\
	8 "Reiniciar Sistema"			\
	9 "Adicionar nova rede" 		\
	10 "Sair")

	case $OPCAO in

		1) LRES ;;
		2) LREES ;;
		3) CRMA ;;
		4) DPRE ;;
		5) APRE ;;
		6) VRFI ;;
		7) MMAC ;;
		8) RSIS ;;
		9) ARED ;;
		10) FIM ;;
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
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
ifconfig $NOME > /tmp/lisconf.txt
dialog --textbox /tmp/lisconf.txt 0 0
GRES
}

function CRMA(){
NOME=$(dialog --stdout --title "Nome" --inputbox "" 0 0)

dialog --title "Informação" --msgbox "" 0 0
GRES
}

function DPRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Desativar rede" 0 0)
ifconfig eth0 down
dialog --title "Informação" --msgbox "Rede desativada com sucesso" 0 0
GRES
}

function APRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Ativar rede" 0 0)
ifconfig eth0 up
dialog --title "Informação" --msgbox "Rede ativada com sucesso" 0 0
GRES
}

function VRFI(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)

dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}

function MMAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)

dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}

function RSIS(){
/etc/init.d/networkin restart
dialog --title "Informação" --msgbox "Sistema reiniciado com sucesso" 0 0
GRES
}
function ARED(){
INT=$(dialog --stdout --inputbox 'Coloque a interfade da rede (Ex.: eth0, eth1)' 0 0)
echo "########################################################################" >> /etc/network/interfaces
echo "auto $INT" >> /etc/network/interfaces
echo "allow-hotplug $INT" >> /etc/network/interfaces
echo "iface $INT inet static" >> /etc/network/interfaces
IP=$(dialog --stdout --inputbox "Coloque o IP da rede:" 0 0)
echo "address $IP" >> /etc/network/interfaces
NETM=$(dialog --stdout --inputbox "Coloque o Netmask da rede:" 0 0)
echo "netmask $NETM" >> /etc/network/interfaces
NETW=$(dialog --stdout --inputbox "Coloque o Network da rede:" 0 0)
echo "network $NETW" >> /etc/network/interfaces
BROA=$(dialog --stdout --inputbox "Coloque o Broadcast da rede:" 0 0)
echo "broadcast $BROA" >> /etc/network/interfaces
echo "########################################################################" >> /etc/network/interfaces
dialog --tilte 'Informação' --msgbox 'Nova rede feita com sucesso' 0 0
dialog --title 'Informação' --yesno 'Deseja ver as alterações feitas?' 0 0
if [ $? == 0 ]; then
	dialog --title 'Informação' --textbox /etc/network/interfaces 0 0
	GRES
else
	GRES
fi
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
