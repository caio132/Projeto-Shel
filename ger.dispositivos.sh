
#!/bin/bash

TMP=0

MENU(){
OPCAO=$(dialog						\
	--stdout 					\
	--title 'Menu'					\
	--menu 'Escolha uma opção'			\
	0 0 0						\
	1 'Gerenciado de dispositivo'			\
	2 'Sair')

	case $OPCAO in

		1) GDIS ;;
		2) FIM ;;
		255) exit ;;
		*) exit 0 ;;
	esac
}
FIM(){
dialog				\
--title 'FLW'			\
--yesno 'Deseja mesmo sair?'	\
0 0
if (( $? == '0' )); then
	exit 0
else
	MENU
fi
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
acpi -V > /tmp/lsacpi.txt #
dialog --textbox /tmp/lsacpi.txt 0 0
GDIS
}
ICPU(){
lscpu > /tmp/lscpu.txt #
dialog --textbox /tmp/lscpu.txt 0 0
GDIS
}
IMEM(){
clear
free -h > /tmp/lsimem.txt #
dialog --textbox /tmp/lsimem.txt 0 0
GDIS
}
VDSO(){
clear
lsb_release -a > /tmp/lslsb.txt #
dialog --textbox /tmp/lslsb.txt 0 0
GDIS
}
VKER(){
clear
uname -r > /tmp/lsunam.txt #
dialog --textbox /tmp/lsunam.txt 0 0
}
IPVI(){
clear
lspci | grep -i vga > tmp/lsgrepi.txt #
dialog --textbox /tmp/lsgrepi.txt 0 0
GDIS
}
TPCL(){
clear
uptime > /tmp/lsupti_me.txt #
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
		*) dialog --title "Opção Invalida" --msgbox "Digite Novamente" 0 0 ; GDIS ;;
	esac
}

while (( $TMP == '0' )); do
	MENU
done
