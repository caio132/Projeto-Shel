#!/bin/bash

TEMP=1

MENU(){
OPCAO=$(dialog				\
	--stdout			\
	--title 'Menu'			\
	--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Gerenciar Pacotes'		\
	2 'Sair'			)
	case $OPCAO in
		1) GREP ;;
		2) FIM ;;
		*) exit 0
	esac
}

GREP(){
OPCAO=$(dialog						\
	--stdout					\
	--title "MENU"					\
	--menu "Escolha uma opção"			\
	0 0 0 						\
	1 "Compactar com o Gzip"			\
	2 "Compactar com Gzip2"				\
	3 "Instalar pacote"				\
	4 "Desinstalar pacote"				\
	5 "Atualizar repositorio"			\
	6 "Listar repositorio"				\
	7 "Compilar arquivos com .TAR"			\
	8 "Compilar arquivos com .TAR.GZ"		\
	9 "Compilar arquivos com .TAR.BZ2"		\
       10 "Descompilar arquivos com .TAR"		\
       11 "Descompilar arquivos com .TAR.GZ"		\
       12 "Descompilar arquivos com .TAR.BZ2"		\
       13 "Sair" )					\

	case $OPCAO in

		1) CGZPI   ;;
		2) CGZIP2  ;;
		3) IPAC    ;;
		4) DPAC    ;;
		5) AREP    ;;
		6) LREP    ;;
		7) CTAR    ;;
		8) CTARGZ  ;;
		9) CTARBZ2 ;;
	       10) DTAR    ;;
	       11) DTARGZ  ;;
               12) DTARBZ2 ;;
	       13) FIM

	esac
}
FIM(){
	dialog --title "FIM" --msgbox "Ate breve" 0 0
	clear
	exit 0
}

function CGZPI(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
> $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function CGZIP2(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
rm -r $NOME
dialog --title "Informação" --msgbox "Arquivo apagado com Sucesso" 0 0
GREP
}
function IPAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do diretorio" 0 0)
mkdir $NOME
dialog --title "Informação" --msgbox "Diretorio criado com Sucesso" 0 0
GREP
}
function DPAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
rmdir $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function AREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
mv $NOME $ 
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function LREP(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
cp $NOME $
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function CTAR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
ls -la $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function CTARGZ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function CTARBZ2 (){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function DTAR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function DTARGZ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}
function DTARBZ2(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GREP
}

while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
