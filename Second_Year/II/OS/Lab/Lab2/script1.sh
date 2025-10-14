#!/bin/bash

#pentru fiecare fisier din dir curent creez cate un director
for fisier in *
do
 #testez daca fisierele au permisiunile stabilte
  if test "$1" != "read" && test "$1" != "write" && test "$1" != "execute"
  then
  #creez directorul cu acelasi nume ca fisierul
    dir_name="$fisier.dir"
    mkdir "$dir_name"
    #calculez size ul fisierului
    size=`cat "$fisier" | wc -c`
    #afisez size ul in size.txt
    echo "$size" > "$dir_name/size.txt"
  fi
done
