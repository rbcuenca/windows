# Gerenciamento Básico de Serviços e Processos

## Introdução

PowerShell oferece uma variedade de cmdlets para gerenciar serviços e processos no Windows, permitindo que você liste, inicie, pare e reinicie serviços, além de monitorar e controlar processos em execução.

## Gerenciamento de Serviços (Cmdlets Principais para Serviços)

<div style="border: 1px solidrgb(19, 20, 20); border-left-width: 5px; padding: 10px; background-color:rgb(175, 178, 181); border-radius: 5px;">
💡 <strong>Dica:</strong> Para alguns comandos é necessário que o PS seja iniciado com permissão de adminsitrador.</div><br>

### **Get-Service**:
    - **Função**: Obtém informações sobre serviços no computador.
    - **Exemplo**:

```powershell
Get-Service
```

    - **Parâmetros úteis**:
        - `-Name`: Filtra serviços por nome.
        - `-DisplayName`: Filtra serviços pelo nome de exibição.
        - `-ComputerName`: Obtém serviços em computadores remotos.
### **Start-Service**:
    - **Função**: Inicia um serviço.
    - **Exemplo**:

```powershell
Start-Service -Name "Spooler"
```

### **Stop-Service**:
    - **Função**: Para um serviço.
    - **Exemplo**:

```powershell
Stop-Service -Name "Spooler"
```

### **Restart-Service**:
    - **Função**: Reinicia um serviço.
    - **Exemplo**:

```powershell
Restart-Service -Name "Spooler"
```

### **Suspend-Service**:
    - **Função**: Suspender um serviço.
    - **Exemplo**:

```powershell
Suspend-Service -Name "Spooler"
```

### **Resume-Service**:
    - **Função**: Retomar um serviço suspenso.
    - **Exemplo**:

```powershell
Resume-Service -Name "Spooler"
```


### Exemplo Prático

Suponha que você queira verificar se o serviço "Spooler" está em execução e, se não estiver, iniciá-lo.

```powershell
# Verificar se o serviço está em execução
$serviceStatus = (Get-Service -Name "Spooler").Status

if ($serviceStatus -ne "Running") {
    # Iniciar o serviço se não estiver em execução
    Start-Service -Name "Spooler"
}
```


## Gerenciamento de Processos (Cmdlets Principais para Processos)

### **Get-Process**:
    - **Função**: Obtém informações sobre processos em execução.
    - **Exemplo**:

```powershell
Get-Process
```

    - **Parâmetros úteis**:
        - `-Name`: Filtra processos por nome.
        - `-Id`: Filtra processos por ID.
### **Start-Process**:
    - **Função**: Inicia um novo processo.
    - **Exemplo**:

```powershell
Start-Process -FilePath "notepad.exe"
```

### **Stop-Process**:
    - **Função**: Encerra um processo.
    - **Exemplo**:

```powershell
Stop-Process -Name "notepad" -Force
```

### Exemplo Prático

Suponha que você queira encerrar todos os processos do Microsoft Edge.

```powershell
# Encerrar todos os processos do Microsoft Edge
Get-Process -Name "msedge" | Stop-Process -Force
```
<div style="border: 1px solidrgb(19, 20, 20); border-left-width: 5px; padding: 10px; background-color:rgb(175, 178, 181); border-radius: 5px;">
💡 <strong>Dica:</strong> Este comando tem a mesma função que o comando <strong>kill</strong> no Linux.</div><br>

## Dicas para Gerenciar Serviços e Processos

- **Testar Comandos**: Antes de executar comandos que alterem o estado de serviços ou processos, teste-os em um ambiente seguro.
- **Usar Parâmetros de Segurança**: Use `-WhatIf` e `-Confirm` para simular ações e confirmar operações potencialmente perigosas.
- **Evitar Parar Processos Críticos**: Tenha cuidado ao encerrar processos, pois alguns são essenciais para o funcionamento do sistema.

Essas são as principais formas de gerenciar serviços e processos com PowerShell. Com esses cmdlets, você pode automatizar tarefas de gerenciamento de sistema de forma eficiente.