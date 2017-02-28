// ---------------------
// Guia 04 - Exercicio 02
// Nome: Bruno César Lopes Silva
// Matricula: 415985
// ---------------------

//--- Module Meia Soma--

module meiasoma (s, s1, p, q);
output s, s1;
input p, q;
assign s = p ^ q;
assign s1 = p & q;

endmodule // meiasoma

//--- Teste Soma Completa---

module testesomacompleta;
reg a, b, vaium;
wire s2, s3, s4, s, s1;

meiasoma M1 (s2, s3, a, b);
meiasoma M2 (s, s4, s2, vaium);
or Or1 (s1, s3, s4);

// parte principal
   initial begin
	   $display("Guia 04 - Exercicio 02");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Soma Completa");
      $display("\n a + b + cIn = s / cOut\n");
  		a=0; b=0; vaium=0;
		$monitor(" %b + %b + %b =   %b / %b", a, b, vaium, s, s1);
		#1 a=0; b=0; vaium=1;
		#1 a=0; b=1; vaium=0;
		#1 a=0; b=1; vaium=1;
		#1 a=1; b=0; vaium=0;
		#1 a=1; b=0; vaium=1;
		#1 a=1; b=1; vaium=0;
		#1 a=1; b=1; vaium=1;
		
		end
		
		endmodule // testesomacompleta