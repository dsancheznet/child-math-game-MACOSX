#!/bin/bash

#Font control
FONT_RESET="\033[0m"
FONT_BOLD="\033[1m"
FONT_DIM="\033[2m"
FONT_DARK_GRAY="\033[90m"
FONT_LIGHT_CYAN="\033[96m"
FONT_WHITE="\033[97m"
#Font control end

clear
echo
echo " ██████╗ ███████╗███████╗████████╗ █████╗ ███████╗"
echo " ██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔════╝"
echo " ██████╔╝█████╗  ███████╗   ██║   ███████║███████╗"
echo " ██╔══██╗██╔══╝  ╚════██║   ██║   ██╔══██║╚════██║"
echo " ██║  ██║███████╗███████║   ██║   ██║  ██║███████║"
echo " ╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝"
echo "  Juego por D.Sanchez (c)2019, publicado bajo GPL"
echo

say "Bienvenidos al juego para practicar restas."
say "¿Cual es el número máximo al que limitar el minuendo?" &

read -p "¿Cual es el número máximo al que limitar el minuendo? " MAXIMO

say "Muy bien, vamos allá..."

PUNTOS=0
NUMBERONE=0
NUMBERTWO=0

for COUNT in {1..20}; do
	clear
	echo -e "$FONT_INVERT Quedan $((20 - COUNT)) preguntas."
	echo -e "$FONT_RESET Llevas acertadas $FONT_BOLD$FONT_WHITE$PUNTOS$FONT_RESET"
	NUMBERONE=$(( (RANDOM % MAXIMO)+1 ))
	NUMBERTWO=$(( (RANDOM % MAXIMO)+1 ))
	RESULT=$[NUMBERONE-NUMBERTWO]
	while [[ $RESULT < 0 ]]; do
		echo "Minuend $NUMBERONE"
		echo "Repeating shuffle: $NUMBERTWO ( Result would be $RESULT)"
		NUMBERTWO=$(( (RANDOM % MAXIMO)+1 ))
		RESULT=$[NUMBERONE-NUMBERTWO]
	done
	say "¿Cuánto es $NUMBERONE menos $NUMBERTWO? " &
	echo -n -e "¿Cuánto es $FONT_BOLD$FONT_LIGHT_CYAN$NUMBERONE$FONT_RESET - $FONT_BOLD$FONT_LIGHT_CYAN$NUMBERTWO$FONT_RESET? "
	read -t 1 -n 10000 discard
	read -t 10 RESPONSE
	if [ $? == 0 ]; then
		if (( $RESPONSE == $RESULT )); then
			say "Muy bien!"
			(( PUNTOS++ ))
		else
			say "¡Has fallado!"
		fi
	else
		say "Tu tiempo ha acabado"
	fi
	say "$NUMBERONE menos $NUMBERTWO es $RESULT"
done

echo "$PUNTOS acertados de $COUNT"
say "Has terminado los 20 ejercicios."

./results.sh $PUNTOS
