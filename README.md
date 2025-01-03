# GaleXtra: Extractor multilingüe de términos multipalabra

## REQUISITOS

    * Distribución linux
    * Intérprete perl situado por defecto en /usr/bin
    * (opcional) Previa instalacion de Freeling (versión >= 3.0)

GaleXtra incluye la instalacion (parcial) de Tree-Tagger

## CÓMO SE INSTALA

(1)
> git clone https://github.com/gamallo/galeXtra.git

(2)
> sh install-galeXtra.sh

La instalación incluye los ficheros de parámetros de tree-tagger.
Atención: no se debe instalar en un directorio cuyo nombre contiene espacios en blanco!


## CÓMO SE EJECUTA

Syntax: extractorTermos.sh <tagger> <lang> <measure> <file> [FR]
  
      tagger=freeling, treetagger
      language=gl, es, en, pt, fr
      measure=chi,log,mi,scp,cooc

      FR=lowest frequency


## FORMATO DE ENTRADA

Un fichero con texto bruto, en formato plano ("plain text"), codificado en UTF-8

## FORMATO DE SALIDA

Texto en formato plano. Cada línea contiene tres columnas: (1) el término multi-palabra extraído, (2) el patrón de etiquetas morfosintácticas y (3) el grado de asociación entre las palabras que constituyen el término multi-palabra. Ejemplo:

tasa de crecimiento 	N-P-N 	0.023
tasa interanual 	N-A 	0.056

## DESCRIPCIÓN

GaleXtract fue elaborado dentro del proyecto Gari-Coter. El sistema toma como entrada un texto en formato "plain text", selecciona candidatos a término a partir de 5 patrones de etiquetas morfosintácticas y un filtro por frecuencias, y finalmente ordena los candidatos seleccionados usando una medida de asociación (entre 4 disponibles). La salida del extractor es una lista ordenada de términos multi-palabra.

GaleXtract genera la lista de términos en cuatro procesos: (1) etiquetación morfosintáctica, (2) pre-selección de candidatos por medio de patrones de etiquetas, (3) filtrado por frecuencias y (4) ordenación por valores de asociación.

(1) Etiquetación morfosintáctica

El extractor parte de texto en "plain text", codificado en ISO latin. El texto de entrada es etiquetado morfosintácticamente mediante Freeling o Treetagger. Se puede usar texto escrito en 5 lenguas:

    * gallego (Treetagger, Freeling)
    * castellano (Treetagger, Freeling)
    * inglés (Treetagger, Freeling)
    * portugués (Treetageri,Freeling)
    * francés (Treetagger)

(2) Patrones de etiquetas

Una vez etiquetado el texto, se seleccionan las expresiones que aparecen en 5 patrones de etiquetas (N=nombre, A=adjetivo, P=preposición, V=verbo, PCLE=partícula):

    * N-A
    * A-N
    * N-N
    * N-P-N
    * V-PCLE

En el formulario de consulta, puede escoger 5 lenguas y 2 etiquetadores, teniendo en cuenta que el francés y el portugués sólo permiten texto etiquetado con Treetagger.

(3) Filtrado

El sistema selecciona aquellas expresiones que ocurren en el corpus con una frecuencia superior a un determinado umbral (freq=1, por defecto). El formulario de muestra permite escoger un umbral (frecuencia mínima) entre 1 y 5.

(4) Ordenación

Una vez seleccionada la lista de los candidatos a término, el sistema la ordena de mayor a menor utilizando una medida de asociación estadística. Se puede escoger entre 5 medidas: coocurrencias (cooc), loglike (log), ji-cuadrado (chi), información mutua (mi) o SCP (scp). 

## PUBLICACIONES ASOCIADAS:
* Barcala M., E. Domínguez-Noya, P. Gamallo, M.López, E. Moscoso, G. Rojo, P. Santalla, S. Sotelo. (2007). A Corpus and Lexical Resources for Multi-word Terminology Extraction in the Field of Economy, 3rd Language & Technology Conference(LeTC'2007), Poznan, Poland (355-359). 

* Barcala, Mario, Eva Domínguez, Pablo Gamallo, Marisol López, Eduardo Miguel Moscoso, Guillermo Rojo, María Paula Santalla del Río, Susana Sotelo (2007). "El Proyecto Gari-Coter en el Seno del Proyecto RICOTERM2". Procesamiento del Lenguaje Natural, 39.
