#Knife System 
#####Autor: Anônimo000


 Provê facilidade e rapidez em algumas tarefas,
Nele você irá encontrar como o próprio nome já diz knife system ( canivete do sistema ), inúmeras
ferramentas para auxília-lo em suas tarefas sejam elas uma símples instalação de programas até um
pequeno firewall que o script provê.

###                                              ATENÇÃO!
 
  Esse script só funcionará em derivados do debian ( Ubuntu, Mint, ElementaryOS, DuZeru, e etc... ). 
  E para melhor proveito deve-se estar conectado a internet.
  O script irá obter seu endereço IP externo, mas nada será arquivado ou enviado, se tiver receio confira o script, logo no   inicio a variável "myip", e mais a abaixo no comentário "Informações do hardware e etc....".

![Imagem](http://i.imgur.com/LmUg4Ka.png)


 Como estão organizados os menus: 

Opção A - Você será levado para um submenu onde encontrará as seguintes opções:

      1)Pacote .deb - Nessa opção você deverá ter baixado um arquivo .deb (equivale à um executável
                      do Windows), informe o caminho onde se encontra o pacote mas não esqueça de 
                      escrever seu nome corretamente e certifique-se de colocar a extensão .deb;

      2)Direto do repositório - Nessa opção você irá instalar um programa que esteja em sua lista de repositórios
                                bastando apenas digitar o nome do pacote (programa).

Opção B) - Nessa opção você poderá remover pacotes(programas) instalados bastando apenas digitar seu nome,
           certifique-se de digitar o nome do pacote corretamente.

Opção C) - Nessa opção você poderá localizar programas, estejam ele instalados ou não. Porém o script procurará pelo nome do programa,
           isto é, se tiver mais pacotes com o mesmo nome será mostrado também.

Opção D) - Nessa opção você irá reparar os erros mais comuns encontrados em pacotes quebrados.
           Em alguns casos isso pode não funcionar.

Opção E) - Nessa opção você irá atualizar toda sua distribuição para uma versão mais recente.
           Em alguns casos isso poderá acarretar em perda total da distro GNU/Linux instalada.

Opção F) - Nessa opção você será levado para um submenu onde poderá escolher um programa que deseja instalar
           Os programas que serão listados normalmente não se encontram na lista de repositórios oficiais de algumas distros.
           Alguns dos programas listados são o Skype e Conky-Manager.

Opção G) - Essa opção você poderá localizar arquivos ou pastas no seu HD.
           O script iráa atualizar seu banco de dados para mostrar a lcocalização de um determinado arquivo,
           portando dependendo do espaço ocupado no seu HD poderá levar um certo tempo para ser localizado.

Opção H) - Nessa opção você será levado para um submenu onde encontrará as seguintes opções:

           1)Temas - Você instalará um tema que desejar, não esqueça de colocar o nome corretamente e
                     certifique-se de ter extraído o tema, essa opção irá mover a pasta do tema para /usr/share/themes
                     mas não instalará de fato, você precisará de um programa como o Gnome-Tweak-Tool para fazer isso;

           2)Cursor - Informe o caminho e o nome da pasta onde se encontra o cursor e certifique-se de escrever                                  corretamente o nome;

           3)Ícones -  Você instalará um ícone que desejar, não esqueça de colocar o nome corretamente e
                     certifique-se de ter extraído o ícone, essa opção irá mover a pasta do ícone para /usr/share/icons
                     mas não instalará de fato, você precisará de um programa como o Gnome-Tweak-Tool para fazer isso; 
                
           4)Conky  - Aqui você poderá instalar temas para o conky, não esqueça de digitar corretamente o nome da pasta já                       descompactada em sua home, para ver o tema do conky funcional baixe o Conky Manager, no próprio                            script na opção F)Lista de programa no menu princípal.

           5) Gnome-Tweak-Tool - Instalará o programa para a instalação de fato dos temas determinados;


Opção I) - Você será levado para um submenu onde encontrará opções de remover temas e ícones que tens instalado, 
           certifique-se de escrever o nome do tema ou ícone corretamente;

Opção J) Você será levado para um sub menu onde encontrará opçoes de ativar o firewall e desativar,
         Ativa-lo permanentemente apenas fazerá com que o firewall não desative a cada inicaliação do sistemas,e também             poderá criar um firewall que irá automaticamente iniciar a cada inicialização do sistema. 
         O fireall incluso no script pode e deve ser modificado de acordo com suas necessidades e dos servições que rodam           em sua máquina.

