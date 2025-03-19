# Criar um novo diretório
New-Item -ItemType Directory -Path "C:\MeuDiretorio"

# Copiar um arquivo para o diretório criado
Copy-Item "arquivo.txt" -Destination "C:\MeuDiretorio"