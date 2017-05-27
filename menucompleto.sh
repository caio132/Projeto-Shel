#!/bin/bash

function MENU(){
OPCAO=$(dialog					              \
	--stdout				                    \
	--title "MENU"				              \
	--menu "Escolha uma opção"		      \
	0 0 0					                      \ 
	1 "Gerenciamento de Arquivos"		    \
	2 "Gerenciamento de Usuario"		    \
	3 "Gerenciamento de Rede"		        \
	4 "Gerenciamento de  Dispositivo"	  \
	5 "Gerenciamento de Pacotes"		    \
	6 "Sair" )					                \

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
USUARIO=$(dialog					            \
		--stdout				                  \
		--title "Login"				            \
		--inputbox "Digite seu usuario"		\
		0 0)

#read -s -p "Senha:" SENHA
SENHA=$(dialog						              \
		--stdout				                    \
		--title "Senha"				              \
		--passwordbox "Digite sua senha"	  \
		0 0)

while [[ $USUARIO == $USER ]]; do
	while [[ $SENHA == $PASS ]]; do
		  MENU || FIM
	done
done

function CARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo" 0 0)
> $NOME
dialog --title "Informação" --msgbox "Arquivo criado sucesso" 0 0
GARQ
}
function AARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo" 0 0)
rm -r $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Arquivo apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Arquivo não encontrado" 0 0
fi
GARQ
}
function CDIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do diretorio" 0 0)
mkdir $NOME
dialog --title "Informação" --msgbox "Diretorio criado sucesso" 0 0
GARQ
}
function ADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do diretorio" 0 0)
rm -r $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Diretorio apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox "Diretorio não encontrado" 0 0
fi
GARQ
}
function MARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
mv $NOME /home/vagrant/
dialog --title "Informação" --msgbox "Arquivo/Diretorio movido com sucesso" 0 0
GARQ
}
function CADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
cp $NOME /home/vagrant/
dialog --title "Informação" --msgbox "Arquivo/Diretorio copiado com sucesso" 0 0
GARQ
}
function LARQ(){
ls -la /home/vagrant > /tmp/listar.txt
dialog --title "Listar" --textbox /tmp/listar.txt 0 0
GARQ
}
function GARQ(){
OPCAO=$(dialog					        \
	--stdout				              \
	--title "MENU2"				        \
	--menu "Escolha uma opção"		\
	0 0 0					                \
	1 "Criar Arquivo"			        \
	2 "Apagar Arquivo"			      \
	3 "Criar Diretorio"			      \
	4 "Apagar Diretorio"			    \
	5 "Mover Arquivo/Diretorio"		\
	6 "Copiar Arquivo/Diretorio"	\
	7 "Listar Arquivo/Diretorio"	\
	8 "Voltar")				\

	case $OPCAO in

		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) MARQ ;;
		6) CADIR ;;
		7) LARQ ;;
		8) MENU2 ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GARQ ;;
	esac
}
function CUSR(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário" 0 0 )
useradd $NOME
dialog --title "Informação" --msgbox "Usuário criado com sucesso" 0 0
GUSR
}
function AUSR(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do Usuário" 0 0 )
userdel $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Usuario apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox "Usuario não encontrado" 0 0
fi
GUSR
}
function CGRU(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite o nome do grupo" 0 0 )
groupadd $NOME
dialog --title "Informação" --msgbox "Grupo criado sucesso" 0 0
GUSR
}
function AGRU(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do grupo" 0 0 )
groupdel $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Grupo apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox "Grupo não encontrado" 0 0
fi
GUSR
}
function INFO(){
NOME=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Usuário' 0 0 )
id $NOME
sleep 3
GUSR
}
GUSR(){
OPCAO=$(dialog				          \
	--stdout			                \
	--title "MENU2"			          \
	--menu "Escolha uma opção"	  \
	0 0 0				                  \
	1 "Criar Usuário"		          \
	2 "Apagar Usuário"		        \
	3 "Criar Grupo"			          \
	4 "Apagar Grupo"		          \
	5 'Informações do usuário'	  \
	10 "Voltar")

	case $OPCAO in

		1) CUSR ;;
		2) AUSR ;;
		3) CGRU ;;
		4) AGRU ;;
		5) INFO ;;
		10) MENU2 ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GUSR ;;
    
	esac
}
function LRES(){
ip addr > /tmp/lsredes.txt #
dialog --textbox /tmp/lsredes.txt 0 0
GRES
}
function LRPEC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
ifconfig $NOME > /tmp/lisconf.txt #
dialog --textbox /tmp/lisconf.txt 0 0
GRES
}
function CRMA(){
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
function DPRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Desativar rede" 0 0)
ifconfig eth0 down
if [[ $? == '0' ]];then 
	dialog --title "Informação" --msgbox "Rede desativada com sucesso" 0 0
else
	dialog --title "Informação" --msgbox "Erro, Tente novamente" 0 0
	DPRE
fi
GRES
}
function APRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Ativar rede" 0 0)
ifconfig eth0 up
if [[ $? == '0' ]];then 
	dialog --title "Informação" --msgbox "Rede desativada com sucesso" 0 0
else
	dialog --title "Informação" --msgbox "Erro, Tente novamente" 0 0
	APRE
