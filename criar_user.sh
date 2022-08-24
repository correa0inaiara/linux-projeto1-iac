#!/bin/bash

echo "Criando usuários do sistema..."

useradd guest10 -c "Usuário Convidado" -s /bin/bash -m -p $(openssl passwd Senha123)
passwd guest10 -e

echo "Usuário guest10 criado com sucesso. Senha: Senha123"

useradd guest11 -c "Usuário Convidado" -s /bin/bash -m -p $(openssl passwd Senha123)
passwd guest11 -e

echo "Usuário guest11 criado com sucesso. Senha: Senha123"

useradd guest12 -c "Usuário Convidado" -s /bin/bash -m -p $(openssl passwd Senha123)
passwd guest12 -e

echo "Usuário guest12 criado com sucesso. Senha: Senha123"

useradd guest13 -c "Usuário Convidado" -s /bin/bash -m -p $(openssl passwd Senha123)
passwd guest13 -e

echo "Usuário guest13 criado com sucesso. Senha: Senha123"

echo "Finalizado!"
