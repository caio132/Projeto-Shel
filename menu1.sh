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
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
ls -lh $NOME
dialog --title "Informação" --msgbox "Arquivo/Diretorio listado com sucesso" 0 0
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
	9 "Sair")				\

	case $OPCAO in

		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) MARQ ;;
		6) CDIR ;;
		7) LARQ ;;
		8) PERM ;;
		9) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
function GUSR(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU
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
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
ls -lh $NOME
dialog --title "Informação" --msgbox "Arquivo/Diretorio listado com sucesso" 0 0
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
function GUSR(){
	clear
	dialog --title  "Construção." --msgbox "Estamos em construção" 0 0
	MENU
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
