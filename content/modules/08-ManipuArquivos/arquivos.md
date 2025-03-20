# Manipulação de Arquivos e Diretórios com PowerShell

## Introdução

PowerShell oferece uma variedade de cmdlets para manipular arquivos e diretórios, permitindo que você crie, copie, mova, renomeie e exclua itens no sistema de arquivos.

## Cmdlets Principais

### **Get-ChildItem**:
    - **Função**: Lista arquivos e diretórios em um diretório.
    - **Exemplo**:

```powershell
Get-ChildItem -Path "C:\MeuDiretorio"
```

    - **Parâmetros úteis**:
        - `-Recurse`: Lista itens recursivamente em subpastas.
        - `-Filter`: Filtra itens por nome.
        - `-Force`: Exibe itens ocultos ou do sistema.

<div style="border: 1px solidrgb(19, 20, 20); border-left-width: 5px; padding: 10px; background-color:rgb(175, 178, 181); border-radius: 5px;">
💡 <strong>Dica:</strong> Se você precisar referenciar o diretório atual, basta usar o caractere `.`. Desta forma o complemnto ficaria: <strong>Get-ChildItem -Path "."</strong></div><br>

### **New-Item**:
    - **Função**: Cria novos arquivos ou diretórios.
    - **Exemplo**:

```powershell
New-Item -ItemType "directory" -Path "C:\NovoDiretorio"
```

    - **Parâmetros úteis**:
        - `-ItemType`: Especifica se é um arquivo ou diretório.
        - `-Value`: Define conteúdo inicial para arquivos.
### **Copy-Item**:
    - **Função**: Copia arquivos ou diretórios.
    - **Exemplo**:

```powershell
Copy-Item -Path "C:\Arquivo.txt" -Destination "C:\Backup"
```

    - **Parâmetros úteis**:
        - `-Recurse`: Copia todo o conteúdo de uma pasta.
        - `-Force`: Substitui itens de destino existentes.
### **Move-Item**:
    - **Função**: Move ou renomeia arquivos ou diretórios.
    - **Exemplo**:

```powershell
Move-Item -Path "C:\Arquivo.txt" -Destination "C:\NovoLocal"
```

    - **Parâmetros úteis**:
        - `-Force`: Move itens mesmo se o destino já existir.
### **Remove-Item**:
    - **Função**: Exclui arquivos ou diretórios.
    - **Exemplo**:

```powershell
Remove-Item -Path "C:\Arquivo.txt"
```

    - **Parâmetros úteis**:
        - `-Recurse`: Exclui todo o conteúdo de uma pasta.
        - `-Force`: Exclui itens mesmo se forem somente leitura.

## Exemplo Prático

Suponha que você queira criar um diretório chamado "MeuBackup", copiar todos os arquivos `.txt` do diretório atual para esse novo diretório e, em seguida, excluir os arquivos originais.

```powershell
# Criar o diretório de backup
New-Item -ItemType "directory" -Path "C:\MeuBackup"

# Copiar arquivos .txt para o diretório de backup
Get-ChildItem -Filter "*.txt" | Copy-Item -Destination "C:\MeuBackup"

# Excluir os arquivos originais
Get-ChildItem -Filter "*.txt" | Remove-Item
```


### Dicas para Manipulação de Arquivos e Diretórios

- **Testar Comandos**: Antes de executar comandos que alterem dados, teste-os em um ambiente seguro para evitar perdas de dados.
- **Usar Parâmetros de Segurança**: Use `-WhatIf` e `-Confirm` para simular ações e confirmar operações potencialmente perigosas.
- **Filtrar Itens**: Use `-Filter` ou `Where-Object` para selecionar itens específicos com base em critérios como nome, tamanho ou data de modificação.

Essas são as principais formas de manipular arquivos e diretórios com PowerShell. Com esses cmdlets, você pode automatizar tarefas de gerenciamento de arquivos de forma eficiente.


