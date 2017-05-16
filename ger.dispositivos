
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

		1) GREP ;;
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
GREP(){
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
		255) exit 0 ;;
		*) exit 0 ;;
	esac
}
CTEC(){
	dialog --yesno 'Aperte YES para configurar o teclado' 0 0
	if (( $? == "0" )); then
		sed 's/us/br/g' /etc/default/keyboard > /etc/default/keyboard.tmp && mv /etc/default/keyboard.tmp /etc/default/keyboard
	else
		GREP
	fi
		if (( $? == '0' )); then
			dialog --yesno 'Deseja reiniciar a máquina?' 0 0
				if (( $? == '0' )); then
					init 6
				else
					GREP
				fi
		fi
GREP
}
IBAT(){
clear
acpi -V
echo 'Digite [enter] para voltar'
read xxx
GREP
}
ICPU(){
clear
lscpu
echo 'Digite [enter] para voltar'
read xxx
GREP
}
IMEM(){
clear
free -h
echo 'Digite [enter] para voltar'
read xxx
GREP
}
VDSO(){
clear
lsb_release -a
echo 'Digite [enter] para voltar'
read xxx
GREP
}
VKER(){
clear
uname -r
echo 'Digite [enter] para voltar'
read xxx
GREP
}
IPVI(){
clear
lspci | grep -i vga
echo 'Digite [enter] para voltar'
read xxx
GREP
}
TPCL(){
clear
uptime
echo 'Digite [enter] para voltar'
read xxx
GREP
}

while (( $TMP == '0' )); do
	MENU
done
