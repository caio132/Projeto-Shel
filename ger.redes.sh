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
ip addr > /tmp/lsredes.txt
dialog --textbox /tmp/lsredes.txt 0 0
GRES
}
function LRPEC(){
NOME=$(dialog --stdout --inputbox "Coloque a interface da rede (Ex. eth0 ; eth1)" 0 0)
ifconfig $NOME > /tmp/lisconf.txt
dialog --textbox /tmp/lisconf.txt 0 0
GRES
}
function CRMA(){
INT=$(dialog --stdout --inputbox "Coloque a interface da rede (Ex. eth0; eth1)" 0 0)
echo "##########################################################################"
echo "auto $INT" >> /etc/network/interfaces
echo "allow-hotplug $INT" >> /etc/network/interfaces
echo "iface $INT inet static" >> /etc/network/interfaces
IP=$(dialog --stdout --inputbox "Coloque o IP da rede: " 0 0)
echo "address $IP" >> /etc/network/interfaces
NETM=$(dialog --stdout --inputbox "Coloque o Netmask da rede: " 0 0)
echo "netmask $NETM" >> /etc/network/interfaces
NETW=$(dialog --stdout --inputbox "Coloque o Network da rede: " 0 0)
echo "network $NETW" >> /etc/network/interfaces
BROA=$(dialog --stdout --inputbox "Coloque o Broadcast da rede: " 0 0)
echo "broadcast $BROA" >> /etc/network/interfaces
echo "#########################################################################"
dialog --title "Informação" --msgbox "Nova rede feita com sucesso" 0 0
dialog --title "Informação" --yesno "Deseja ver as alterações feitas? " 0 0
if [[ $? == '0' ]]; then
	dialog --title "Informação" --textbox /etc/network/interfaces 0 0
	GRES
else
	GRES
fi
}
function DPRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Desativar rede" 0 0)
ifconfig $NOME down
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Rede desativada com sucesso" 0 0
else
	dialog --title "Informação" --msgbpx "Erro, Tente novamente" 0 0
	DPRE
fi
GRES
}
function APRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Ativar rede" 0 0)
ifconfig $NOME up
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Rede ativada com sucesso" 0 0
else
	dialog --title "Informação" --msgbpx "Erro, Tente novamente" 0 0
	APRE
fi
GRES
}
function MMAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome da rede" 0 0)
MAC=$(dialog --stdout --title "Nome" --inputbox "Digite o novo MAC" 0 0 )
ifconfig $NOME hw ether $MAC
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Mudança de MAC com sucesso" 0 0
else
	dialog --title "Informação" --msgbox "Erro, Tente Novamente" 0 0
	MAC
fi
GRES
}
function RSIS(){
/etc/init.d/networking restart
dialog --title "Informação" --msgbox "Sistema reiniciado com sucesso" 0 0
GRES
}
GRES(){
OPCAO=$(dialog					      \
	--stdout				      \
	--title "Menu"				      \
	--menu "Escolha uma opção"		      \
	0 0 0 					      \
	1 "Listar redes"			      \
	2 "Listar rede especifica"		      \
	3 "Configurar rede manualmente"		      \
	4 "Desativar placa de rede"		      \
	5 "Ativar placa de rede"		      \
	6 "Mudar MAC"				      \
	7 "Reiniciar Sistema"			      \
	8 "Voltar")				      \

	case $OPCAO in

		1) LRES ;;
		2) LRPEC ;;
		3) CRMA ;;
		4) DPRE ;;
		5) APRE ;;
		6) MMAC ;;
		7) RSIS ;;
		8) MENU ;;

	esac
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
