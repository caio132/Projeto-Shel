#!/bin/bash
clear
apt-get install -y cowsay
apt-get install -y dialog
apt-get update
clear

USER="PUGLIFE"
PASS="123"

function CARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo" 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
> $NOME
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Arquivo criado sucesso" 0 0
else
	dialog --title "Informação" --msgbox "Erro, tente novamente" 0 0
	CARQ
fi
GARQ
}
function AARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo" 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
rm -r $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Arquivo apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Arquivo não encontrado, tente novamente" 0 0
	AARQ
fi
GARQ
}
function CDIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do diretorio" 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
mkdir $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Arquivo apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox "Diretorio não encontrado, tente novamente" 0 0
	CDIR
fi
GARQ
}
function ADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do diretorio" 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
rm -r $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Diretorio apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Diretorio não encontrado, tente novamente" 0 0
	ADIR
fi
GARQ
}
function MARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
CAMINHO=$(dialog --stdout --title "Nome" --inputbox "Digite o diretorio onde ele será movido" 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
mv $NOME $CAMINHO
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Arquivo/Diretorio movido com sucesso" 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	MARQ
fi
GARQ
}
function CADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
cp $NOME /home
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Arquivo/Diretorio copiado com sucesso para o /home" 0 0
	dialog --yesno "Deseja mudar o nome do novo arquivo?" 0 0
	if [[ $? == '0' ]]; then
	NOME1=$( dialog --stdout --title 'Nome' --inputbox 'Digite o novo nome' 0 0)
		if [[ $? == '1' ]]; then
			GARQ
		fi
		mv /home/$NOME /home/$NOME1
		if [[ $? == "0" ]]; then
			dialog --title "Informação" --msgbox "Nome alterado com sucesso" 0 0
   		else
   			dialog --title "Informação" --msgbox "Erro" 0 0
			GARQ
		fi
	else
		GARQ
	fi
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	CADIR
fi
GARQ
}
function LARQ(){
dialog --title "Listagem de arquivos/diretorios" 0 0
if [[ $? == '1' ]]; then
	GARQ
fi
dialog --fselect /home/vagrant/ 0 0
GARQ
}
function SESQ(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
chmod 222 $NAME
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, Tente novamente' 0 0
	PERM
fi
PERM
}
function SLER(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
chmod 444 $NAME
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, Tente novamente' 0 0
	PERM
fi
PERM
}
function SEXE(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
chmod 111 $NAME
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, Tente novamente' 0 0
	PERM
fi
PERM
}
function LEEX(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
chmod 555 $NAME
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, Tente novamente' 0 0
	PERM
fi
PERM
}
function LEES(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
chmod 666 $NAME
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, Tente novamente' 0 0
	PERM
fi
PERM
}
function ESEX(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
chmod 333 $NAME
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, Tente novamente' 0 0
	PERM
fi
PERM
}
function PETO(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
if [[ $? == '1' ]]; then
	GARQ
fi
chmod 777 $NAME
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, Tente novamente' 0 0
	PERM
fi
PERM
}
function PERM(){
OPCAO=$(dialog						                  \
	--stdout					                  \
	--title 'Permissionamento'			                  \
	--menu 'Escolha uma opção de Permissionamento'	  		  \
	0 0 0						                  \
	1 'Só Escrever'					                  \
	2 'Só Ler'					                  \
	3 'Só Executar'					                  \
	4 'Ler e Executar'				                  \
	5 'Ler e Escrever'				                  \
	6 'Escrever e Executar'				                  \
	7 'Permissão Total'				                  \
	8 'Voltar')

case $OPCAO in
	1) SESQ ;;
	2) SLER ;;
	3) SEXE ;;
	4) LEEX ;;
	5) LEES ;;
	6) ESEX ;;
	7) PETO ;;
	8) GARQ ;;
	255) FIM ;;
	*) dialog --title "Opção invalida" --msgbox "Digite Novamente" 0 0 ; GARQ ;;
