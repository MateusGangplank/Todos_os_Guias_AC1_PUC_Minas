// -----------------------
// Guia 08 - Exercicio 03
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// -- modulo Exercicio 03

module exe03 (s, a, b, c, d, e);

input a, b, c, d, e;
output s; 
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;

not NOT1(w1, a);
not NOT2(w2, b);
not NOT3(w3, c);
not NOT4(w4, d);
and AND1(w5, a, d, w2, w3);
or OR1(w12, w2, c);
and AND2(w6, w12, e);
and AND3(w7, e, w1);
and AND4(w8, a, c);
and AND5(w9, w1, w3);
or OR2(w10, w7, w8, w9);
and AND6(w11, w4, w10);
or OR3(s, w6, w5, w11);

endmodule // exe03

// -- teste Exercicio 03

module teste03;

reg a, b, c, d, e;
output s;

exe03 E(s, a, b, c, d, e);

// parte principal
  initial begin
      $display("Guia 08 - Exercicio 03");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Exercicio 03");
      $display("\n a - b - c - d - e = s\n");
  		a=0; b=0; c=0; d=0; e=0;
		$monitor(" %b - %b - %b - %b - %b = %b", a, b, c, d, e, s);
		#1 a=0; b=0; c=0; d=0; e=1;
		#1 a=0; b=0; c=0; d=1; e=0;
		#1 a=0; b=0; c=0; d=1; e=1;
		#1 a=0; b=0; c=1; d=0; e=0;
		#1 a=0; b=0; c=1; d=0; e=1;
		#1 a=0; b=0; c=1; d=1; e=0;
		#1 a=0; b=0; c=1; d=1; e=1;
		#1 a=0; b=1; c=0; d=0; e=0;
		#1 a=0; b=1; c=0; d=0; e=1;
		#1 a=0; b=1; c=0; d=1; e=0;
		#1 a=0; b=1; c=0; d=1; e=1;
		#1 a=0; b=1; c=1; d=0; e=0;
		#1 a=0; b=1; c=1; d=0; e=1;
		#1 a=0; b=1; c=1; d=1; e=0;
		#1 a=0; b=1; c=1; d=1; e=1;
		#1 a=1; b=0; c=0; d=0; e=0;
		#1 a=1; b=0; c=0; d=0; e=1;
		#1 a=1; b=0; c=0; d=1; e=0;
		#1 a=1; b=0; c=0; d=1; e=1;
		#1 a=1; b=0; c=1; d=0; e=0;
		#1 a=1; b=0; c=1; d=0; e=1;
		#1 a=1; b=0; c=1; d=1; e=0;
		#1 a=1; b=0; c=1; d=1; e=1;
		#1 a=1; b=1; c=0; d=0; e=0;
		#1 a=1; b=1; c=0; d=0; e=1;
		#1 a=1; b=1; c=0; d=1; e=0;
		#1 a=1; b=1; c=0; d=1; e=1;
		#1 a=1; b=1; c=1; d=0; e=0;
		#1 a=1; b=1; c=1; d=0; e=1;
		#1 a=1; b=1; c=1; d=1; e=0;
		#1 a=1; b=1; c=1; d=1; e=1;
		
		end
	
	endmodule // teste03