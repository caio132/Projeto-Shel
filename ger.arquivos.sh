#!/bin/bash

TEMP=1

MENU(){
OPCAO=$(dialog				\
	--stdout			\
	--title 'Menu'			\
	--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Gerenciar Arquivos'		\
	2 'Sair'			)
	case $OPCAO in
		1) GARQ ;;
		2) FIM ;;
		*) exit 0
	esac
}
function GARQ(){
OPCAO=$(dialog				\
	--stdout			\
	--title "MENU"			\
	--menu "Escolha uma opção"	\
	0 0 0 				\
	1 "Criar Arquivo"		\
	2 "Apagar Arquivo"		\
	3 "Criar Diretorio"		\
	4 "Apagar Diretorio"		\
	5 "Mover Arquivo/Diretorio"	\
	6 "Copiar Arquivo"		\
	7 "Listar Arquivo"		\
	8 "Permicionamento"		\
	9 "Sair")

	case $OPCAO in

		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) MARQ ;;
		6) CARQ ;;
		7) LARQ ;;
		8) PERM ;;
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
function CARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
> $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GARQ
}

function AARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
rm -r $NOME
dialog --title "Informação" --msgbox "Arquivo apagado com Sucesso" 0 0
GARQ
}

function CDIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do diretorio" 0 0)
mkdir $NOME
dialog --title "Informação" --msgbox "Diretorio criado com Sucesso" 0 0
GARQ
}

function ADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
rmdir $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GARQ
}

function MARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
mv $NOME $ 
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GARQ
}

function CARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
cp $NOME $
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GARQ
}

function LARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
ls -la $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GARQ
}

function PERM(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GARQ
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done

