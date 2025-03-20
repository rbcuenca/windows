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