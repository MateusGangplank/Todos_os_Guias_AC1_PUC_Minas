// ---------------------
// Guia 04 - Exercicio 03
// Nome: Bruno César Lopes Silva
// Matricula: 415985
// ---------------------

// --- Meia Diferenca usando Nor ---

module testemeiadiferenca;
reg a, b;
wire s2, s3, s4, s5, s6, s;

nor NOR1 (s2, a, a);
nor NOR2 (s3, b, b);
nor NOR3 (s4, s2, b);
nor NOR4 (s5, a, s3);
nor NOR5 (s6, s4, s5);
nor NOR6 (s, s6, s6);

  // parte principal
   initial begin
	   $display("Guia 04 - Exercicio 04");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Meia Diferenca usando Nor");
      $display("\n a - b = s / vem um\n");
  		a=0; b=0;
		$monitor(" %b - %b = %b / %b", a, b, s, s5);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
		end
		
	endmodule // testemeiadiferenca