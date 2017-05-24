#!/bin/bash
MENU(){
OPCAO=$(dialog				\
	--stdout			\
	--title 'Menu'			\
	--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Gerenciar Arquivos'		\
	2 'Sair'			)
	case $OPCAO in
		1) GRES ;;
		2) FIM ;;
		*) exit 0
	esac
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
	9 "Sair")

	case $OPCAO in

		1) LRES ;;
		2) LREES ;;
		3) CRMA ;;
		4) DPRE ;;
		5) APRE ;;
		6) VRFI ;;
		7) MMAC ;;
		8) RSIS ;;
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
function LRES(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
> $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}

function LREES(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
rm -r $NOME
dialog --title "Informação" --msgbox "Arquivo apagado com Sucesso" 0 0
GRES
}

function CRMA(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do diretorio" 0 0)
mkdir $NOME
dialog --title "Informação" --msgbox "Diretorio criado com Sucesso" 0 0
GRES
}

function DPRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
rmdir $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}

function APRE(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
mv $NOME $ 
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}

function VRFI(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
cp $NOME $
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}

function MMAC(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
ls -la $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}

function RSIS(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
chmod +x $NOME
dialog --title "Informação" --msgbox "Arquivo criado com Sucesso" 0 0
GRES
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
