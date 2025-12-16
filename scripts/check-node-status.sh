#!/usr/bin/env bash

# Простой тест RPC (подразумевается, что контейнер работает)
RPC_URL=${1:-"http://localhost:8545"}

echo "Проверяю статус узла по RPC: $RPC_URL"

RESPONSE=$(curl -s -X POST "$RPC_URL" \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}')

if echo "$RESPONSE" | grep -q '"result"'; then
  echo "✅ Узел отвечает! Ответ RPC:"
  echo "$RESPONSE"
else
  echo "❌ Ошибка: узел не отвечает или неверный адрес RPC."
  echo "$RESPONSE"
  exit 1
fi