esac
}
function GARQ(){
OPCAO=$(dialog					                \
	--stdout				                \
	--title "MENU"				                \
	--menu "Escolha uma opção"		        	\
	0 0 0					                \
	1 "Criar Arquivo"			                \
	2 "Apagar Arquivo"			                \
	3 "Criar Diretorio"			                \
	4 "Apagar Diretorio"			                \
	5 "Mover Arquivo/Diretorio"		         	\
	6 "Copiar Arquivo/Diretorio"		      		\
	7 "Listar Arquivo/Diretorio"		      		\
	8 "Permissionamento"			            	\
	9 "Voltar")				                \

	case $OPCAO in

		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) MARQ ;;
		6) CADIR ;;
		7) LARQ ;;
		8) PERM ;;
		9) MENU ;;
		255) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}


function CUSR(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
useradd $NOME
	dialog --title "Informação" --msgbox "Usuário criado com sucesso" 0 0
GUSR
}
function AUSR(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do Usuário" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
userdel $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Usuario apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Usuario não encontrado, tente novamente" 0 0
	AUSR
fi
GUSR
}
function CGRU(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do grupo" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
groupadd $NOME
dialog --title "Informação" --msgbox "Grupo criado sucesso" 0 0
GUSR
}
function AGRU(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do grupo" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
groupdel $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Grupo apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox "Grupo não encontrado, tente novamente" 0 0
	AGRU
fi
GUSR
}
function ASEN(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
passwd $NOME
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Senha Adicionada com sucesso" 0 0
else
	dialog --title 'Informação' --msgbox 'Usuário inexistente, tente novamente' 0 0
	ASEN
fi
GUSR
}
function PERMI(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário ou grupo" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
chmod 775 $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Permissionamento concluído" 0 0
   else
   	dialog --title "Informação" --msgbox "Erro, tente novamente" 0 0
	PERMI
fi
GUSR
}
function MDON(){
ARQUIVO=$( dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do novo dono" 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
chown -R $NOME $ARQUIVO
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Dono alterado com sucesso" 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	MDON
fi
GUSR
}
function INFO(){
NOME=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Usuário' 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
id $NOME > /tmp/infor.txt
if [[ $? == '0' ]]; then
	dialog --textbox /tmp/infor.txt 0 0
else
	dialog --title 'Informação' --msgbox 'Usuário não encontrado' 0 0
	INFO
fi
GUSR
}
function MGRU(){
NOME=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Usuário' 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
GRUPO=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Grupo' 0 0 )
if [[ $? == '1' ]]; then
	GUSR
fi
usermod -G $GRUPO $NOME
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Usuario mudado com sucesso" 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	MGRU
fi
GUSR
}
function GUSR(){
OPCAO=$(dialog				              \
	--stdout			              \
	--title "MENU"			              \
	--menu "Escolha uma opção"	      	      \
	0 0 0				              \
	1 "Criar Usuário"		              \
	2 "Apagar Usuário"		              \
	3 "Criar Grupo"			              \
	4 "Apagar Grupo"		              \
	5 "Adicionar Senha a um Usuário"  	      \
	6 "Permissionameto"		              \
	7 "Mudar o dono de um arquivo"	              \
	8 "Informações do usuário"	              \
	9 'Mudar o grupo de um usuário'	              \
	10 "Voltar")

	case $OPCAO in

		1) CUSR ;;
		2) AUSR ;;
		3) CGRU ;;
		4) AGRU ;;
		5) ASEN ;;
		6) PERMI ;;
		7) MDON ;;
		8) INFO ;;
		9) MGRU ;;
   		10) MENU ;;
		255) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GUSR ;;
	esac
}
function LRES(){
ip addr > /tmp/lsredes.txt
dialog --textbox /tmp/lsredes.txt 0 0
GRES
}
function LRPEC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
ifconfig $NOME > /tmp/lisconf.txt
if [[ $? == '0' ]]; then
	dialog --textbox /tmp/lisconf.txt 0 0
