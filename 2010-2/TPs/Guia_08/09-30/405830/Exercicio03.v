// ---------------------
// Exemplo 08_03 - Simplificador
// Nome: Pedro Siqueira
// Matricula: 405830
// ---------------------

// ---------------------
// -- Simplificador
// ---------------------
module simplificadorA (s,e,a,c);
input e,a,b,c;
output s;
wire f,t,r;
not NOT1 (f,e);
not NOT2 (t,a);
not NOT3 (r,c);
and AND1 (s,f,t,r);
endmodule//endsimplifidadorA
module simplificadorB (s,e,a,b,c);
input e,a,b,c;
output s;
wire f,t,r;
not NOT4 (f,e);
not NOT1 (t,a);
not NOT2 (r,c);
and AND2 (s,f,t,b,r);
endmodule //endsimplificadorB
module simplificadorC (s,e,b,c,d);
input e,b,c,d;
output s;
wire f;
not NOT1 (f,e);
and AND3 (s,f,b,c,d);
endmodule //endsimplificadorC
module simplificadorD (s,e,a,c,d);
input e,a,c,d;
output s;
wire f,t;
not NOT8 (f,c);
not NOT9 (t,e);
and AND4 (s,t,a,f,d);
endmodule //endsimplificadorD
module simplificadorE (s,a,b,c);
input a,b,c;
output s;
and AND5 (s,a,b,c);
endmodule //endsimplificadorE
module simplificadorF (s,e,a,b,c);
input e,a,b,c;
output s;
wire f,t;
not NOT1 (f,a);
not NOT2 (t,c);
and AND5 (s,e,f,b,t);
endmodule //endsimplificadorF
module simplificadorG (s,e,b,c,d);
input e,b,c,d;
output s;
and AND5 (s,e,b,c,d);
endmodule //endsimplificadorG
module simplificadorH (s,e,a,c,d);
input e,a,c,d;
output s;
and AND5 (s,e,a,c,d);
endmodule //endsimplificadorH
module simplificadorI (s,e,a,b,d);
input e,a,b,d;
output s;
and AND5 (s,e,a,b,d);
endmodule //endsimplificadorI
module simplificadorK (s,e,a,b,c,d);
input e,a,b,c,d;
output s;
wire f,r,t;
not not1 (f,a);
not not2 (r,b);
not not3 (t,d);
and AND5 (s,e,f,r,c,t);
endmodule //endsimplificadorK
module simplificadorJ (s,e,a,b,c,d);
input e,a,b,c,d;
output s;
wire f,r,t;
not not1 (f,a);
not not2 (r,b);
not not3 (t,c);
and AND5 (s,e,f,r,t,d);
endmodule //endsimplificadorJ
// ---------------------
// -- test Simplificador
// ---------------------

module Simplificador;
 reg   e, a, b, c, d;
 wire  s, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;
          // instancia
simplificadorA SA1(s1,e,a,c);
simplificadorB SB1(s2,e,a,b,c);
simplificadorC SC1(s3,e,b,c,d);
simplificadorD SD1(s4,e,a,c,d);
simplificadorE SE1(s5,a,b,c);
simplificadorF SF1(s6,e,a,b,c);
simplificadorG SG1(s7,e,b,c,d);
simplificadorH SH1(s8,e,a,c,d);
simplificadorI SI1(s9,e,a,b,d);
simplificadorJ SJ1(s10,e,a,b,c,d);
simplificadorK SK1(s11,e,a,b,c,d);
or OR1 (s,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11);
initial begin: start
e=0; a=0; b=0; c=0; d=0;
end
 
          // parte principal
 initial begin : main
      $display("Guia 08_03 - Pedro Siqueira - 405830");
      $display("Simplificador");
 	   $monitor("%b%b%b%b%b = %b", e, a, b, c, d, s);
 		#1 e=0; a=0; b=0; c=0; d=1;
		#1 e=0; a=0; b=0; c=1; d=0;
		#1 e=0; a=0; b=0; c=1; d=1;
		#1 e=0; a=0; b=1; c=0; d=0;
		#1 e=0; a=0; b=1; c=0; d=1;
		#1 e=0; a=0; b=1; c=1; d=0;
		#1 e=0; a=0; b=1; c=1; d=1;
		#1 e=0; a=1; b=0; c=0; d=0;
		#1 e=0; a=1; b=0; c=0; d=1;
		#1 e=0; a=1; b=0; c=1; d=0;
		#1 e=0; a=1; b=0; c=1; d=1;
		#1 e=0; a=1; b=1; c=0; d=0;
		#1 e=0; a=1; b=1; c=0; d=1;
		#1 e=0; a=1; b=1; c=1; d=0;
	   #1 e=0; a=1; b=1; c=1; d=1;
		#1 e=1; a=0; b=0; c=0; d=0;
 		#1 e=1; a=0; b=0; c=0; d=1;
		#1 e=1; a=0; b=0; c=1; d=0;
		#1 e=1; a=0; b=0; c=1; d=1;
		#1 e=1; a=0; b=1; c=0; d=0;
		#1 e=1; a=0; b=1; c=0; d=1;
		#1 e=1; a=0; b=1; c=1; d=0;
		#1 e=1; a=0; b=1; c=1; d=1;
		#1 e=1; a=1; b=0; c=0; d=0;
		#1 e=1; a=1; b=0; c=0; d=1;
		#1 e=1; a=1; b=0; c=1; d=0;
		#1 e=1; a=1; b=0; c=1; d=1;
		#1 e=1; a=1; b=1; c=0; d=0;
		#1 e=1; a=1; b=1; c=0; d=1;
		#1 e=1; a=1; b=1; c=1; d=0;
	   #1 e=1; a=1; b=1; c=1; d=1;

		
 end

endmodule // test