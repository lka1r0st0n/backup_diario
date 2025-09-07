#!/bin/bash

# Tarefa 1: Definição de variáveis
# Define o diretório de origem que será copiado
source_dir="/Users/alexandresantos" 

# Tarefa 2: Definição do diretório de destino
# O diretório onde o backup será armazenado
dest_dir="/Users/alexandresantos/backup"

# Tarefa 3: Criar um carimbo de data/hora
# Isso garantirá que cada backup tenha um nome único
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

# Tarefa 4: Nome do arquivo de backup
# Combina o nome do arquivo com o carimbo de data/hora
backup_file="backup-${timestamp}.tar.gz"

# Tarefa 20: Definir caminho para o arquivo de log
log_file="$dest_dir/backup.log"

# Tarefas 5-13: Lógica principal do script

# CORREÇÃO: Redireciona a saída do script para o arquivo de log de forma compatível
exec >> "$log_file" 2>&1

echo "--------------------------------------------------------"
echo "Backup iniciado em: $(date)"
echo "--------------------------------------------------------"

# Verifica se o diretório de destino existe. Se não, ele cria.
if [ ! -d "$dest_dir" ]; then
    mkdir -p "$dest_dir"
fi

# Cria o arquivo de backup compactado
echo "Criando backup de $source_dir..."
tar -czf "$dest_dir/$backup_file" "$source_dir"

# Verifica se o comando tar foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Backup concluído com sucesso!"
    echo "Arquivo de backup: $dest_dir/$backup_file"
else
    echo "Erro: O backup falhou."
fi

# Tarefa 18: Excluir backups antigos
# Define quantos dias os backups devem ser mantidos
days_to_keep=7 

echo "--------------------------------------------------------"
echo "Verificando e excluindo backups com mais de $days_to_keep dias..."
find "$dest_dir" -name "backup-*.tar.gz" -mtime +$days_to_keep -exec rm -v {} \;
echo "Limpeza de arquivos antigos concluída."
echo "--------------------------------------------------------"

echo "--------------------------------------------------------"
echo "Backup finalizado em: $(date)"
echo "--------------------------------------------------------"