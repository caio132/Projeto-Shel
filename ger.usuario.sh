#!/bin/bash

TEMP=1

MENU(){
OPCAO=$(dialog					\
	--stdout				\
	--title "MENU"				\
	--menu "Escolha uma opção"		\
	0 0 0					\
	1 "Gerenciar Usuário"			\
	2 "Sair")

	case $OPCAO in

		1) GUSR ;;
		2) FIM ;;
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
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
FIM(){
dialog --title 'FIM' --msgbox 'Até a Próxima' 0 0
clear
exit 0
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
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