fi
}
}
function MMAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome da rede " 0 0)
MAC=$(dialog --stdout --title "Nome" --inputbox "Digite o novo MAC" 0 0
if config $NOME hw ether $MAC
if [[ $? == '0' ]];then 
	dialog --title "Informação" --msgbox "Rede desativada com sucesso" 0 0
else
	dialog --title "Informação" --msgbox "Erro, Tente novamente" 0 0
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
function GRES(){
OPCAO=$(dialog					            \
	--stdout				                  \
	--title "MENU"				            \
	--menu "Escolha uma opção"		    \
	0 0 0 					                  \
	1 "Listar redes"			            \
	2 "Listar rede especifica"		    \
	3 "Configurar rede manualmente"		\
	4 "Desativar placa de rede"		    \
	5 "Ativar placa de rede"		      \
	6 "Visualizar redes fisicas "		  \
	7 "Mudar MAC"				              \
	8 "Reiniciar Sistema"			        \
	9 "Adicionar nova rede" 		      \
	10 "Voltar")
	case $OPCAO in
		1) LRES ;;
		2) LRPEC ;;
		3) CRMA ;;
		4) DPRE ;;
		5) APRE ;;
		6) VRFI ;;
		7) MMAC ;;
		8) RSIS ;;
		9) ARED ;;
	 	10) MENU2 ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
CTEC(){
	dialog --yesno 'Aperte YES para configurar o teclado' 0 0
	if (( $? == "0" )); then
		sed 's/us/br/g' /etc/default/keyboard > /etc/default/keyboard.tmp && mv /etc/default/keyboard.tmp /etc/default/keyboard
	else
		GDIS
	fi
		if (( $? == '0' )); then
			dialog --yesno 'Deseja reiniciar a máquina?' 0 0
				if (( $? == '0' )); then
					init 6
				else
					GDIS
				fi
		fi
GDIS
}
IBAT(){
acpi -V > /tmp/lsacpi.txt
dialog --textbox /tmp/lsacpi.txt 0 0
GDIS
}
ICPU(){
lscpu > /tmp/lscpu.txt
dialog --textbox /tmp/lscpu.txt 0 0
GDIS
}
IMEM(){
clear
free -h > /tmp/lsimem.txt
dialog --textbox /tmp/lsimem.txt 0 0
GDIS
}
VDSO(){
clear
lsb_release -a > /tmp/lslsb.txt
dialog --textbox /tmp/lslsb.txt 0 0
GDIS
}
VKER(){
clear
uname -r > /tmp/lsunam.txt
dialog --textbox /tmp/lsunam.txt 0 0
}
IPVI(){
clear
lspci | grep -i vga > tmp/lsgrepi.txt
dialog --textbox /tmp/lsgrepi.txt 0 0
GDIS
}
TPCL(){
clear
uptime > /tmp/lsupti_me.txt
dialog --textbox /tmp/lsupti_me.txt 0 0
GDIS
}
GDIS(){
	OPCAO=$(dialog						            \
		--stdout					                  \
		--title 'Gerenciar Dispositivo'			\
		--menu 'Escolha uma opção'			    \
		0 0 0						                    \
		1 'Configurar Teclado'				      \
		2 'Informações da Bateria'			    \   
		3 'Informações da CPU'				      \
		4 'Informações da Memória'			    \
		5 'Versão do S.O'				            \
		6 'Versão do kernel'				        \
		7 'Informação da Placa de Vídeo'		\
		8 'Quanto tempo o PC está ligado'		\
		9 'Voltar')
	case $OPCAO in
		1) CTEC ;;
		2) IBAT ;;
		3) ICPU ;;
		4) IMEM ;;
		5) VDSO ;;
		6) VKER ;;
		7) IPVI ;;
		8) TPCL ;;
		9) MENU2 ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GREP ;;
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
OPCAO=$(dialog						        \
	--stdout 					              \
	--title "MENU2"					        \
	--menu "Escolha uma opção"			\
	0 0 0						                \
	1 "Instalar pacote"				      \
	2 "Desinstalar pacote"				  \
	3 "Atualizar sistema" 				  \
	4 "Listar pacotes"				      \
	5 "Atualizar pacotes"				    \
	6 "Voltar")					            \
	case $OPCAO in
		1) IPAC    ;;
		2) DPAC	   ;;
		3) AREP    ;;
		4) LSPA    ;;
		5) APA     ;;
 	  	6) MENU2    ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GREP ;;
	esac
}
function MENU2(){
OPCAO=$(dialog					  \
	--stdout				  \
	--title "MENU2"				  \
	--menu "Escolha uma opção"		  \
	0 0 0					  \
	1 "Gerenciamento de Arquivos"		  \
	2 "Gerenciamento de Usuario"		  \
	3 "Gerenciamento de Rede"		  \
	4 "Gerenciamento de Dispositivo"	  \
	5 "Gerenciamento de Pacotes"		  \
	6 "Sair")				  \
	case $OPCAO in
		1) GARQ ;;
		2) GUSR ;;
		3) GRES ;;
		4) GDIS ;;
		5) GREP ;;
		6) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU2 ;;
	esac
}
function FIM(){
	dialog --title "FIM" --msgbox "Ate breve" 0 0
	clear
	exit 0
}
clear
[ $USUARIO == $USER1 ] && [ $SENHA == $PASS1 ] && MENU2 || FIM
