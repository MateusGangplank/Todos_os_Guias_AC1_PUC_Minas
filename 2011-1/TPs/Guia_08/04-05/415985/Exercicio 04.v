// -----------------------
// Guia 08 - Exercicio 04
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// -- modulo Exercicio 04

module exe04 (s, a, b, c, d);

input a, b, c, d;
output s; 
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;

nand N0(w1, a, a);
nand N1(w2, c, c);
nand N2(w3, w1, c);
nand N3(w4, b, d);
nand N4(w5, b, c);
nand N5(w6, w3, w4);
nand N6(w7, w6, w6);
nand N7(w8, w2, a);
nand N8(w9, w8, w8);
nand N9(w10, w9, d);
nand N10(w11,w5, w10);
nand N11(w12, w11, w11);
nand N12(s, w12, w7);

endmodule // exe04

// -- teste Exercicio 04

module teste04;

reg a, b, c, d;
output s;

exe04 E(s, a, b, c, d);

// parte principal
  initial begin
      $display("Guia 08 - Exercicio 04");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Exercicio 04");
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
	
	endmodule // teste04
