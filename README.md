#Knife System

#####Autor: Anônimo000


 Provê facilidade e rapidez em algumas tarefas,
Nele você irá encontrar como o próprio nome já diz knife system ( canivete do sistema ), inúmeras
ferramentas para auxília-lo em suas tarefas sejam elas uma simples instalação de programas até um
pequeno firewall que o script prove.

###                                              ATENÇÃO!
 
  Esse script só funcionará em derivados do debian ( Ubuntu, Mint, ElementaryOS, DuZeru, e etc... ). 
  E para melhor proveito deve-se estar conectado a internet.
  O script irá obter seu endereço IP externo, mas nada será arquivado ou enviado, se tiver receio confira o script, logo no   inicio a variável "myip", e mais a abaixo no comentário "Informações do hardware e etc....".

![Imagem](http://i.imgur.com/4UUNOk9.png)


 Como estão organizados os menus: 

 Opção A - Instalação de programas digitando apenas o nome do mesmo;
  
 Opção B - Remover programas digitando apenas o nome do mesmo;

 Opção C - Reparar erros nas dependências ( Em algumas situações isso não vai ser possível );
 
 Opção D - Procura por programas estejam eles ou não instalados em sua máquina;

 Opção E - Procura por arquivos existêntes em sua máquina;

 Opção F - Leva para um submenu que você encontrará as seguintes opções;

    Opção 1 - Move a pasta do tema para /usr/share/themes, facilitando esse processo, porém para instalar defitivamente, deverá ter
             instalado um programa como 'Gnome-Tweak-Tool' em seu sistema.

    Opção 2 - Move a pasta do cursor para ~/.icons, se o mesmo não existir o script se encarregará de criar e mover. Porém para instala-lo
             você deverá ter o 'Gnome-Tweak-Tool' instalado ou algum programa que possa fazer o mesmo.

    Opção 3 -  Move a pasta do ícone para /usr/share/icons, facilitando esse processo, porém para instalar defitivamente, deverá ter
             instalado um programa como 'Gnome-Tweak-Tool' em seu sistema.

        Opção 4 - Instalado o programa que lhe permitirá a intalação dos tema, ícones e cursores.

 
 Opção G - Atualiza a sua distribuição para uma versão mais recente por exemplo atualiza do ubuntu 14.04 LTS para o 16.04 LTS;

 Opção H - Deleta os temas das respectivas pastas ( Você deverá escrever o nome do tema corretamente ).

 Opção I - Nessa opção você irá para um sub-menu onde encontrará opções que serão explicadas:

    Opção 1 - Você instalará uma lista de programas para internet como navegadores, clientes torrents, etc...
              
    Opção 2 - Você instalará uma lista de programas para escritório como libreoffice, ABiword, Pluma, etc...

    Opção 3 - Você instalará uma lista de programas para gráficos como Gimp, Blender, Inkscape, etc...

    Opção 4 - Você instalará uma lista de programas para jogos ou emuladores como wine, PlayOnLinux.

    Opção 5 - Você instalará uma lista de programas para mídia como reprodutores de áudio, vídeo, etc...

    Opção 6 - Você instalará uma lista de programas para desenvolvimeto como IDE's, editores de texto e etc...

    Opção 7 - Você será levado para um sub-menu onde encontrará opções de programas básicos para instalar após uma formatação.

    Opção 8 - Você instalará Todas as listas de programas citadas

 Opção J - Você será levado para um sub-menu onde poderá escolher entre ativar um simples firewall ou desativa-lo.

 Opção K - Opção ainda em fase "beta", isto é não está totalmente eficiente apesar de já poder ser usada.
           Você será levado a um sub-menu onde encontrará algumas opções referentes ao git:
    
     Opção 1 - Equivale á git clone

     Opção 2 - Equivale á git add
   
     Opção 3 - Equivale á git push

     Opção 4 - Equivale á git commit

     Opção 5 - Equivale á git init

     Opção 6 - Equivale á git status
     
  Opção L - Você será levado a um submenu onde encontrará as seguintes opções:

     Opção 1 - Obter informações sobre sua rede interna.
   
     Opção 2 - Mostará informações do seu HD, seu CPU e sua memória RAM.

     Opção 3 - Mostará informções sobre o kernel do sistema, sua versão por exemplo.

     Opção 4 - Mostraá a arquitetura do seu processador pode variar de 64bits a 32bits.
     
     Opção 5 - Usa o escaner de portas nmap, para verificar as portas e serviços rodando na sua máquina.

  Opção M - Você será levado para um submenu onde encontrará opções para downloads de arquivos:

     Opção 1 - Nesta opção você deverá digitar o link do arquivo que pretende baixar.
               Em seguida digite o caminho do para onde o arquivo irá ser baixado, e digite o nome dele,
               não esqueça de colocar a extensão do arquivo (ex: .deb-.txt-.tar.gz).

     Opção 2 - Nesta opção se você já tiver iniciado algum download anteriormente ele será encarregado de continua-lo.

     Opção 3 - Nesta opção você irá deletar os arquivos que contém o o link e o diretório, do arquivo que iria a ser baixado
               este arquivo de log está contido em /var/log/KS_*.log


 Sinta-se livre em edita-lo a seu gosto.

 Em caso de erros por favor não exite em contatar-me pelo meu email que estarei deixando logo abaixo

 Nessa nova versão arquivos de logs serão gerados em /tmp, arquivos de log gerados pelo script conteram as iniciais KS_
 Os logs são gerados somente na remoção de programas e no reparo de repositórios.
 
            <----------------------------EXECUTANDO O SCRIPT ----------------------------------->

 Para um melhor proveito do script por favor instale-o bastando apenas executar o script de instalação com o comando.
 Entre na pasta corrente do script e execute os seguintes comandos:
 
 # chmod +x instalar.sh <-- Para dar permissões de execução, o mesmo deve ser feito com knife caso não queira instala-lo
 # bash instalar.sh <-- Instalar

 o script fará todo o resto.

 <--Caso não queira instala-lo basta abrir o terminal, entrar na pasta corrente do script com: -->

  $ cd ~/knife_system-x.x <-- Onde x.x é a versão do script
  
 Entrar como usuário root com o comando:

  $ sudo su
  
 E dar permissões de execução ao script com o comando:

  # chmod +x knife

 Em seguida executá-lo com o comando:
 
 # bash knife

####                             ATENÇÃO!

  Esse script requer o pacote pv instalado, para exibição da barra de progresso na execução de suas tarefas
  portanto caso não possua ele instalado o script se encarregará de fazer o mesmo. 
 
  pv é um pequeno programa que serve para criar uma barra e progresso enquanto se é feito algum serviço em
  segundo plano, caso queira testar o pv e conferir como ele funciona, mostrarei um exemplo de uso:
 
  $sudo su <-- Entre como usuário root
 
  #apt-get install pv <-- comando para instalar o pv caso não possua
 
  #apt-get update | pv -W <-- Exemplo de uso do comando pv
 
  caso queira conferir a documentação consulte em /usr/share/doc/pv






 Atualizações são lançadas constântementes. Porém não se á um site ou uma equipe por trás do script portanto
fique sempre de olho no meu git para conferir as atualizações.

contato: anonimo000hacker@gmail.com
