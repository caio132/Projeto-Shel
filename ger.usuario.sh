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

function CUSR(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário" 0 0 )
useradd $NOME #
dialog --title "Informação" --msgbox "Usuário criado com sucesso" 0 0
GUSR
}
function AUSR(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do Usuário" 0 0 )
userdel $NOME #
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Usuario apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox " Usuario não encontrado" 0 0
fi
GUSR
}
function CGRU(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do grupo" 0 0 )
groupadd $NOME #
dialog --title "Informação" --msgbox "Grupo criado sucesso" 0 0
GUSR
}
function AGRU(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do grupo" 0 0 )
groupdel $NOME #
if [[ $? == "0" ]]; then
	dialog --title "Informação" --msgbox "Grupo apagado sucesso" 0 0
   else
   	dialog --title "Informação" --msgbox "Grupo não encontrado" 0 0
fi
GUSR
}
function ASEN(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário" 0 0 )
passwd $NOME #
dialog --title "Informação" --msgbox "Senha Alterada com sucesso" 0 0
GUSR
}
function PERMI(){
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do usuário ou grupo" 0 0 )
chmod 775 $NOME #
dialog --title "Informação" --msgbox "Permissão alterada com sucesso" 0 0
GUSR
}
function MDON(){
ARQUIVO=$( dialog --stdout --title "Nome" --inputbox "Digite nome do arquivo/diretorio" 0 0 )
NOME=$( dialog --stdout --title "Nome" --inputbox "Digite nome do novo dono" 0 0 )
chown -R $NOME $ARQUIVO #
dialog --title "Informação" --msgbox "Dono alterado com sucesso" 0 0
GUSR
}
function INFO(){
NOME=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Usuário' 0 0 )
id $NOME > /tmp/infor.txt #
dialog --textbox /tmp/infor.txt 0 0
GUSR
}
function MGRU(){
NOME=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Usuário' 0 0 )
GRUPO=$( dialog --stdout --title 'Nome' --inputbox 'Digite o nome do Grupo' 0 0 )
usermod -G $GRUPO $NOME #
dialog --title "Informação" --msgbox "Usuario mudado com sucesso" 
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
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GUSR ;;
	esac
}
while [[ $TEMP != 0 ]]; do
	MENU || FIM
done
