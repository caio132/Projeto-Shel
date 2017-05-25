#!/bin/bash
clear
apt-get install dialog
clear

USER="Chefe"
PASS="123"
USER1="Estagiario"
PASS1="132"

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
   	dialog --title "Informação" --msgbox " Diretorio não encontrado" 0 0
fi
GARQ
}
function MARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
mv $NOME /home/vagrant/
dialog --title "Informação" --msgbox "Arquivo/Diretorio movido com sucesso" 0 0
GARQ
}
function CDIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
cp $NOME /home/vagrant/
dialog --title "Informação" --msgbox "Arquivo/Diretorio copiado com sucesso" 0 0
GARQ
}
function LARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o caminho" 0 0)
ls -la $NOME > /tmp/listar.txt
dialog --textbox /tmp/listar.txt 0 0
GARQ
}
function SESQ(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 222 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function SLER(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 444 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function SEXE(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod +x $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function LEEX(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 555 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function ESEX(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 666 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function PETO(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 777 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}

function PERM(){
OPCAO=$(dialog						\
	--stdout					\
	--title 'Permissionamento'			\
	--menu 'Escolha uma opção de Permissionamento'	\
	0 0 0						\
	1 'Só Escrever'					\
	2 'Só Ler'					\
	3 'Só Executar'					\
	4 'Ler e Executar'				\
	5 'Ler e Escrever'				\
	6 'Escrever e Executar'				\
	7 'Permissão Total'				\
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
	*) dialog --title "Opção invalida" --msgbox "Digite Novamente" 0 0 ; GARQ ;;
esac
}
function GARQ(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Criar Arquivo"			\
	2 "Apagar Arquivo"			\
	3 "Criar Diretorio"			\
	4 "Apagar Diretorio"			\
	5 "Mover Arquivo/Diretorio"		\
	6 "Copiar Arquivo/Diretorio"		\
	7 "Listar Arquivo/Diretorio"		\
	8 "Permicionamento"			\
	9 "Voltar")				\

	case $OPCAO in

		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) MARQ ;;
		6) CDIR ;;
		7) LARQ ;;
		8) PERM ;;
		9) MENU ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
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
   	dialog --title "Informação" --msgbox " Usuario não encontrado" 0 0
fi
GUSR
}
function CGRU(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do grupo" 0 0 )
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
function ASEN(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário" 0 0 )
passwd $NOME
dialog --title "Informação" --msgbox "Senha Alterada com sucesso" 0 0
GUSR
}
function PERMI(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário ou grupo" 0 0 )
chmod 775 $NOME
dialog --title "Informação" --msgbox "Permissão alterada com sucesso" 0 0
GUSR
}
function MDON(){
ARQUIVO=$( dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0 )
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do novo dono" 0 0 )
chown -R $NOME $ARQUIVO
dialog --title "Informação" --msgbox "Dono alterado com sucesso" 0 0
GUSR
}
function INFO(){
NOME=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Usuário' 0 0 )
id $NOME
sleep 3
GUSR
}
function MGRU(){
NOME=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Usuário' 0 0 )
GRUPO=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Grupo' 0 0 )
usermod -G $GRUPO $NOME
GUSR
}
GUSR(){
OPCAO=$(dialog				\
	--stdout			\
	--title "MENU"			\
	--menu "Escolha uma opção"	\
	0 0 0				\
	1 "Criar Usuário"		\
	2 "Apagar Usuário"		\
	3 "Criar Grupo"			\
	4 "Apagar Grupo"		\
	5 "Adicionar Senha a um Usuário"\
	6 "Permissionameto"		\
	7 "Mudar o dono de um arquivo"	\
	8 "Informações do usuário"	\
	9 'Mudar o grupo de um usuário'	\
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
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GUSR ;;
	esac
}
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


GRES
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
	10 "Voltar")

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
		10) MENU ;;
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
free -h ?> /tmp/lsimem.txt
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
apt-get dist-upgrade > /tmp/disup.txt
dialog --textbox /tmp/disup.txt
dialog --title "Informação" --msgbox "Sistema atualizado com sucesso" 0 0
GREP
}
function LREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do pacote" 0 0)
$NOME > /tmp/lispar.txt ????
dialog --textbox /tmp/lispas.txt 0 0
GREP
}
function APA(){
apt-get update > /tmp/updta.txt
dialog --textbox /tmp/updta.txt
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
	6 "Voltar" )					\

	case $OPCAO in

		1) IPAC    ;;
		2) DPAC	   ;;
		3) AREP    ;;
		4) ASIS    ;;
		4) LREP    ;;
		5) APA     ;;
 	        6) MENU    ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GREP ;;
	esac
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
function CDIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
cp $NOME /home/vagrant/
dialog --title "Informação" --msgbox "Arquivo/Diretorio copiado com sucesso" 0 0
GARQ
}
function LARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquuivo/diretorio a ser listado" 0 0)
ls -la > /tmp/listar.txt
dialog --title "Listar" --textbox /tmp/listar.txt 0 0
GARQ
}
function GARQ(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU2"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Criar Arquivo"			\
	2 "Apagar Arquivo"			\
	3 "Criar Diretorio"			\
	4 "Apagar Diretorio"			\
	5 "Mover Arquivo/Diretorio"		\
	6 "Copiar Arquivo/Diretorio"		\
	7 "Listar Arquivo/Diretorio"		\
	8 "Voltar")				\

	case $OPCAO in

		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) MARQ ;;
		6) CDIR ;;
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
OPCAO=$(dialog				\
	--stdout			\
	--title "MENU2"			\
	--menu "Escolha uma opção"	\
	0 0 0				\
	1 "Criar Usuário"		\
	2 "Apagar Usuário"		\
	3 "Criar Grupo"			\
	4 "Apagar Grupo"		\
	5 'Informações do usuário'	\
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
function GERD(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU2
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
free -h ?> /tmp/lsimem.txt
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
apt-get dist-upgrade > /tmp/disup.txt
dialog --textbox /tmp/disup.txt
dialog --title "Informação" --msgbox "Sistema atualizado com sucesso" 0 0
GREP
}
function LREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do pacote" 0 0)
$NOME > /tmp/lispar.txt ????
dialog --textbox /tmp/lispas.txt 0 0
GREP
}
function APA(){
apt-get update > /tmp/updta.txt
dialog --textbox /tmp/updta.txt
dialog --title "Informação" --msgbox "Atualização Completa" 0 0
GREP
}
GREP(){
OPCAO=$(dialog						\
	--stdout 					\
	--title "MENU2"					\
	--menu "Escolha uma opção"			\
	0 0 0						\
	1 "Instalar pacote"				\
	2 "Desinstalar pacote"				\
	3 "Atualizar sistema" 				\
	4 "Listar pacotes"				\
	5 "Atualizar pacotes"				\
	6 "Voltar" )					\

	case $OPCAO in

		1) IPAC    ;;
		2) DPAC	   ;;
		3) AREP    ;;
		4) ASIS    ;;
		4) LREP    ;;
		5) APA     ;;
 	        6) MENU2    ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GREP ;;
	esac
}
function MENU2(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU2"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Gerenciamento de Arquivos"		\
	2 "Gerenciamento de Usuario"		\
	3 "Gerenciamento de Rede"		\
	4 "Gerenciamento de Dispositivo"	\
	5 "Gerenciamento de Pacotes"		\
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

[ $USUARIO == $USER1 ] && [ $SENHA == $PASS1 ] && MENU2 || FIM
