# Apoyo para corrección del taller 1

# Selecciona un directorio con audios
# entrega un reporte



directorio$ = chooseDirectory$: "Elije el directorio con los audios"

strings_s = Create Strings as file list: "lista_audios", directorio$ + "/*.wav"

ene_s = Get number of strings





writeInfoLine: "Reporte de los audios de ", directorio$

appendInfoLine: "nombre",tab$,"fm",tab$,"Amp",tab$,"x0"





for i to ene_s

select strings_s

audio$ = Get string... i

nombre_audio$ = audio$-".wav"

audio = Read from file... 'directorio$'/'audio$'


duracion = Get total duration


fm = Get sampling frequency

if fm <> 22050

valor_fm = 0

else

valor_fm = 1

endif

max = Get maximum: 0, 0, "sinc70"

if max < 0.5

valor_max = 0

else

valor_max = 1

endif


cruce_cero_inicio = Get value at time: 1, 0, "nearest"

cruce_cero_final = Get value at time: 0, duracion, "nearest"


if cruce_cero_inicio > 0.02 or cruce_cero_final > 0.02

appendInfoLine: "problema con ajustes a cruce por cero"

cruce = 0

else

cruce = 1

endif

appendInfoLine: nombre_audio$,tab$,valor_fm,tab$,valor_max,tab$,cruce

select audio
Remove

endfor

appendInfoLine: "Un total de ",ene_s," archivos .wav."

if ene_s < 13

writeInfoLine: "No entrega todos los audios"

endif
