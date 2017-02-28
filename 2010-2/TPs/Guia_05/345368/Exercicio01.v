// ---------------------
// Exemplo 05_01- Soma com 3 bits
// Nome: Marcio Santana Correa
// Matricula: 345368
// ---------------------

// ---------------------
// -- soma com 3 bits
// ---------------------
module meiasoma(s, s1, a, b);
input a, b;
output s, s1;
xor XOR1 (s,a,b);
and AND1 (s1,a,b);
endmodule//meiasoma
module somacompleta(s2, s4, a, b, c);
input a, b, c;
output  s2, s4;
wire s, s1, s3;
meiasoma MS1 (s, s1, a, b);
meiasoma MS2 (s2, s3, s, c);
or OR1 (s4, s1, s3);
endmodule//somacompleta
// ---------------------
// -- soma com 3 bits
// ---------------------

module testsomacombits;
 reg   a, b, c, d, e ,f;
 wire  s, s1, s2, s3, s4, s5;
          // instancia
meiasoma MS3(s,s1,c,f);

somacompleta SC1(s2, s3, s1, b, e);

somacompleta SC2(s4, s5, s3, a, d);

initial begin: start
a=0; b=0; c=0; d=0; e=0; f=0;
end
 
          // parte principal
 initial begin : main
      $display("Marcio Santana Correa");
      $display("Test Soma com 3 bits ");
      $display("\n abc + def = s\n");
 	   $monitor("%b%b%b + %b%b%b = %b%b%b vai %b", a, b, c, d, e, f, s4, s2, s, s5);
 		#1 a=0; b=0; c=0; d=0; e=0; f=1;
		#1 a=0; b=0; c=0; d=0; e=1; f=0;
		#1 a=0; b=0; c=0; d=0; e=1; f=1;
		#1 a=0; b=0; c=0; d=1; e=0; f=0;
		#1 a=0; b=0; c=0; d=1; e=0; f=1;
		#1 a=0; b=0; c=0; d=1; e=1; f=0;
		#1 a=0; b=0; c=0; d=1; e=1; f=1;
		#1 a=0; b=0; c=1; d=0; e=0; f=0;
		#1 a=0; b=0; c=1; d=0; e=0; f=1;
		#1 a=0; b=0; c=1; d=0; e=1; f=0;
		#1 a=0; b=0; c=1; d=0; e=1; f=1;
		#1 a=0; b=0; c=1; d=1; e=0; f=0;
		#1 a=0; b=0; c=1; d=1; e=0; f=1;
		#1 a=0; b=0; c=1; d=1; e=1; f=0;
		#1 a=0; b=0; c=1; d=1; e=1; f=1;
		#1 a=0; b=1; c=0; d=0; e=0; f=0;
		#1 a=0; b=1; c=0; d=0; e=0; f=1;
		#1 a=0; b=1; c=0; d=0; e=1; f=0;
		#1 a=0; b=1; c=0; d=0; e=1; f=1;
		#1 a=0; b=1; c=0; d=1; e=0; f=0;
		#1 a=0; b=1; c=0; d=1; e=0; f=1;
		#1 a=0; b=1; c=0; d=1; e=1; f=0;
		#1 a=0; b=1; c=0; d=1; e=1; f=1;
		#1 a=0; b=1; c=1; d=0; e=0; f=0;
		#1 a=0; b=1; c=1; d=0; e=0; f=1;
		#1 a=0; b=1; c=1; d=0; e=1; f=0;
		#1 a=0; b=1; c=1; d=0; e=1; f=1;
		#1 a=0; b=1; c=1; d=1; e=0; f=0;
		#1 a=0; b=1; c=1; d=1; e=0; f=1;
		#1 a=0; b=1; c=1; d=1; e=1; f=0;
		#1 a=0; b=1; c=1; d=1; e=1; f=1;
		#1 a=1; b=1; c=0; d=0; e=0; f=0;
		#1 a=1; b=0; c=0; d=0; e=0; f=1;
		#1 a=1; b=0; c=0; d=0; e=1; f=0;
		#1 a=1; b=0; c=0; d=0; e=1; f=1;
		#1 a=1; b=0; c=0; d=1; e=0; f=0;
		#1 a=1; b=0; c=0; d=1; e=0; f=1;
		#1 a=1; b=0; c=0; d=1; e=1; f=0;
		#1 a=1; b=0; c=0; d=1; e=1; f=1;
		#1 a=1; b=0; c=1; d=0; e=0; f=0;
		#1 a=1; b=0; c=1; d=0; e=0; f=1;
		#1 a=1; b=0; c=1; d=0; e=1; f=0;
		#1 a=1; b=0; c=1; d=0; e=1; f=1;
		#1 a=1; b=0; c=1; d=1; e=0; f=0;
		#1 a=1; b=0; c=1; d=1; e=0; f=1;
		#1 a=1; b=0; c=1; d=1; e=1; f=0;
		#1 a=1; b=0; c=1; d=1; e=1; f=1;
		#1 a=1; b=1; c=0; d=0; e=0; f=0;
		#1 a=1; b=1; c=0; d=0; e=0; f=1;
		#1 a=1; b=1; c=0; d=0; e=1; f=0;
		#1 a=1; b=1; c=0; d=0; e=1; f=1;
		#1 a=1; b=1; c=0; d=1; e=0; f=0;
		#1 a=1; b=1; c=0; d=1; e=0; f=1;
		#1 a=1; b=1; c=0; d=1; e=1; f=0;
		#1 a=1; b=1; c=0; d=1; e=1; f=1;
		#1 a=1; b=1; c=1; d=0; e=0; f=0;
		#1 a=1; b=1; c=1; d=0; e=0; f=1;
		#1 a=1; b=1; c=1; d=0; e=1; f=0;
		#1 a=1; b=1; c=1; d=0; e=1; f=1;
		#1 a=1; b=1; c=1; d=1; e=0; f=0;
		#1 a=1; b=1; c=1; d=1; e=0; f=1;
		#1 a=1; b=1; c=1; d=1; e=1; f=0;
		#1 a=1; b=1; c=1; d=1; e=1; f=1;
		
 end

endmodule // testsomacompleta