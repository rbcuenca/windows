# Uso de Loops e Condicionais Básicos

## Introdução

Loops e condicionais são fundamentais em programação, permitindo que scripts PowerShell tomem decisões e executem ações repetidas de forma eficiente.

## Loops

### ForEach-Object

O loop `ForEach-Object` é usado para iterar sobre coleções de objetos. Ele é especialmente útil quando você precisa processar cada item em uma lista.

```powershell
# Exemplo: Iterar sobre uma lista de números
1..5 | ForEach-Object { Write-Host $_ }
```


### For

O loop `for` é usado para executar um bloco de código repetidamente, geralmente com uma variável que muda em cada iteração.

```powershell
# Exemplo: Contar de 1 a 5
for ($i = 1; $i -le 5; $i++) {
    Write-Host $i
}
```


### While

O loop `while` executa um bloco de código enquanto uma condição for verdadeira.

```powershell
# Exemplo: Contar de 1 a 5 usando while
$i = 1
while ($i -le 5) {
    Write-Host $i
    $i++
}
```

<div style="border: 1px solidrgb(19, 20, 20); border-left-width: 5px; padding: 10px; background-color:rgb(175, 178, 181); border-radius: 5px;">
💡 <strong>Dica:</strong>Você sabe o que é o parâmetro "-le 5"?<br>
- eq: Igual a<br>
- ne: Diferente de<br>
- gt: Maior que<br>
- lt: Menor que<br>
- ge: Maior ou igual a<br>
- le: Menor ou igual a</div><br>


## Condicionais

### If-Else

Os condicionais `if-else` permitem que o script tome decisões com base em condições.

```powershell
# Exemplo: Verificar se uma variável é maior que 10
$numero = 15
if ($numero -gt 10) {
    Write-Host "O número é maior que 10"
} else {
    Write-Host "O número é menor ou igual a 10"
}
```

### Switch

O comando `switch` é usado para comparar um valor com várias opções.

```powershell
# Exemplo: Usar switch para verificar o dia da semana
$dia = "segunda"
switch ($dia) {
    "segunda" { Write-Host "Hoje é segunda-feira" }
    "terça" { Write-Host "Hoje é terça-feira" }
    Default { Write-Host "Dia não reconhecido" }
}
```

## Exemplo Prático

Suponha que você queira criar um script que verifique se um diretório existe e, se não existir, crie-o.

```powershell
# Definir o caminho do diretório
$caminho = "C:\MeuDiretorio"

# Verificar se o diretório existe
if (Test-Path $caminho) {
    Write-Host "O diretório já existe"
} else {
    # Criar o diretório se não existir
    New-Item -ItemType Directory -Path $caminho
    Write-Host "Diretório criado com sucesso"
}
```


### Dicas para Usar Loops e Condicionais

- **Testar Condições**: Antes de usar condicionais, teste as condições para garantir que elas sejam verdadeiras ou falsas conforme esperado.
- **Usar Break e Continue**: Em loops, use `break` para sair do loop e `continue` para pular para a próxima iteração.
- **Evitar Loops Infinitos**: Certifique-se de que loops `while` tenham uma condição que possa se tornar falsa para evitar loops infinitos.

Essas são as bases para usar loops e condicionais em PowerShell. Com esses conceitos, você pode criar scripts mais complexos e dinâmicos.

