#!/bin/csh -f

# NOTA: Se requiere las dependencias: csh, evince, ps2eps
# sudo apt install csh evince ps2eps

# Establecer entradas, salidas y parametros
set REGION = -114.037/-61.697/-16.655/22.601
set AXIS = a10.000f10.000/a10.000f10.000NEWS
set SIZE = M6.5i

set psfile = mapa_pisco_2007.ps
set epsfile = mapa_pisco_2007.eps
set cmtfile = pisco_cmt.txt

# Iniciar ploteando el mapa
psbasemap -J$SIZE -R$REGION -B$AXIS -X0.75i -Y1.0i -P -K > $psfile # Sin usar topografia

# Agregar lineas de costas y limites nacionales
pscoast -K -O -J -R -B -N1 -W -Df -A2055 -S120/180/225 -G220/220/220  -Lf-96.765/-10.374/2.973/1000.000 >> $psfile # Sin usar topografia

# Agregar etiquetas de localizacion de la estacion
# Ingresar longitud, latitud y nombre
pstext -K -O -D0.10i/0.10i -J  -R -S0.25/255 -G0/0/0 <<EOF >> $psfile 
-101.078 16.830  10 0 1 BL  UNM
EOF

pstext -R -JM -P -K -O <<EOF>> $psfile
-104.078 21.630  11 0 1 LT  MEXICO
-78.2 -6.0 11 0 1 LT PERU
-95.0 -5.5 11 0 1 LT OCEANO
-95.0 -6.8 11 0 1 LT PACIFICO
EOF

# Agregar informacion del evento
pstext -R -JM -Wwhite -O -K <<EOF>> $psfile
-86.20 -13.51 13 0 0 LT Pisco 2007
-84.60 -14.90 13 0 0 LT 8.0 Mw
EOF

# Agregar estaciones: ingresar longitud y latitud
psxy -K -O -J -R -St0.25i -G0/0/0 <<EOF >> $psfile 
-99.178 19.330 
EOF

# Agregar eventos sismicos en forma de mecanismos focales
psmeca $cmtfile -R -JM -Sm0.45c/-1 -G0/0/0 -W2/0/0/0 -P -O -K >> $psfile

# Terminar el Postscript
psxy -R -J -O /dev/null >> $psfile

ps2eps $psfile -f
evince $epsfile &
