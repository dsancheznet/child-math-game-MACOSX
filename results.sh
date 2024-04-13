#!/bin/bash


say "Has acertado $1 preguntas de la tabla del $2."

if [[ -f "./padre.num" ]]; then
  SUPERVISOR=`cat ./padre.num`
  if [[ $1 < 20 ]]; then
    osascript ./iMessage.applescript $SUPERVISOR "Tabla $2; Aciertos $1"
  else
    osascript ./iMessage.applescript $SUPERVISOR "Tabla $2; TERMINADA"
  fi
fi

CHOICE=$(( (RANDOM % 4)+1 ))

#For debugging purposes
#echo "Result $CHOICE"

if [[ $1 == 20 ]]; then
  case $CHOICE in
    1 ) say "Tus resultados son perfectos. Eres una máquina. Ya te lo sabes bien!" ;;
    2 ) say "Tus resultados son excelentes. Einstein era un aficionado en comparación contigo." ;;
    3 ) say "¡Maravilloso! Ni un fallo. Eso es digno de elógio." ;;
    4 ) say "Tus resultados son perfectos. Eres una máquina. Ya te lo sabes bien!" ;;
  esac
	exit
fi
if [[ $1 > 16 ]]; then
  case $CHOICE in
    1 ) say "Tus resultados son buenos, pero podrías practicar un poco más." ;;
    2 ) say "No está mal. Te queda un poquito para alcanzar la perfección." ;;
    3 ) say "¡Bien! Pero como todo en esta vida es un resultado mejorable." ;;
    4 ) say "¡Venga! ¡Otra vez! Demuéstrame que lo puedes hacer perfecto." ;;
  esac
	exit
fi
if [[ $1 > 12 ]]; then
  case $CHOICE in
    1 ) say "Tus resultados son regulares. No te has esforzado mucho. Concéntrate un poco más." ;;
    2 ) say "¡Hombre! Bien, lo que se dice bien, no está. Hazlo otra vez anda." ;;
    3 ) say "La sabiduría es una mezcla de sudor y codos...y ahora mismo veo tu frente seca, no digo más." ;;
    4 ) say "Esto es bastante mejorable. Te queda un largo camino por delánte, mi pequeño saltamontes." ;;
  esac
else
  case $CHOICE in
    1 ) say "Tus resultados son bastante malos. Has contestado a voleo ¿verdad?" ;;
    2 ) say "Estos resultados son muy feos. Si mi perro fuera tan feo. Le afeitaría el cuulo, y, le enseñaría a caminar para atrás." ;;
    3 ) say "Muchaaachaa. Chiquito desastre de resultados." ;;
    4 ) say "Estos resultados son más malos que un hacha de palo. Dedícate a la pesca mai frend." ;;
  esac
fi
