# Exemplo de script para fazer o Hello World em PowerShell. 
# Para este exemplo, vamos criar uma variável de ambiente chamada SAUDACAO e atribuir o valor "Ola Mundo!" a ela. 
# Em seguida, vamos exibir o valor da variável de ambiente SAUDACAO.

$Env:SAUDACAO = "Ola Mundo!"
Write-Host $Env:SAUDACAO