else
	dialog --title 'Informação' --msgbox 'Rede não encontrada, tente novamente' 0 0
	LRPEC
fi
GRES
}
function ADRE(){
INT=$(dialog --stdout --inputbox "Digite o novo nome da rede: ( obs: eth1; eth2 ...)" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
IP=$(dialog --stdout --inputbox "Digite o IP da nova rede:" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
NETM=$(dialog --stdout --inputbox "Digite o Netmask da nova rede:" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
NETW=$(dialog --stdout --inputbox "Digite o Network da nova rede:" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
BROA=$(dialog --stdout --inputbox "Digite o Broadcast da nova rede:" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
echo "########################################################################" >> /etc/network/interfaces
echo "auto $INT" >> /etc/network/interfaces
echo "allow-hotplug $INT" >> /etc/network/interfaces
echo "iface $INT inet static" >> /etc/network/interfaces
echo "	address $IP" >> /etc/network/interfaces
echo "	netmask $NETM" >> /etc/network/interfaces
echo "	network $NETW" >> /etc/network/interfaces
echo "	broadcast $BROA" >> /etc/network/interfaces
echo "########################################################################" >> /etc/network/interfaces

dialog --tilte 'Informação' --msgbox 'Nova rede feita com sucesso' 0 0
if [[ $? == '1' ]]; then
	GRES
fi
dialog --title 'Informação' --yesno 'Deseja ver as alterações feitas?' 0 0
if [[ $? == 0 ]]; then
	dialog --title 'Informação' --textbox /etc/network/interfaces 0 0
	GRES
else
	GRES
fi
GRES
}
function DPRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite a rede que deseja desativar" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
ifconfig $NOME down
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Rede desativada com sucesso" 0 0
else
	dialog --title "Informação" --msgbox "Erro, Tente novamente" 0 0
	DPRE
fi
GRES
}
function APRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome da rede que deseja ativar" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
ifconfig $NOME up
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Rede ativada com sucesso" 0 0
else
	dialog --title "Informação" --msgbox "Erro, Tente novamente" 0 0
	APRE
fi
GRES
}
function MMAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite a rede que deseja alterar o Endereço Físico" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
MAC=$(dialog --stdout --title "Nome" --inputbox "Digite o novo MAC" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
ifconfig $NOME hw ether $MAC
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "MAC alterado com sucesso" 0 0
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
function CRMA(){
INT=$(dialog --stdout --inputbox 'Digite o novo nome da rede (Ex.: eth0, eth1)' 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
IP=$(dialog --stdout --inputbox 'Digite o novo IP da rede' 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
MASK=$(dialog --stdout --inputbox 'Digite a nova Máscara da rede' 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
ifconfig $INT $IP netmask $MASK
if [[ $? == '0' ]]; then
	dialog --title 'Informação' --msgbox 'Rede configurada manualmente com sucesso' 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	CRMA
fi
GRES
}
function PRED(){
NOME=$(dialog --stdout --inputbox "Digite o Endereço IP a ser pingado" 0 0)
if [[ $? == '1' ]]; then
	GRES
fi
ping $NOME > /tmp/pingar.log | dialog --tailbox /tmp/pingar.log 100 100 && GRES
}
function VGAT(){
route -n > /tmp/route.txt
dialog --textbox /tmp/route.txt 0 0
GRES
}
GRES(){
OPCAO=$(dialog					      \
	--stdout				      \
	--title "Menu"				      \
	--menu "Escolha uma opção"		      \
	0 0 0 					      \
	1 "Visualizar interfaces de redes"	      \
	2 "Visualizar rede especifica"		      \
	3 "Adicionar rede "		      	      \
	4 "Desativar placa de rede"		      \
	5 "Ativar placa de rede"		      \
	6 "Mudar MAC"				      \
	7 "Reiniciar Sistema"			      \
	8 "Configurar rede manualmente"		      \
	9 "Teste de conexão"			      \
	10 "Visualizar Gateway"			      \
	11 "Voltar")				      \

	case $OPCAO in

		1) LRES ;;
		2) LRPEC ;;
		3) ADRE ;;
		4) DPRE ;;
		5) APRE ;;
		6) MMAC ;;
		7) RSIS ;;
	 	8) CRMA ;;
		9) PRED ;;
		10) VGAT ;;
		11) MENU ;;
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
acpi -V > /tmp/lsacpi.txt #
dialog --textbox /tmp/lsacpi.txt 0 0
GDIS
}
ICPU(){
lscpu > /tmp/lscpu.txt #
dialog --textbox /tmp/lscpu.txt 0 0
GDIS
}
IMEM(){
clear
free -h > /tmp/lsimem.txt #
dialog --textbox /tmp/lsimem.txt 0 0
GDIS
}
VDSO(){
clear
lsb_release -a > /tmp/lslsb.txt #
dialog --textbox /tmp/lslsb.txt 0 0
GDIS
}
VKER(){
clear
uname -r > /tmp/lsunam.txt #
dialog --textbox /tmp/lsunam.txt 0 0
GDIS
}
IPVI(){
clear
lspci | grep -i vga > /tmp/ls.txt
dialog --textbox /tmp/ls.txt 0 0
GDIS
}
TPCL(){
clear
uptime > /tmp/lsupti_me.txt #
dialog --textbox /tmp/lsupti_me.txt 0 0
GDIS
}
function GDIS(){
	OPCAO=$(dialog						\
		--stdout					\
		--title 'Gerenciar Dispositivo'			\
		--menu 'Escolha uma opção'			\
		0 0 0						\
		1 'Configurar Teclado'				\
		2 'Informações da Bateria'			\
		3 'Informações da CPU'				\
		4 'Informações da Memória'			\
		5 'Versão do S.O'				\
		6 'Versão do kernel'				\
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
		9) MENU ;;
		255) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GDIS ;;
	esac
}

function IPAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do pacote a ser instalado" 0 0)
if [[ $? == '1' ]]; then
	GREP
fi
apt-get -y install $NOME > /tmp/instale.log | dialog --title "Instalando $NOME" --tailbox /tmp/instale.log 100 100
if [[ $? == '0' ]]; then
	dialog --title "Informação" --msgbox "Pacote instalado com sucesso" 0 0
else
	dialog --title 'Informaçao' --msgbox "Pacote não encontrado, tente novamente" 0 0
	IPAC
fi
GREP
}
function DPAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do pacote a ser desinstalado" 0 0)
if [[ $? == '1' ]]; then
	GREP
fi
apt-get -Y remove $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Pacote desinstalado com sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox "Pacote não encontrado, tente novamente" 0 0
	DPAC
fi
GREP
}
function AREP(){
dialog  --yesno "Deseja atualizar os pacotes ?" 5 40

case $? in
	0) apt-get -y dist-upgrade > /tmp/atua.log | dialog --title "Atualizando" --tailbox /tmp/atua.log 100 100; volta=$?;;
	1) menu;;
esac

case $volta in
	0) dialog --msgbox "Atualizado com sucesso" 0 0; menu;;
	1) dialog --msgbox "Não foi possivela atualizar" 0 0; menu;;
esac
GREP
}
function LSPA(){
apt list --installed | nl > /tmp/lispar.txt
dialog --textbox /tmp/lispar.txt 0 0
GREP
}
function APA(){
dialog  --yesno "Deseja atualizar o repositorio?" 5 40

case $? in
	0) apt-get update > /tmp/att.log | dialog --title "Atualizando" --tailbox /tmp/att.log 100 100; volta=$?;;
	1) menu;;
esac

