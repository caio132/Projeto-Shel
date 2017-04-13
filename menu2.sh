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
function PERM(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "" 0 0
GARQ
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
function PERM(){
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
		6) PERM ;;
		7) MDON ;;
		8) MGRU ;;
		9) INFO ;;
		10) MENU ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
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
	8 "Sair")				\

	case $OPCAO in

		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) MARQ ;;
		6) CDIR ;;
		7) LARQ ;;
		8) FIM ;;
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
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
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

function MENU2(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU2"				\
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
		--title "Senha"				\
		--passwordbox "Digite sua senha"	\
		0 0)


[ $USUARIO == $USER1 ] && [ $SENHA == $PASS1 ] && MENU2 || FIM
