$xml = @'
<QueryList>
    <Query Id="0" Path="System">
        <Select Path="System">*[System/Provider[@Name='Microsoft-Windows-TPM-WMI'] and System/Level=2]</Select>
    </Query>
</QueryList>
'@

$startDate = (Get-Date).AddDays(-14)

$events = Get-WinEvent -FilterXml $xml -ErrorAction SilentlyContinue | Where-Object {$_.TimeCreated -ge $startDate}

if ($events) {
    $lastError = $events | Sort-Object TimeCreated -Descending | Select-Object -First 1
    Write-Host "Ultimo erro encontrado:"
    Write-Host "Dia e Hora: $($lastError.TimeCreated)"
    Write-Host "Mensagem: $($lastError.Message)"
} else {
    Write-Host "Nenhum erro encontrado com fonte 'Microsoft-Windows-TPM-WMI' nas ultimas duas semanas."
}
