# Projeto Final
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# 

---

# A gora sobre o projeto. Descreva o enunciado detalhadamente e o gabarito explicado ponto a ponto com a solução funcional para o Windows 11

Claro! Aqui está uma descrição detalhada do enunciado do projeto e a solução funcional para o Windows 11.

## Enunciado do Projeto

**Título:** Sistema de Monitoramento de Recursos do Sistema

**Objetivo:** Criar um script PowerShell que monitora o uso de CPU, memória e disco, gera relatórios diários e envia alertas por e-mail quando os limites pré-definidos são ultrapassados.

**Requisitos:**

1. **Monitoramento de Recursos**:
    - Coletar informações sobre o uso de CPU, memória e disco.
    - Usar variáveis para armazenar os limites de alerta.
2. **Geração de Relatórios**:
    - Criar relatórios diários sobre o uso de recursos.
    - Salvar os relatórios em um diretório especificado.
3. **Envio de Alertas**:
    - Enviar alertas por e-mail quando os limites forem ultrapassados.
    - Usar variáveis de ambiente para armazenar informações de e-mail.
4. **Tratamento de Erros e Logging**:
    - Implementar tratamento de erros para garantir que o script continue funcionando mesmo em caso de erros.
    - Registrar eventos importantes no Visualizador de Eventos.

## Solução Funcional para o Windows 11

### Passo 1: Configuração Inicial

1. **Definir Limites de Alerta**:

```powershell
$cpuThreshold = 80
$memoryThreshold = 90
$diskThreshold = 85
```

2. **Definir Diretório para Relatórios**:

```powershell
$reportDir = "C:\SystemReports"
```

3. **Criar Diretório para Relatórios se Não Existir**:

```powershell
if (!(Test-Path $reportDir)) {
    New-Item -ItemType Directory -Path $reportDir
}
```


### Passo 2: Função de Monitoramento

1. **Coletar Informações de Uso de Recursos**:

```powershell
function Get-SystemInfo {
    $cpu = (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
    $memory = (Get-WmiObject Win32_OperatingSystem).FreePhysicalMemory / (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory * 100
    $disk = (Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / (Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'").Size * 100

    return @{
        CPU = $cpu
        Memory = $memory
        Disk = $disk
    }
}
```


### Passo 3: Geração de Relatórios

1. **Função para Gerar Relatórios**:

```powershell
function Generate-Report {
    param($systemInfo)
    
    $report = "System Report - $(Get-Date)`n"
    $report += "CPU Usage: $($systemInfo.CPU)%`n"
    $report += "Memory Usage: $($systemInfo.Memory)%`n"
    $report += "Disk Usage: $($systemInfo.Disk)%`n"

    $report | Out-File "$reportDir\DailyReport_$(Get-Date -Format 'yyyyMMdd').txt"
}
```


### Passo 4: Envio de Alertas

1. **Configuração de E-mail**:
    - Use variáveis de ambiente para armazenar informações de e-mail.

```powershell
$smtpServer = $env:SMTP_SERVER
$smtpFrom = $env:SMTP_FROM
$smtpTo = $env:SMTP_TO
$smtpSubject = "System Alert"
```

2. **Função para Enviar Alertas**:

```powershell
function Send-Alert {
    param($message)
    
    Send-MailMessage -SmtpServer $smtpServer -From $smtpFrom -To $smtpTo -Subject $smtpSubject -Body $message
}
```


### Passo 5: Monitoramento e Alertas

1. **Loop de Monitoramento**:

```powershell
while ($true) {
    $systemInfo = Get-SystemInfo
    
    Generate-Report -systemInfo $systemInfo

    if ($systemInfo.CPU -gt $cpuThreshold -or $systemInfo.Memory -gt $memoryThreshold -or $systemInfo.Disk -lt (100 - $diskThreshold)) {
        $alertMessage = "CPU: $($systemInfo.CPU)%, Memory: $($systemInfo.Memory)%, Disk: $($systemInfo.Disk)%"
        Send-Alert -message $alertMessage
    }

    Start-Sleep -Seconds 60 # Aguarde 1 minuto antes de verificar novamente
}
```


### Passo 6: Tratamento de Erros e Logging

1. **Tratamento de Erros**:
    - Use try-catch para capturar erros e registrar eventos no Visualizador de Eventos.

```powershell
try {
    # Código do script aqui
} catch {
    Write-EventLog -LogName Application -Source "SystemMonitor" -EntryType Error -EventID 1 -Message $_.Exception.Message
}
```

2. **Criar Fonte de Eventos se Não Existir**:

```powershell
if (!(Get-EventLog -List | Where-Object {$_.LogDisplayName -eq "Application"} | Where-Object {$_.Source -eq "SystemMonitor"})) {
    New-EventLog -Source "SystemMonitor" -LogName Application
}
```


### Solução Completa

Aqui está o script completo com todos os passos integrados:

```powershell
# Configuração Inicial
$cpuThreshold = 80
$memoryThreshold = 90
$diskThreshold = 85
$reportDir = "C:\SystemReports"

