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
> $NOME #
dialog --title "Informação" --msgbox "Arquivo criado sucesso" 0 0
GARQ
}
function AARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo" 0 0)
rm -r $NOME #
if [[ $? == "0" ]]; then #
	dialog --title "Informação" --msgbox "Arquivo apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Arquivo não encontrado" 0 0
fi
GARQ
}
function CDIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do diretorio" 0 0)
mkdir $NOME #
dialog --title "Informação" --msgbox "Diretorio criado sucesso" 0 0
GARQ
}
function ADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do diretorio" 0 0)
rm -r $NOME #
if [[ $? == "0" ]]; then #
	dialog --title "Informação" --msgbox "Diretorio apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Diretorio não encontrado" 0 0
fi
GARQ
}
function MARQ(){ 
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
mv $NOME /home/vagrant/ #
dialog --title "Informação" --msgbox "Arquivo/Diretorio movido com sucesso" 0 0
GARQ
}
function CADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0)
cp $NOME /home/vagrant/ #
dialog --title "Informação" --msgbox "Arquivo/Diretorio copiado com sucesso" 0 0
GARQ
}
function LARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
ls -la $NOME > /tmp/listar.txt #
dialog --textbox /tmp/listar.txt 0 0
dialog --title "Informação" --msgbox " Arquivo listado com sucesso" 0 0
GARQ
}
function SESQ(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 222 $NAME #
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function SLER(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 444 $NAME #
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function SEXE(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod +x $NAME #
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function LEEX(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 555 $NAME #
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function ESEX(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 666 $NAME #
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
}
function PETO(){
NAME=$(dialog --stdout --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 777 $NAME #
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
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
	8 "PermiSSionamento"			            	\
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
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done

