// -----------------------
// Guia 08 - Exercicio 01
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// -- modulo Exercicio 01

module exe01 (s, a, b, c, d);

input a, b, c, d;
output s; 
wire w1, w2, w3, w4, w5, w6;


not NOT1(w1, a);
not NOT2(w2, c);
and AND1(w3, w1, c);
or OR1(w4, c, d);
and AND2(w5, w4, b);
and AND3(w6, a, d, w2);
or OR2(s, w6, w5, w3);

endmodule // exe01

// -- teste Exercicio 01

module teste01;

reg a, b, c, d;
output s;

exe01 E(s, a, b, c, d);

// parte principal
  initial begin
      $display("Guia 08 - Exercicio 01");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Exercicio 01");
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
	
	endmodule // teste01
