#!/bin/bash

#Font control
FONT_RESET="\033[0m"
FONT_BOLD="\033[1m"
FONT_DIM="\033[2m"
FONT_DARK_GRAY="\033[90m"
FONT_LIGHT_CYAN="\033[96m"
FONT_WHITE="\033[97m"
#Font control end

#Init some variables
NOMBRE=`echo $1 | tr a-z A-Z`
PUNTOS=0
ACIERTOS=(0 1 2 3 4 5 6 7 8 9)
FALLOS=(0 1 2 3 4 5 6 7 8 9)
for I in {0..9}; do
  ACIERTOS[$I]=0
  FALLOS[$I]=0
done
ULTIMO=0
#Variables end

clear
echo
echo -e " ████████╗ █████╗ ██████╗ ██╗      █████╗ ███████╗"
echo -e " ╚══██╔══╝██╔══██╗██╔══██╗██║     ██╔══██╗██╔════╝"
echo -e "    ██║   ███████║██████╔╝██║     ███████║███████╗"
echo -e "    ██║   ██╔══██║██╔══██╗██║     ██╔══██║╚════██║"
echo -e "    ██║   ██║  ██║██████╔╝███████╗██║  ██║███████║"
echo -e "    ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝"
echo -e "  Juego por D.Sanchez (c)2019, publicado bajo GPL"
echo

say "Hola $NOMBRE, vamos a practicar algunas tablas de multiplicar."
say "¿Qué tabla practicamos hoy?" &

read -p "¿Qué tabla practicamos hoy? " TABLE

say "Muy bien, vamos con la tabla del $TABLE"

for COUNT in {1..20}; do
	clear
	echo -e "$FONT_INVERT Quedan $((20 - COUNT)) preguntas."
	echo -e "$FONT_RESET Llevas acertadas $FONT_BOLD$FONT_WHITE$PUNTOS$FONT_RESET"
	while :; do
		ITERATION=$[(RANDOM % 9)+1]
		if [[ $ITERATION != $ULTIMO ]]; then
      break
    fi
	done
  ULTIMO=$ITERATION
	RESULT=$[TABLE*ITERATION]
	say "¿Cuánto es $TABLE por $ITERATION? " &
	echo -n -e "¿Cuánto es $FONT_BOLD$FONT_LIGHT_CYAN$TABLE$FONT_RESET x $FONT_BOLD$FONT_LIGHT_CYAN$ITERATION$FONT_RESET? "
	read -t 1 -n 10000 discard
	read -t 8 RESPONSE
	if [ $? == 0 ]; then
		if (( $RESPONSE == $RESULT )); then
			say "Muy bien!"
			(( PUNTOS++ ))
			(( ACIERTOS[$ITERATION]++ ))
		else
			say "¡Has fallado!"
			(( FALLOS[$ITERATION]++ ))
		fi
	else
		say "Tu tiempo ha acabado"
		(( FALLOS[$ITERATION]++ ))
	fi
	say "$TABLE por $ITERATION es $RESULT"
done

EVALUACION="$TABLE,$PUNTOS"
for I in {1..9}; do
	EVALUACION+=",${ACIERTOS[$I]}|${FALLOS[$I]}"
done

FECHAHORA=`date +%d%b%Y-%H:%M | tr a-z A-Z`

echo "$PUNTOS acertados de $COUNT"
echo "$FECHAHORA,TABLAS,$EVALUACION">>./PNT/$NOMBRE.csv
say "Has terminado los 20 ejercicios."

./results.sh $PUNTOS $TABLE
