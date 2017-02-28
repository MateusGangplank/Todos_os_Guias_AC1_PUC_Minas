// ---------------------
// Guia 10_01 - Latch SR com portas NOR
// Nome: Márcia Cibele Martins Carneiro 
// Matricula: 404591
// ---------------------

//Implementar um latch SR com portas NOR.
 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module latch_SR(q_bar, q, s, r);

output q, q_bar;
input s, r;



nor NOR1(q_bar, s, q);
nor NOR2(q, r, q_bar);

endmodule

module Exercicio1;
reg s, r;
wire q,q_bar;


latch_SR LSR1(q_bar, q, s, r);


initial begin:start
s=0; r=0;
end

initial begin: main
	   $display("Guia 10_01 - Marcia Cibele Martins Carneiro - 404591");
      $display("Latch SR com portas NOR");
		$display(" S  R  Q  Q'");
		$monitor(" %b  %b  %b  %b", s, r ,q, q_bar);
		
#1 s = 0;r=1;
#1 s = 1;r=0;
#1 s = 1;r=1;
end

endmodule

/* Resultado obtido
     ----jGRASP exec: D:\MeusDocumentos\2010-2_arq1_programas\Icarus_Verilog\bin\vvp exercicio1.vvp
    
    Guia 10_01 - Marcia Cibele Martins Carneiro - 404591
    Latch SR com portas NOR
     S  R  Q  Q'
     0  0  x  x
     0  1  0  1
     1  0  1  0
     1  1  0  0
    
     ----jGRASP: operation complete.
 */