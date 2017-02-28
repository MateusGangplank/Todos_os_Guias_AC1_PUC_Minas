// ---------------------
// Exemplo 05_02- Diferença com 2 bits
// Nome: Marcio Santana Correa 345368
// ---------------------

// ---------------------
// -- diferenca com 2 bits
// ---------------------
module meiadiferenca(s, s1, a, b);
input a, b;
output s, s1;
wire s2;
xor XOR1 (s,a,b);
not NOT1 (s2, a);
and AND1 (s1,s2,b);
endmodule//meiasoma
module diferencacompleta(s2, s4, a, b, c);
input a, b, c;
output  s2, s4;
wire s, s1, s3;
meiadiferenca MD1 (s, s1, a, b);
meiadiferenca MD2 (s2, s3, s, c);
or OR1 (s4, s1, s3);
endmodule//somacompleta
// ---------------------
// -- diferenca com 2 bits
// ---------------------

module testdiferencacombits;
 reg   a, b, c, d;
 wire  s, s1, s2, s3;
          // instancia
meiadiferenca MD3(s,s1,b,d);

diferencacompleta SC1(s2, s3, s1, a, c);

initial begin: start
a=0; b=0; c=0; d=0;
end
 
          // parte principal
 initial begin : main
      $display("Marcio Santana Correa 345368");
      $display("Test Diferenca com 2 bits ");
      $display("\n ab - cd = s\n");
 	   $monitor("%b%b - %b%b = %b%b", a, b, c, d, s2, s);
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

endmodule // test