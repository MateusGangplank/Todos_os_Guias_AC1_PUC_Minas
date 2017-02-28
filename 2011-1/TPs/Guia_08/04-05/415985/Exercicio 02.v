// -----------------------
// Guia 08 - Exercicio 02
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// -- modulo Exercicio 02

module exe02 (s, a, b, c, d);

input a, b, c, d;
output s; 
wire w1, w2, w3, w4, w5, w6, w7, w8;


not NOT1(w1, a);
not NOT2(w2, b);
not NOT3(w3, c);
not NOT4(w4, d);
and AND1(w5, w2, w3);
or OR1(w6, w5, w1);
and AND2(w7, w6, w4);
and AND3(w8, a, d);
or OR2(s, w7, w8);

endmodule // exe02

// -- teste Exercicio 02

module teste02;

reg a, b, c, d;
output s;

exe02 E(s, a, b, c, d);

// parte principal
  initial begin
      $display("Guia 08 - Exercicio 02");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Exercicio 02");
      $display("\n a - b - c - d = s\n");
  		a=0; b=0; c=0; d=0;
		$monitor(" %b - %b - %b - %b = %b", a, b, c, d, s);
		#1 a=0; b=0; c=0; d=1;
		#1 a=0; b=0; c=1; d=0;
		#1 a=0; b=0; c=1; d=1;
		#1 a=0; b=1; c=0; d=0;
		#1 a=0; b=1; c=0; d=1;
		#1 a=0; b=1; c=1; d=0;
		#1 a=0; b=1; c=1; d=1;
		#1 a=1; b=0; c=0; d=0;
		#1 a=1; b=0; c=0; d=1;
		#1 a=1; b=0; c=1; d=0;
		#1 a=1; b=0; c=1; d=1;
		#1 a=1; b=1; c=0; d=0;
		#1 a=1; b=1; c=0; d=1;
		#1 a=1; b=1; c=1; d=0;
		#1 a=1; b=1; c=1; d=1;
		
		end
	
	endmodule // teste02
