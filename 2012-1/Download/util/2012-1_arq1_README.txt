PUC-Minas
Instituto de Ciências Exatas e Informatica
2012-1

Pacote de programas para fundamentos de sistemas digitais

Itens

- Icarus  Verilog v.0.9.5 com GTKWave
- JFLAP   v.7.0
- Logisim v.2.7.1 

Instalacao

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

