# 🗄️ Auto Backup

Um script simples, robusto e personalizável em **Bash** para automatizar o backup de arquivos pessoais. Ele compacta o diretório do usuário (`/Users/usuario`) com carimbo de data/hora, salva em um diretório de destino e remove backups antigos automaticamente.

---

## 🚀 Funcionalidades

* **Backup Automatizado:** Cria um arquivo compactado (`.tar.gz`) do seu diretório principal.
* **Carimbo de Data/Hora:** Garante nomes únicos para cada backup, facilitando a organização.
* **Limpeza Inteligente:** Remove backups com mais de *X* dias, otimizando o uso de espaço em disco.
* **Log de Execução:** Registra todas as ações e erros em um arquivo de log para auditoria e troubleshooting.

---

## ⚙️ Requisitos

* Sistema operacional **macOS** ou **Linux**
* Terminal com suporte ao **Bash**

---

## 📝 Como Usar

### 1️⃣ Clone o repositório

```bash
git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
cd SEU_REPOSITORIO
```

### 2️⃣ Configure o script

Edite o arquivo `auto_backup.sh` para definir:

```bash
# Diretório de origem (o que será copiado)
source_dir="/Users/seu_usuario"

# Diretório de destino (onde o backup será salvo)
dest_dir="/Users/seu_usuario/backup"

# Quantos dias os backups devem ser mantidos
days_to_keep=7
```

### 3️⃣ Torne o script executável

```bash
chmod +x auto_backup.sh
```

### 4️⃣ Execute o script manualmente

```bash
./auto_backup.sh
```

### 5️⃣ Agende execuções automáticas (recomendado)

Para agendar backups diários, use o **cron**:

1. Abra o crontab:

   ```bash
   crontab -e
   ```

2. Adicione a linha abaixo para executar o script diariamente às 01:00:

   ```bash
   0 1 * * * /Users/seu_usuario/SEU_REPOSITORIO/auto_backup.sh
   ```

   > ⚠️ Certifique-se de ajustar o caminho conforme a localização real do script.

---

## 📜 Log de Atividades

Um arquivo `backup.log` é gerado automaticamente no diretório de destino (`dest_dir`), contendo registros de todas as execuções, incluindo data, hora, arquivos processados e mensagens de erro, se houver.

---

## 🤝 Contribuições

Contribuições são bem-vindas! Se você tiver sugestões, melhorias ou encontrar bugs, abra uma [issue](https://github.com/SEU_USUARIO/SEU_REPOSITORIO/issues) ou envie um *pull request*.