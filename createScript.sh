#!/usr/bin/env bash
#
# createScript - cria um aquivo shell com a linha de hashbang presente
# alem da permissao de execucao, nome do autor e abertura do arquivo com o nano.
#
# Autor : Pedro Ribeiro (Drepz);
#
#----------------------------------------------------------------------------
#
# Esse programa recebe apenas dois parametros sendo um o nome do arquivo a ser
# criado e o outro o nome do autor lembrando que o nome do arquivo deve ser padronizado
# e o nome do autor deve ser escrito entre aspas caso possua espaços
#
#----------------------------------------------------------------------------
# Exemplo:
#	./createScript meu_arquivo1.sh "nome do autor"
#
#----------------------------------------------------------------------------
msg_muitos_argumentos="o comando aceita apenas dois argumento tente novamente!"
msg_nenhum_argumento="o comando deve conter necessariamente dois argumento!"
msg_arquivo_existente="o nome de arquivo escolhido ja esta em uso"
data=$( date '%d/%m/%Y' )
[ $# -le 0 ] && echo $msg_nenhum_argumento && exit 1

[ $# -ne 2 ]  &&  echo $msg_muitos_argumentos && exit 1

[ -f $1 ] && echo $msg_arquivo_existente && exit 1

echo '#!/usr/bin/env bash' > $1

    echo "#" >> $1

echo "#------------------------------------------------------------------------
# Nome     : $1
# Autor    : $2
# Descricao:
# Licenca  :
# Versao   : v0.1
# Data     : $data
#------------------------------------------------------------------------
" >> $1

chmod +x $1

nano $1
