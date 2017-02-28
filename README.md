# Todos os Guias de AC1 - PUC Minas
# ARQUITETURA DE COMPUTADORES 
# Professor: Theldo Cruz Franqueira

Repositório contendo todos os guias resolvidos de Arquitetura de Computadores 1 na PUC Minas.

Pontifícia Universidade Católica de Minas Gerais
Instituto de Informática – Ciência da Computação (Tarde)

#Sinta-se livre para adicionar novos exercícios resolvidos da matéria.

Pacote de programas para fundamentos de sistemas digitais

Itens

- Icarus  Verilog v.0.9.5 com GTKWave
- JFLAP   v.7.0
- Logisim v.2.7.1 

Instalação

O arquivo compactado deverá ser expandido em uma 
pasta de sua preferência, por exemplo em C:\.

Os atalhos (.lnk) deverão ser verificados e 
editados para a pasta conveniente.

Os arquivos terminados em (.bat) também deverão 
ser editados para ajuste dos caminhos (path).

Recomenda-se testar previamente o funcionamento 
de todos os programas, mesmo sem previsões para
uso imediato.


Observação

Qualquer editor de textos poderá ser associado
para programas em Verilog. Sugere-se o uso de
editores nativos do próprio sistema operacional 
ou o JGrasp cujos detalhes para configuração 
seguem anexos.

Configuração do JGrasp

jGrasp - Configurações

Verilog (VHDL):

File	
   New
     VHDL

Settings
 Compiler Settings
   Workspace
     Enviroment
       New
         Verilog
         Commands
         Make:
         C/L: 
         Compile: iverilog %FILE -o %base.vvp
         Check:
         Run: vvp %base.vvp
         Debug: gtkwave %base.vcd
         Document:
  
         OK
 
   Extensions
     v  V

     Save
       OK

     Use
       Apply

   OBS.: 
     Opcional:
       Copiar templ.vhd para a pasta jGrasp\Data
     Recomendável: 
       Incluir Icarus_Verilog\bin ao Path
       (variáveis de ambiente do sistema). 

Links recomendados

http://sourceforge.net/projects/iverilog/
    Icarus Verilog Interactive compiler & simulator     
    Versão recomendada: 0.9.5 (modificada) com GTKWave
                        no pacote de programas (2013-02-01 00:00) 
    Pacote para Verilog e para visualização de ondas
    Obs.: O pacote pode ser encontrado para cópia local em 
          W:\cursos\Ciencia_Computacao\2_periodo\arq1\download\util
          O pacote também pode ser encontrado para cópia em 
          ftp://ftp.pucmg.br/Computacao/Mais_Utilizados/Programacao_Hardware/Icarus_Verilog/

          Existe uma versão mais nova do compilador - 0.9.6,
          entretanto, por apresentar problemas de execução,
          seu uso não é recomendado.

http://sourceforge.net/projects/circuit
    Editor e simulador de circuitos lógicos
    Versão recomendada: 2.7.1 (2011-05-20)  
    Obs.: O pacote pode ser encontrado para cópia local em 
          W:\cursos\Ciencia_Computacao\2_periodo\arq1\2012-1\download\util
          O programa também pode ser encontrado para cópia local no pacote em
          ftp://ftp.pucmg.br/Computacao/Mais_Utilizados/Programacao_Hardware/Icarus_Verilog/
 
          Incluir o arquivo PUCTools.jar na mesma pasta onde ficar o simulador.


Alternativas:

http://www.jgrasp.org/
    jGrasp v1.8.8_23  (04/01/2013)
    Ferramenta para edição e compilação  
    Obs.: O programa também poderá ser encontrado para cópia local em 
          ftp://ftp.pucmg.br/pub/Mais_Utilizados/Programacao_Soft/Java/JGrasp


    Configuração do JGrasp

    Verilog (VHDL):
	
    New
      VHDL

    Workspace
      New
        Verilog
      C/L: 
        Compile: iverilog %FILE -o %base.vvp
      Check:
      Run: 
        vvp %base.vvp
      Debug: 
        gtkwave %base.vcd

    Extensions
      v V
 
      Save
        OK
 
      Use
        Apply

    OBS.: 
      Opcional:
        Copiar templ.vhd para a pasta jGrasp\Data
      Recomendável: 
        Incluir o caminho, por exemplo,
        C:\Icarus_Verilog\bin ao Path
        (variável de ambiente do sistema)

        ou

        Preceder cada comandos acima pelo
        caminho completo, por exemplo,
        C:\Icarus_Verilog\bin\iverilog
        C:\Icarus_Verilog\bin\vvp


http://www.cs.duke.edu/csed/jflap/jflaptmp/
    JFLAP v7.0     
    Pacote para Máquinas de Estados Finitos
    Obs.: O programa também pode ser encontrado para cópia local no pacote em
          ftp://ftp.pucmg.br/Computacao/Mais_Utilizados/Programacao_Hardware/Icarus_Verilog/

http://context.cx/component/option,com_docman/Itemid,48/   
    Text editor & Verilog highligther (alternativa para o JGrasp)      
    Editor de textos com destaque para palavras chaves em Verilog
    Obs.: O Verilog highligther (VerilogHDL.chl) deverá ser copiado
          em separado e instalado na pasta Context\Highligthers
          Esse arquivo também pode ser encontrado para cópia local em
          ftp://ftp.pucmg.br/Computacao/Mais_Utilizados/Programacao_Software/C_-_C++/ConText/

http://www.sutherland-hdl.com/online_verilog_ref_guide/vlog_ref_top.html
    Verilog reference card
    Manual online para Verilog
    (melhor copiar e instalar na pasta IVI\docs ou IVerilog\docs)
    Obs.: O programa também pode ser encontrado para cópia local no pacote em
          ftp://ftp.pucmg.br/Computacao/Mais_Utilizados/Programacao_Hardware/Icarus_Verilog/
