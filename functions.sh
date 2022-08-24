#!/bin/bash

echo "Testando com funções."

function teste() {
	echo "$1"
}

myArray=("um" "dois" "tres" "quatro" "cinco")

for str in ${myArray[@]}; do
	teste $str
done
