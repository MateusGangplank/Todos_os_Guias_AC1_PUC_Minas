// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-01 Exercicio 05 (Extra)
// Data de entrega: 01-04/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p, q);
 output s;
 input  p, q;

 assign s = ( (~a&b) | (a&~b ) );


endmodule // xorgate

// ---------------------
// -- test xor gate
// ---------------------

module testxorgate;
 reg   a, b;             
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display( "Guia-01 - Pedro Tronbin - 410473" );
      $display( "Test XOR gate");
      $display( "\n( (~a&b) | (a&~b) ) = s\n");
       a=0; b=0; 
  #1  $display("(~%b&%b | %b&~%b) = %b", a, b, a, b, s);  
       a=0; b=1;
  #1  $display("(~%b&%b | %b&~%b) = %b", a, b, a, b, s);
       a=1; b=0; 
  #1  $display("(~%b&%b | %b&~%b) = %b", a, b, a, b, s);
       a=1; b=1;
  #1  $display("(~%b&%b | %b&~%b) = %b", a, b, a, b, s);
       
 end
 
endmodule // testxorgate

/* SAIDA

Guia-01 - Pedro Tronbin - 410473
    Test XOR gate
    
    ( (a^b) ) = s
    
    ( 0 ^ 0 ) = 0
    ( 0 ^ 1 ) = 1
    ( 1 ^ 0 ) = 1
    ( 1 ^ 1 ) = 0
    
     ----jGRASP: operation complete.
    
     ----jGRASP exec: C:\Icarus_Verilog\bin\vvp testxorgate2.vvp
    
    testxorgate2.vvp: Unable to open input file.
    
     ----jGRASP wedge2: exit code for process is -1.
     ----jGRASP: operation complete.

*/

/* OBS: Quando o programa e compilado: 

C:\Documents and Settings\Administrador\Desktop\pT\testxorgate2.Vv:17: assert: elab_expr.cc:3517: failed assertion expr_type_ != IVL_VT_NO_TYPE
    
    This application has requested the Runtime to terminate it in an unusual way.
    Please contact the application's support team for more information.
    
     ----jGRASP wedge2: exit code for process is 3.
     ----jGRASP: operation complete.

*/     