#!/bin/bash

echo "==============================================="
echo " CRONOGRAMA MAMP - MULTI-COMPUTADOR CORRIGIDO"
echo "==============================================="
echo ""
echo "Versão corrigida para problemas de permissões"
echo "no Windows e pastas de rede compartilhadas"
echo ""
echo "IMPORTANTE: Este executável cria um banco de dados"
echo "COMPARTILHADO na mesma pasta do arquivo executável"
echo ""
echo "Todos os computadores que acessam esta pasta"
echo "vão ver as MESMAS alterações automaticamente!"
echo ""
echo "==============================================="
echo ""

# Detectar sistema operacional
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "Iniciando servidor para macOS..."
    ./cronograma-mamp-multicomputador-macos-CORRIGIDO &
    PID=$!
    BROWSER_CMD="open"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "Iniciando servidor para Linux..."
    ./cronograma-mamp-multicomputador-linux-CORRIGIDO &
    PID=$!
    BROWSER_CMD="xdg-open"
else
    echo "Sistema operacional não detectado automaticamente"
    echo "Tente executar o arquivo apropriado manualmente:"
    echo "- Linux: ./cronograma-mamp-multicomputador-linux-CORRIGIDO"
    echo "- macOS: ./cronograma-mamp-multicomputador-macos-CORRIGIDO"
    exit 1
fi

echo "Aguardando servidor inicializar..."
sleep 3

echo ""
echo "Abrindo navegador..."
$BROWSER_CMD http://localhost:3000 2>/dev/null &

echo ""
echo "==============================================="
echo " Servidor rodando em: http://localhost:3000"
echo " "
echo " MULTI-COMPUTADOR ATIVO! (Versão Corrigida)"
echo " Alterações serão compartilhadas automaticamente"
echo "==============================================="
echo ""
echo "Pressione Ctrl+C para parar o servidor..."

# Aguardar o processo terminar
wait $PID
