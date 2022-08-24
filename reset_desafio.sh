#!/bin/bash

echo -e "\n RESSETANDO AS ALTERAÇÕES DO DESAFIO"

grupos=("GRP_ADM" "GRP_VEN" "GRP_SEC")
for str in ${grupos[@]}; do
	groupdel $str
	echo "Grupo $str deletado com sucesso."
done

usuarios=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")
for str in ${usuarios[@]}; do
	userdel -r $str
	echo "Usuário $str deletado."
done

diretorios=("publico" "adm" "ven" "sec")
for str in ${diretorios[@]}; do
	rm -rv /$str
done
echo "Diretórios excluídos com sucesso."

echo -e "\nAlterações realizadas pelo desafio ressetadas com sucesso."
