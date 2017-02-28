PUC-Minas
Instituto de Ci�ncias Exatas e Informatica
2012-1

Pacote de programas para fundamentos de sistemas digitais

Itens

- Icarus  Verilog v.0.9.5 com GTKWave
- JFLAP   v.7.0
- Logisim v.2.7.1 

Instalacao

O arquivo compactado dever� ser expandido em uma 
pasta de sua prefer�ncia, por exemplo em C:\.

Os atalhos (.lnk) dever�o ser verificados e 
editados para a pasta conveniente.

Os arquivos terminados em (.bat) tamb�m dever�o 
ser editados para ajuste dos caminhos (path).

Recomenda-se testar previamente o funcionamento 
de todos os programas, mesmo sem previs�es para
uso imediato.


Observa��o

Qualquer editor de textos poder� ser associado
para programas em Verilog. Sugere-se o uso de
editores nativos do pr�prio sistema operacional 
ou o JGrasp cujos detalhes para configura��o 
seguem anexos.

Configura��o do JGrasp

jGrasp - Configura��es

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
     Recomend�vel: 
       Incluir Icarus_Verilog\bin ao Path
       (vari�veis de ambiente do sistema). 

