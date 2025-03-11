# Variáveis em PowerShell

Variáveis de ambiente são valores que afetam o comportamento de processos em um sistema operacional. Elas são usadas por aplicativos e scripts para configurar comportamentos específicos, como caminhos de sistema, configurações de aplicativos ou informações sensíveis.

Tipos de Variáveis de Ambiente

* Variáveis de Sistema: Afetam todos os usuários do sistema e são definidas no nível do sistema operacional.
* Variáveis de Usuário: São específicas para cada usuário e são definidas no perfil do usuário.
* Variáveis de Processo: São criadas por um processo e são destruídas quando o processo termina.

Como Visualizar e Modificar Variáveis de Ambiente
Via GUI
Painel de Controle:

Vá para "Sistema" ou "Sistema e Segurança" > "Sistema" > "Configurações avançadas do sistema" > "Variáveis de Ambiente".

Editar Variáveis:

Para variáveis de sistema, clique em "Novo" ou "Editar" na seção "Variáveis do sistema".

Para variáveis de usuário, faça o mesmo na seção "Variáveis do usuário".

Via PowerShell
Visualizar Variáveis:

powershell
Get-ChildItem Env:
Modificar Variáveis:

powershell
$Env:VARIAVEL = "valor"
Para variáveis persistentes, use:

powershell
[System.Environment]::SetEnvironmentVariable("MINHA_VAR", "MeuValor", "User")
Uso Prático de Variáveis de Ambiente
Variáveis de ambiente são frequentemente usadas para:

Caminhos de sistema: Definir locais de instalação de aplicativos ou bibliotecas.

Configurações de aplicativos: Armazenar informações de configuração que não devem ser hard-coded.

Segurança: Armazenar informações sensíveis, como chaves de API, de forma segura.

Elas são essenciais para manter configurações consistentes entre diferentes sessões e aplicativos no Windows.