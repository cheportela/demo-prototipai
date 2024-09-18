#!/bin/bash

# Caminho para o arquivo CSS
CSS_FILE="style.css"

# Verificar se o arquivo CSS existe
if [ ! -f "$CSS_FILE" ]; then
    echo "Erro: Arquivo $CSS_FILE não encontrado."
    exit 1
fi

# Fazer backup antes de aplicar novas alterações
BACKUP_FILE="assets/style_backup_new_changes_$(date +%F_%T).css"
cp "$CSS_FILE" "$BACKUP_FILE"
echo "Backup criado: $BACKUP_FILE"

# Função para substituir propriedades dentro de blocos CSS
replace_property() {
    local selector="$1"
    local property="$2"
    local new_value="$3"
    sed -i "/$selector\s*{/,/}/ s/$property: [^;]*;/$property: $new_value;/g" "$CSS_FILE"
}

# 1. Aumentar o tamanho da fonte do título do requisito (.card-header h2)
replace_property ".card-header h2" "font-size" "1.4rem"  # Aumenta ligeiramente o tamanho

# 2. Aumentar o espaço entre o status do item e a descrição (.status-item)
replace_property ".status-item" "margin-bottom" "10px"   # Aumenta o espaçamento

# 3. Ajustar botões de ação

# 3.1. Atualizar botão verde (Validação Concluída)
replace_property ".status-button.confirmed" "background-color" "#28a745"  # Verde
replace_property ".status-button.confirmed" "font-size" "16px"            # Aumenta o tamanho da fonte
replace_property ".status-button.confirmed" "color" "#FFFFFF"             # Garante que o texto seja branco
sed -i 's/Necessidade Confirmada/Validação Concluída/g' "$CSS_FILE"       # Altera o label

# 3.2. Atualizar botão laranja (Completar Informações)
replace_property ".status-button.incomplete" "background-color" "#fd7e14" # Laranja
replace_property ".status-button.incomplete" "font-size" "16px"           # Aumenta o tamanho da fonte
replace_property ".status-button.incomplete" "color" "#FFFFFF"            # Garante que o texto seja branco
sed -i 's/Completar Informações/Completar Informações/g' "$CSS_FILE"      # Mantém o label

# 3.3. Remover o botão vermelho (.status-button.pending)
sed -i '/\.status-button.pending/d' "$CSS_FILE"

# 4. Atualizar o botão "Gerar Escopo do Projeto" para "Gerar Documentação"
replace_property ".button-primary" "font-size" "20px"                     # Aumenta o tamanho da fonte
replace_property ".button-primary" "padding" "15px 35px"                  # Aumenta o padding
replace_property ".button-primary" "background-color" "#2d7cd2"           # Azul petróleo (mantém)
sed -i 's/Gerar Escopo do Projeto/Gerar Documentação/g' "$CSS_FILE"       # Altera o label

echo "Novas alterações no CSS aplicadas com sucesso!"
