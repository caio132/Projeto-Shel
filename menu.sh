#!/bin/bash

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
dialog --title "Informação" --msgbox "Arquivo apagado sucesso" 0 0
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
dialog --title "Informação" --msgbox "Diretorio apagado com sucesso" 0 0
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
ls -la > /tmp/listar.txt
dialog --title "Listar" --textbox /tmp/listar.txt 0 0
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
dialog --title "Informação" --msgbox "Usuário apagado com sucesso" 0 0
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
dialog --title "Informação" --msgbox "Grupo apagado com sucesso" 0 0
GUSR
}
function ASEN(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário" 0 0 )
passwd $NOME
dialog --title "Informação" --msgbox "Senha Alterada sem maiúsculo com sucesso" 0 0
GUSR
}
function PERMI(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário ou grupo" 0 0 )
chmod 775 $NOME
dialog --title "Informação" --msgbox "Usuário/Grupo criado com sucesso" 0 0
GUSR
}
function MDON(){
ARQUIVO=$( dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0 )
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do novo dono" 0 0 )
chown -R $NOME $ARQUIVO
dialog --title "Informação" --msgbox "Domo alterado com sucesso" 0 0
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
	8 "Mudar o grupo de um usuário"	\
	9 'Informações do usuário'	\
	10 "Voltar")

	case $OPCAO in

		1) CUSR ;;
		2) AUSR ;;
		3) CGRU ;;
		4) AGRU ;;
		5) ASEN ;;
		6) PERMI ;;
		7) MDON ;;
		8) MGRU ;;
		9) INFO ;;
               10) MENU ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GUSR ;;
	esac
}
function GERD(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU
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
clear
acpi -V
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
ICPU(){
clear
lscpu
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
IMEM(){
clear
free -h
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
VDSO(){
clear
lsb_release -a
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
VKER(){
clear
uname -r
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
IPVI(){
clear
lspci | grep -i vga
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
TPCL(){
clear
uptime
echo 'Digite [enter] para voltar'
read xxx
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
dialog --title "Informação" --msgbox "Pacote desinstalado com sucesso" 0 0
GREP
}
function AREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do pacote a ser atualizado" 0 0)
apt-get dist-upgrade $NOME
dialog --title "Informação" --msgbox "Pacote atualizado com sucesso" 0 0
GREP
}
function LREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
tar -tvf $NOME.tar
dialog --title "Informação" --msgbox "" 0 0
GREP
}
function ASIS(){
NOME=$(dialog --stdout --title "Atualização" --textbox "Atualizando o sistema" 0 0)
tar -tvf $NOME.tar
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
	3 "Atualizar pacote" 				\
	4 "Listar pacotes"				\
	5 "Atualizar sistema"				\
	5"Voltar" )					\

	case $OPCAO in

		1) IPAC    ;;
		2) DPAC	   ;;
		3) AREP    ;;
		4) LREP    ;;
		5)ASIS     ;;
 	        5) MENU    ;;
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
dialog --title "Informação" --msgbox "Arquivo apagado sucesso" 0 0
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
dialog --title "Informação" --msgbox "Diretorio apagado com sucesso" 0 0
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
dialog --title "Informação" --msgbox "Usuário apagado com sucesso" 0 0
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
dialog --title "Informação" --msgbox "Grupo apagado com sucesso" 0 0
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
clear
acpi -V
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
ICPU(){
clear
lscpu
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
IMEM(){
clear
free -h
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
VDSO(){
clear
lsb_release -a
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
VKER(){
clear
uname -r
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
IPVI(){
clear
lspci | grep -i vga
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
TPCL(){
clear
uptime
echo 'Digite [enter] para voltar'
read xxx
GDIS
}
GDIS(){
	OPCAO=$(dialog						\
		--stdout					\
		--title 'MENU2'					\
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
		6) IPVI ;;
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
dialog --title "Informação" --msgbox "Pacote desinstalado com sucesso" 0 0
GREP
}
function AREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do pacote a ser atualizado" 0 0)
apt-get dist-upgrade $NOME
dialog --title "Informação" --msgbox "Pacote atualizado com sucesso" 0 0
GREP
}
function LREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
tar -tvf $NOME.tar
dialog --title "Informação" --msgbox "" 0 0
GREP
}
function ASIS(){
NOME=$(dialog --stdout --title "Atualização" --textbox "Atualizando o sistema" 0 0)
tar -tvf $NOME.tar
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
	3 "Atualizar pacote" 				\
	4 "Listar pacotes"				\
	5 "Atualizar sistema"				\
	5"Voltar" )					\

	case $OPCAO in

		1) IPAC    ;;
		2) DPAC	   ;;
		3) AREP    ;;
		4) LREP    ;;
		5)ASIS     ;;
 	        5) MENU    ;;
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


[ $USUARIO == $USER1 ] && [ $SENHA == $PASS1 ] && MENU2 || FIM
