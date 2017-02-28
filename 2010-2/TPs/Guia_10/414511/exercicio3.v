// ---------------------
// Guia 10_03 - Latch D com portas NAND,PRESET E CLEAR.
// Nome:Nádia de Souza Maciel Vieira Ferreira 
// Matricula: 414511
// ---------------------

//Implementar um latch D com portas NAND,PRESET e CLEAR.
 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module latch_D (q_bar, q, d, pr, cl);

output q, q_bar;
input d, pr, cl;

wire dL;

not NOT1(dL, d);

nand NAND1(q, d, q_bar, pr);
nand NAND2(q_bar, dL, q, cl);

endmodule 

module Exercicio3;
wire q, q_bar;
reg d, pr,cl;

latch_D LSR_NAND (q_bar, q, d, pr, cl);

initial begin:start
d=0;cl=0;pr=0;
end

initial begin: main
	   $display("Guia 10_03 -Nádia De souza Maciel Vieira Ferreira");
      $display("Latch D com portas NAND");
		$display("D   CLEAR  PRESET   Q    Q'");
		$monitor("%b    %b      %b       %b    %b", d, cl, pr,q_bar, q);
		
		#1 d=1; cl=0; pr=0;
		#1 d=0; cl=1; pr=0;
		#1 d=1; cl=0; pr=1;
		#1 d=0; cl=1; pr=1;

end

endmodule

/* Resultado obtido
    D   CLEAR  PRESET   Q    Q'
    0    0      0       1    1
    1    0      0       1    1
    0    1      0       0    1
    1    0      1       1    0
    0    1      1       0    1
    
      */