if (!(Test-Path $reportDir)) {
    New-Item -ItemType Directory -Path $reportDir
}

# Criar fonte de eventos se não existir
if (!(Get-EventLog -List | Where-Object {$_.LogDisplayName -eq "Application"} | Where-Object {$_.Source -eq "SystemMonitor"})) {
    New-EventLog -Source "SystemMonitor" -LogName Application
}

# Função de Monitoramento
function Get-SystemInfo {
    $cpu = (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
    $memory = (Get-WmiObject Win32_OperatingSystem).FreePhysicalMemory / (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory * 100
    $disk = (Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / (Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'").Size * 100

    return @{
        CPU = $cpu
        Memory = $memory
        Disk = $disk
    }
}

# Função para Gerar Relatórios
function Generate-Report {
    param($systemInfo)
    
    $report = "System Report - $(Get-Date)`n"
    $report += "CPU Usage: $($systemInfo.CPU)%`n"
    $report += "Memory Usage: $($systemInfo.Memory)%`n"
    $report += "Disk Usage: $($systemInfo.Disk)%`n"

    $report | Out-File "$reportDir\DailyReport_$(Get-Date -Format 'yyyyMMdd').txt"
}

# Configuração de E-mail
$smtpServer = $env:SMTP_SERVER
$smtpFrom = $env:SMTP_FROM
$smtpTo = $env:SMTP_TO
$smtpSubject = "System Alert"

# Função para Enviar Alertas
function Send-Alert {
    param($message)
    
    Send-MailMessage -SmtpServer $smtpServer -From $smtpFrom -To $smtpTo -Subject $smtpSubject -Body $message
}

# Loop de Monitoramento
while ($true) {
    try {
        $systemInfo = Get-SystemInfo
        
        Generate-Report -systemInfo $systemInfo

        if ($systemInfo.CPU -gt $cpuThreshold -or $systemInfo.Memory -gt $memoryThreshold -or $systemInfo.Disk -lt (100 - $diskThreshold)) {
            $alertMessage = "CPU: $($systemInfo.CPU)%, Memory: $($systemInfo.Memory)%, Disk: $($systemInfo.Disk)%"
            Send-Alert -message $alertMessage
        }

        Start-Sleep -Seconds 60 # Aguarde 1 minuto antes de verificar novamente
    } catch {
        Write-EventLog -LogName Application -Source "SystemMonitor" -EntryType Error -EventID 1 -Message $_.Exception.Message
    }
}
```


### Observações

- Certifique-se de que as variáveis de ambiente para o servidor SMTP, remetente e destinatário estejam configuradas corretamente.
- Ajuste os limites de alerta conforme necessário.
- Execute o script como administrador para garantir acesso a todos os recursos necessários.

Esse script fornece uma solução funcional para monitorar recursos do sistema e enviar alertas quando os limites forem ultrapassados, além de gerar relatórios diários e registrar eventos importantes.

