// -----------------------
// Guia 03 - Exercicio 01
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

//-- Meia Soma ---

module testemeiasoma;
reg a, b;
wire s1, s2, s3, s4, s, s0;

not NOT1 (s1, a);                  // TENTE DEFINIR EM OUTRO MODULO
not NOT2 (s2, b);
and AND1 (s3, s1, b);
and AND2 (s4, a, s2);
or OR1 (s, s3, s4);
and AND3 (s0, a, b);

  // parte principal
  initial begin
      $display("Guia 03 - Exercicio 01");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Meia Soma");
      $display("\n a + b = s - vai um\n");
  		a=0; b=0;
		$monitor(" %b & %b = %b - %b", a, b, s, s0);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
		end
		
	endmodule // testemeiasoma
	
// OBS.: FAVOR DEIXAR ESPACOS EM BRANCO NO NOME DE ARQUIVO.
