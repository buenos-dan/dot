#!/bin/zsh

VAULT_PATH="${HOME}/Zettelkasten"

cd ${VAULT_PATH}
if [ ! -z $1 ]; then
    filename=`rg $1 | awk -F : 'NR==1 {print $1}'`
    if [ ! -z ${filename} -a -f ${filename} ]; then
        vim --cmd 'let g:loaded_zettelkasten=1' ${filename}
        exit 0
    fi
fi

vim --cmd 'let g:loaded_zettelkasten=1' -c 'RandomOpenFleetingNote' -c 'Rg'

