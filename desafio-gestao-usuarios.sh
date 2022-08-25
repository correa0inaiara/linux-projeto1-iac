#!/bin/bash

echo -e "\n - Desafio 01 - Provisionamento de IaC - \n"
echo -e "\nETAPA 1: Criação de Diretórios\n"

diretorios=("publico" "adm" "ven" "sec")
for str in ${diretorios[@]}; do
	mkdir /$str
	echo -e "Diretório $str criado com sucesso!\n"

	if [ $str == "publico" ]
	then
		echo -e "Todos os usuários terão permissão total dentro do diretório $str.\n"
		chmod -R 777 /$str
	else
		echo -e "O dono de todos os diretórios criados será o usuário root.\n"
		echo -e "Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório.\n"
		echo -e "Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem.\n"
		chmod -R 770 /$str
	fi

done
echo -e "\nEtapa 1 concluída.\n"

grupos=("GRP_ADM" "GRP_VEN" "GRP_SEC")
echo -e "\nETAPA 2: Criação dos Grupos\n"
for str in ${grupos[@]}; do
	groupadd $str
	echo -e "Grupo $str criado com sucesso!\n"
	if [ $str == "GRP_ADM" ]
	then
		chown root:$str /adm
	elif [ $str == "GRP_VEN" ]
	then
		chown root:$str /ven
	elif [ $str == "GRP_SEC" ]
	then
		chown root:$str /sec
	fi
done
echo -e "\nEtapa 2 concluída.\n"

usuarios_grupo_adm=("carlos" "maria" "joao")
usuarios_grupo_ven=("debora" "sebastiana" "roberto")
usuarios_grupo_sec=("josefina" "amanda" "rogerio")

function cria_usuario() {
	useradd $1 -m -p $(openssl passwd Senha123) -s /bin/bash
	passwd $1 -e
	echo -e "Usuário $str criado com sucesso.\n"
}

function adiciona_usuario_a_um_grupo() {
	usermod -G $1 $2
	echo -e "Usuário $2 adicionado ao grupo $1.\n"
}

echo -e "\nCriando usuários e atribuíndo aos seus respectivos grupos.\n"
echo -e "Usuários do grupo adm\n"
for str in ${usuarios_grupo_adm[@]}; do
	cria_usuario $str
	adiciona_usuario_a_um_grupo GRP_ADM $str
done
echo -e "Usuários do grupo ven\n"
for str in ${usuarios_grupo_ven[@]}; do
        cria_usuario $str
        adiciona_usuario_a_um_grupo GRP_VEN $str
done
echo -e "Usuários do grupo sec\n"
for str in ${usuarios_grupo_sec[@]}; do
        cria_usuario $str
        adiciona_usuario_a_um_grupo GRP_SEC $str
done


echo -e "\nObservação: Todos os usuários foram criados com a senha padrão: Senha123.\n"
echo -e "\nEtapa 3 concluída.\n"
echo -e "\n - Desafio concluído -\n"
