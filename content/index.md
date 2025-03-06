# Atividade: Introdução ao Linux Ubuntu

## **Atividade Complementar: Introdução ao Linux Ubuntu**

### **Público-Alvo**
Esta atividade é destinada a alunos com familiaridade no uso de computadores que desejam explorar o universo do sistema operacional Linux, com foco na distribuição Ubuntu. É especialmente recomendado para estudantes das áreas de Engenharia e Tecnologia.

### **Requisitos Técnicos**
Para acompanhar as aulas, os alunos deverão atender aos seguintes requisitos mínimos, dependendo da forma de instalação escolhida:

#### **Instalação em Máquina Virtual**
- Processador AMD Ryzen 5 (2ª geração ou superior);
- Processador Intel Core i5 (9ª geração ou superior);
- 8 GB de memória RAM (Desejável 16G de memória RAM);
- 80 GB de espaço livre no disco.

#### **Instalação no Computador**
*Nota: Não é compatível com MacBooks equipados com Apple Silicon;

- Processador AMD Ryzen 5 (2ª geração ou superior);
- Processador Intel Core i5 (8ª geração ou superior). 
- Um segundo disco rígido disponível com pelo menos 80 GB de espaço livre;
- Backup prévio dos arquivos pessoais (__há risco de perda de dados durante o processo__);
- __Trazer__ Pen drive com capacidade mínima de 8 GB para a instalação do Linux.
[](){ #arquivos }
#### **Arquivos Necessários**
- VirtualBox para [Windows:](https://download.virtualbox.org/virtualbox/7.1.6/VirtualBox-7.1.6-167084-Win.exe)
- VirtualBox para [MacOS:](https://download.virtualbox.org/virtualbox/7.1.6/VirtualBox-7.1.6-167084-OSX.dmg)
**Há uma vesão do VirtualBox para o MacOS Apple Silicon, mas só é possível usar o ubuntu arm que não é totalmente compatível com o que faremos.
- Imagem ISO do [Ubuntu 22.04.x:](https://releases.ubuntu.com/jammy/ubuntu-22.04.5-desktop-amd64.iso)
- Rufus [para criar o pendrive bootavel:](https://github.com/pbatard/rufus/releases/download/v4.6/rufus-4.6p.exe)

### Atividade 
- Fez os downloads propostos acima?
- Organizou estes arquivos para fácil localização?
- Já escolheu se usará uma Máquina Virtual ou se fará o "Dual boot" em seu computador?

Se você escolheu instalar em Máquina Virtual, vá para a [Instalação do VirtualBox](modules/01-virtualbox/VirtualBox.md)

Se você escolheu fazer o "Dual boot", vá para [Fazer "Dual boot"](modules/02-dualboot/Dualboot.md)

### **Objetivo Geral**
A atividade tem como objetivo oferecer aos alunos uma introdução prática ao sistema operacional Linux, capacitando-os a realizar a instalação, configuração e personalização do ambiente, além de preparar o sistema para atividades relacionadas à programação e uso pessoal.

### **Competências Adquiridas**
Ao final da atividade, os alunos serão capazes de:
- Instalar o Linux Ubuntu em uma máquina virtual ou diretamente em um computador;
- Configurar e personalizar o ambiente de trabalho para maior produtividade;
- Preparar o sistema para desenvolvimento ou uso pessoal.

### **Objetivos Específicos**
Os objetivos específicos da atividade incluem:
1. Instalar o Linux Ubuntu Desktop 22.04 em uma máquina virtual utilizando o VirtualBox ou em seu computador quando houver a possibilidade.
2. Configurar o ambiente visual do sistema operacional para maior familiaridade e produtividade, aproximando-o da interface Windows;
3. Personalizar o terminal Linux para otimizar fluxos de trabalho e integrar ferramentas como GitHub;
4. Utilizar comandos básicos do terminal Linux para navegação e gerenciamento do sistema;
5. Instalar e configurar ferramentas essenciais, como:
   - Visual Studio Code (VS Code);
   - Gerenciadores de pacotes APT e DPKG (essenciais para distribuições baseadas em Debian);
   - Oh-My-Bash, para personalização avançada do terminal.

### **Estrutura das Aulas**
A atividade será realizada em dois encontros, cada um com duração de 2 horas. A divisão dos conteúdos é apresentada a seguir:

#### **Dia 1: Instalação do Sistema**
- Configuração da máquina virtual / Preparação do Pendrive de boot
- Instalação do Ubuntu Desktop 22.04.
- Atualização do sistema operacional via terminal.
- Criação de *aliases* no terminal para automação de atualizações futuras.


#### **Dia 2: Configuração Visual e Instalação de Softwares**
- Personalização visual do sistema operacional.
- Instalação dos drivers necessários.
- Instalação dos seguintes softwares:
  - Google Chrome (utilizando o gerenciador DPKG);
  - Visual Studio Code (utilizando o gerenciador DPKG);
  - Terminator (utilizando o gerenciador APT);
  - Oh-My-Bash (com suporte a ferramentas como [`wget`](https://www.gnu.org/software/wget/) ou [`curl`](https://curl.se/));
  - Fontes adicionais para personalização avançada do terminal.

Com esta estrutura, a atividade proporcionará aos alunos uma base sólida no uso do Linux Ubuntu, preparando-os tanto para atividades acadêmicas quanto profissionais que exigem domínio desse sistema operacional amplamente utilizado no mercado.


