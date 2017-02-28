// ---------------------
// Latch SR com portas NAND,PRESET E CLEAR.
// Nome: Nádia de Ssouza Maciel Vieira Ferreira 
// Matricula: 414511
// ---------------------

//Implementar um latch SR com portas NAND,PRESET e CLEAR.
 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module latch_SR_NAND(q, q_bar, pr, cl, r, s);

	input r, s, pr, cl;
	output q, q_bar;
	
	nand NAND1(q, pr, s, q_bar); 
	nand NAND2(q_bar, cl, r, q);
	
endmodule

module Exercicio2;
wire q, q_bar;
reg s,r, pr,cl;

latch_SR_NAND LSR_NAND (q, q_bar,cl,pr, s, r);

initial begin:start
s=0; r=0;cl=0;pr=0;
end

initial begin: main
	   $display("Guia 10_02 -Nádia de Souza Maciel Vieira ferriera");
      $display("Latch SR com portas NAND");
		$display("R   S   CLEAR  PRESET   Q    Q'");
		$monitor("%b   %b    %b      %b       %b    %b", s, r, cl, pr,q_bar, q);
		
		#1 s=1; r=0; cl=0; pr=0;
		#1 s=0; r=1; cl=0; pr=0;
		#1 s=0; r=0; cl=1; pr=0;
		#1 s=0; r=0; cl=0; pr=1;
		#1 s=1; r=1; cl=1; pr=1;

end

endmodule

/* Resultado obtido
     
	      R   S   CLEAR  PRESET   Q    Q'
    0   0    0      0       1    1
    1   0    0      0       1    1
    0   1    0      0       1    1
    0   0    1      0       1    1
    0   0    0      1       1    1
    1   1    1      1       0    1
    


*/