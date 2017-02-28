// ---------------------
// Guia 04 - Exercicio 03
// Nome: Bruno César Lopes Silva
// Matricula: 415985
// ---------------------

// --- module meia diferenca ---

module meiadiferenca (s, s1, p, q);
output s, s1;
input p, q;
assign s = p ^ q;
assign s1 = ~p & q;

endmodule // meiadiferenca

//-- Teste diferenca completa 

module testemeiadiferenca;
reg a, b, vemum;
wire s2, s3, s4, s5, s6, s, s1;

meiadiferenca M1 (s2, s3, a, b);
meiadiferenca M2 (s, s4, s2, vemum);
nand NAND1 (s5, s3, s3);
nand NAND2 (s6, s4, s4);
nand NAND3 (s1, s5, s6);

  // parte principal
   initial begin
	   $display("Guia 04 - Exercicio 05");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Diferenca Completa");
      $display("\n a - b - cIn = s / cOut\n");
  		a=0; b=0; vemum=0;
		$monitor(" %b - %b - %b =   %b / %b", a, b, vemum, s, s1);
		#1 a=0; b=0; vemum=1;
		#1 a=0; b=1; vemum=0;
		#1 a=0; b=1; vemum=1;
		#1 a=1; b=0; vemum=0;
		#1 a=1; b=0; vemum=1;
		#1 a=1; b=1; vemum=0;
		#1 a=1; b=1; vemum=1;
		
		end
		
		endmodule // testediferencacompleta