Opção K) Será mostrado seu IP externo mas nada será enviado ou arquivado
         Caso queira que isso seja feito edite o script a seu gosto.
         Você será levado para um submenu onde encontrá as seguintes opções:

         1)Informações de rede - Será apresentado algumas informações da sua rede interna;

         2)Informações do sistema - Será apresentado algumas informações do seu sistema como
                                    espaço ocupado em disco, memória ocupada e etc.

         3)Informações do kernel - Será apresentado algumas informações do kernel como versão.
   
         4)Arquitetura do processador - Será mostrado em qual arquitetura seu procesador trabalha,
                                        que pode variar de 64bits para 32bits, no caso seria assim:
                                        x86_64(64bits)  e i386(32bits). 

         5)Serviços e portas - Irá apresentar quais serviçoes estão em execução em sua máquina e quais
                               portas estão abertas;

         6) Verificar serviço de um host remoto(netcat) - Nesa opção você poderá realizar um sacan para verificar se uma porta está
                                                          aberta ou não em um host remoto, opção interessante para administradores de rede
                                                          para usar essa opção basta inserir o IP da máquina que se deseja realizar o scan
                                                          em seguida colocar o número da porta, caso não saiba a porta de determinado serviço
                                                          [consulte aqui](http://www.portalchapeco.com.br/jackson/portas.htm)
                                                          Aguarde alguns instântes e será mostrado na tela se a porta está aberta ou não.
                                                          Para essa opção é necessário ter o netcat instalado para mais informações consulte
                                                          [esse site](http://netcat.sourceforge.net/)

Opção L) Aqui você poderá baixar arquivos grandes da internet sem se preocupar com a banda,
         Você terá de colocar o endereço (link) do arquivo a ser baixado e indicar o caminho e o nome com a extensão
         como exemplo seria assim /home/fulano/Downloads/arquivo.deb.
         Caso queira continuar um download anterior clique na opção 2)Continuar Download
         Você será notificado caso tenha algum download pendente ainda não concluído.

Opção 1) Uma opção extra implantada no script, funcional apenas no Arch. Nessa opção você poderá instalar uma interface gráfica
         que desejar bastando apenas escolher, também serão instalados alguns programas úteis para o usuário como um navegador
         um editor de texto e de imagem entre outros, por tanto não se preocupe se demorar muito para finalizar tal função
         dependendo da sua conexão poderá levar mais ou menos tempo, não imterrompa a instalação. 
         Caso não saiba como baixar o script no seu Arch em modo texto aqui vai um breve tutorial levando em conta que já esteja como root:
         
         Instale o git em sua máquina com o comando:
         # pacman -S git
   
         Em seguida baixe o repositório do script com 
         # git clone https://github.com/anony000/knife_system

         Entre na pasta do script com
         # cd /knife_system/knife_system-x.x/Knife-System <-- Onde x.x é a versão do script

         Dê permissões de execussão ao script com:
         # chmod +x knife

         Em seguida execute-o com:
          # bash knife

         Escolha a opção --> 1) Instalar interface para Archlinux(extra)

         Algumas opções como Instalar programas e remover não funcionarão no Arch, apenas a opção 1 foi feita exlusivamente para ele.


 Sinta-se livre em edita-lo a seu gosto.

 Em caso de erros por favor não exite em contatar-me pelo meu email que estarei deixando logo abaixo

 Nessa nova versão arquivos de logs serão gerados em /tmp, arquivos de log gerados pelo script conteram as iniciais KS_
 Os logs são gerados somente na remoção de programas e no reparo de repositórios.
 
            <----------------------------EXECUTANDO O SCRIPT ----------------------------------->

 Para um melhor proveito do script por favor instale-o bastando apenas executar o script de instalação com o comando.
 Entre na pasta corrente do script e execute os seguintes comandos:

  # sudo su <-- Para entrar como usuário root
 
  # chmod +x instalar.sh <-- Para dar permissões de execução, o mesmo deve ser feito com knife caso não queira instala-lo
  
  # bash instalar.sh <-- Instalar

 Caso tenha o script instaldo já selecione a opção 2) Remover e em seguida a Opção 1)Instalar.
 Será criado um ícone do script para maior facilidade, olhe no menu acessórios ou algo equivalente

 <--Caso não queira instala-lo basta abrir o terminal, entrar na pasta corrente do script com: -->

  $ cd /caminho/knife_system-x.x/Knife-System <-- Onde x.x é a versão do script
  
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