case $volta in
	0) dialog --msgbox "Atualizado com sucesso" 0 0; menu;;
	1) dialog --msgbox "Não foi possivela atualizar" 0 0; menu;;
esac
GREP
}
INFP(){
NOME=$( dialog --stdout --title 'Pacote' --inputbox 'Digite o nome do pacote' 0 0)
if [[ $? == '1' ]]; then
	GREP
fi
apt-cache show $NOME > /tmp/list.txt
if [[ $? == '0' ]]; then
	dialog --textbox /tmp/list.txt 0 0
else
	dialog --title 'Informação' --msgbox 'Erro, tente novamente' 0 0
	INFP
fi
GREP
}
GAUGE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do pacote a ser desinstalado" 0 0)
if [[ $? == '1' ]]; then
	GREP
fi
apt-get remove --purge -y $NOME
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Pacote desinstalado com sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Pacote não encontrado, tente novamente" 0 0
	DPAC
fi
GREP
}
function ATU(){
apt-get -s upgrade > /tmp/up.txt
dialog --textbox /tmp/up.txt 0 0
GREP
}

function GREP(){
OPCAO=$(dialog						\
	--stdout 					\
	--title "MENU"					\
	--menu "Escolha uma opção"			\
	0 0 0						\
	1 "Instalar pacote"				\
	2 "Desinstalar pacote"				\
	3 "Atualizar pacotes" 				\
	4 "Listar pacotes"				\
	5 "Atualizar Repositório"			\
	6 "Informações sobre o pacote"			\
	7 "Desinstalar pacote e suas dependências"	\
	8 "Buscar atualizações necessárias"		\
	9 "Voltar")

	case $OPCAO in

		1) IPAC    ;;
		2) DPAC	   ;;
		3) AREP    ;;
		4) LSPA    ;;
		5) APA     ;;
	        6) INFP    ;;
		7) GAUGE   ;;
		8) ATU	   ;;
		9) MENU    ;;
		255) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GREP ;;
	esac
}
function CRED(){
dialog --title "Integrantes" --msgbox "Caio Henrique		\
					Gabriel Alves		\
					Guilherme Leonel	\
					Gustavo Oliveira	\
					Luiz Girotto		\
					Lucas Antunes		\
					Rebeca" 0 0
dialog --title 'Fontes' --msgbox  "aurelio.net/shell/dialog/	\
				https://www.vivaolinux.com.br" 0 0
PATH=$PATH+:/usr/games
cowsay "Obrigado a todos pela atençaõ" > /tmp/cowsay.txt
dialog --textbox /tmp/cowsay.txt 0 0
MENU
}
function MENU(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Gerenciamento de Arquivos"		\
	2 "Gerenciamento de Usuario"		\
	3 "Gerenciamento de Rede"		\
	4 "Gerenciamento de Dispositivo"	\
	5 "Gerenciamento de Pacotes"		\
	6 "Créditos"				\
	7  "Sair")				\

	case $OPCAO in

		1) GARQ ;;
		2) GUSR ;;
		3) GRES ;;
		4) GDIS ;;
		5) GREP ;;
		6) CRED ;;
		7) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
function FIM(){
	dialog --title "FIM" --msgbox "Ate breve" 0 0
	clear
	exit 0
}
VOLTA=1
while (( $VOLTA != 0 )); do
USUARIO=$(dialog					\
		--stdout				\
		--title "Login"				\
		--inputbox "Digite seu usuario"		\
		0 0)

SENHA=$(dialog						\
		--stdout				\
		--title "Senha"				\
		--passwordbox "Digite sua senha"	\
		0 0)
	if [[ $USUARIO == $USER ]]; then
		if [[ $SENHA == $PASS ]]; then
			VOLTA=0
			MENU
		fi
	fi
			if (( $VOLTA != 0 )); then
				dialog --msgbox 'Login ou Senha incorreto' 0 0
			fi
		let VOLTA=($VOLTA+1)
done
