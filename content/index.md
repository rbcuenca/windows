# Atividade: Sistema Operacional Windows - Uma visão um pouco mais técnica

[Endereço do GitHub Pages: ](https://rbcuenca.github.io/windows/)

## **Atividade Complementar: Windows - PowerShell**

Sejam bem vindos! Temos por objetivo desta atividade a intrudução do uso do PowerShell, um terminal poderoso que encontramos no Windows d. 

O PowerShell foi criado para atender à necessidade de uma ferramenta de automação mais robusta e flexível para administradores de sistemas Windows. Ele foi projetado para substituir o Prompt de Comando tradicional, oferecendo uma linguagem de script mais avançada e integrada ao framework .NET, permitindo que os administradores automatizassem tarefas complexas de forma mais eficiente.

Com o tempo, o PowerShell evoluiu para se tornar uma ferramenta essencial não apenas para administradores de sistemas, mas também para desenvolvedores e profissionais de DevOps, graças à sua capacidade de gerenciar sistemas de forma programática e integrar-se com tecnologias de nuvem.

O PowerShell entrou como ferramenta padrão desde o lançamento do Windows 7 e Windows Server 2008 R2 (em 2009). A partir do Windows 10, o PowerShell (Posh) começou a ser mais proeminente, especialmente com a opção de substituir o Prompt de Comando do menu <kbd>Win</kbd>+<kbd>X</kbd>. 

Com o Windows 11, o PowerShell é ainda mais integrado, mas o Prompt de Comando ainda pode ser encontrado em muitas situações. A opção de substituir o Prompt de Comando pelo PowerShell no menu Win+X está disponível nas configurações do sistema, mas não é habilitada por padrão para todos os usuários.

Agora que conhecemos um pouco da história do PowerShell, vamos padronizar que todas as telas vistas nesta atividade serão do Windows 11 e o vamos tomar por padrão, uma vez que o suporte ao Windows 10 se encerra em Outubro deste ano.

## Editor de Códigos

Existem diversos editores que são excelentes para a criação dos scripts. Recomendo o uso do [VS Code](https://code.visualstudio.com/docs/?dv=win64user), mas você pode usar o próprio notepad sem problemas. 

## Projeto

Como resultado do aprendizado desta atividade você desenvolverá um sistema de monitoramento de recursos do sistema usando PowerShell script. O objetivo é criar um script que coleta informações sobre o uso de CPU, memória e disco, gera relatórios diários e envia alertas por e-mail quando os limites pré-definidos são ultrapassados.

### Funcionalidades do Projeto

* Monitoramento Contínuo: O script monitora continuamente o uso de CPU, memória e disco.
* Geração de Relatórios: Relatórios diários são gerados e salvos em um diretório especificado.
* Alertas por E-mail: Alertas são enviados por e-mail quando os limites de uso são ultrapassados.
* Configuração Flexível: Variáveis de ambiente e parâmetros configuráveis permitem personalizar o comportamento do script.

Este prjeto será dividio em 6 grupos de conhecimento:

### Componentes do Projeto
* Criação de Scripts em PowerShell:
    * O script será desenvolvido para coletar dados de uso de recursos do sistema.
    * Utilizará comandos PowerShell para obter informações de CPU, memória e disco.

* Manipulação de Variáveis:
    * Variáveis serão usadas para armazenar limites de alerta e outros parâmetros configuráveis.
    * Variáveis de ambiente podem ser usadas para armazenar informações sensíveis, como credenciais de e-mail.

* Uso de Loops e Condicionais:
    * Loops serão usados para monitorar continuamente o uso dos recursos.
    * Condicionais verificarão se os limites foram ultrapassados e dispararão alertas.

* Gerenciamento de Arquivos e Diretórios:
    * O script gerará relatórios diários em um diretório especificado.
    * Arquivos de log podem ser usados para registrar eventos importantes.

* Gerenciamento Básico de Serviços e Processos:
    * O script pode ser configurado para monitorar serviços específicos ou processos que afetem o uso de recursos.
    
* Uso do Visualizador de Eventos:
    * O script pode registrar eventos no Visualizador de Eventos para facilitar o diagnóstico.