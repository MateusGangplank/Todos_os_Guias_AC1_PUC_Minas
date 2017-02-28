// -----------------------
// Guia 03 - Exercicio 05
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

//-- Meia Diferenca Usando Nor ---

module testemeiadiferenca;
reg a, b;
wire s1, s2, s3, s4, s5, s, s0;

nor NOR1(s1, b, b);
nor NOR2(s2, a, a);
nor NOR3(s3, a, s1);
nor NOR4(s4, s2, b);
nor NOR5(s5, s3, s4);
nor NOR6(s, s5, s5);
nor NOR7(s0, a, s1);

// parte principal
  initial begin
      $display("Guia 03 - Exercicio 05");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Meia Diferenca usando Nor");
      $display("\n a - b = s / vem um\n");
  		a=0; b=0;
		$monitor(" %b - %b = %b / %b", a, b, s, s0);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
		end
		
	endmodule // testemeiadiferenca