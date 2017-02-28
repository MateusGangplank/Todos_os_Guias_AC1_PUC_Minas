// ---------------------
// Exemplo 05_03- Multiplicacao com 2 bits
// Nome: Marcio Santana Correa 345368
// ---------------------

// ---------------------
// -- Multiplicacao com 2 bits
// ---------------------
module meiasoma(s, s1, a, b);
input a, b;
output s, s1;
wire s2;
xor XOR1 (s,a,b);
and AND1 (s1,a,b);
endmodule//meiasoma
// ---------------------
// -- Multiplicacao com 2 bits
// ---------------------

module testmultiplicacao;
 reg   a, b, c, d;
 wire  s, s1, s2, s3, s4, s5, s6, s7;
          // instancia
and AND1(s,b,d);

and AND2(s1,a,d);

and AND3(s2,b,c);

and AND4(s3,a,c);

meiasoma MS1 (s4,s5,s1,s2);
meiasoma MS2 (s6,s7,s5,s3);

initial begin: start
a=0; b=0; c=0; d=0;
end
 
          // parte principal
 initial begin : main
      $display("Marcio Santana Correa 345368");
      $display("Test Diferenca com 2 bits ");
      $display("\n ab * cd = s\n");
 	   $monitor("%b%b * %b%b = %b%b%b%b", a, b, c, d, s7, s6, s4, s);
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

endmodule // testsomacompleta