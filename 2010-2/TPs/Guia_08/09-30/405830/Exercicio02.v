// ---------------------
// Exemplo 08_02 - Simplificador
// Nome: Pedro Siqueira
// Matricula: 405830
// ---------------------

// ---------------------
// -- Simplificador
// ---------------------
module simplificadorA (s,a,b,d);
input a,b,d;
output s;
wire f,e,r;
not NOT1 (f,a);
not NOT2 (e,b);
not NOT3 (r,d);
and AND1 (s,f,e,r);
endmodule//endsimplifidadorA
module simplificadorB (s,a,b,d);
input a,b,d;
output s;
wire f;
not NOT4 (f,b);
and AND2 (s,a,f,d);
endmodule //endsimplificadorB
module simplificadorC (s,a,c,d);
input a,c,d;
output s;
wire f,e,r;
not NOT5 (f,d);
not NOT6 (e,a);
not NOT7 (r,c);
and AND3 (s,e,r,f);
endmodule //endsimplificadorC
module simplificadorD (s,a,b,c);
input a,b,c;
output s;
wire f,e;
not NOT8 (f,c);
not NOT9 (e,b);
and AND4 (s,a,e,f);
endmodule //endsimplificadorD
module simplificadorE (s,a,c,d);
input a,c,d;
output s;
wire f,e;
not NOT10 (f,c);
and AND5 (s,a,f,d);
endmodule //endsimplificadorD
// ---------------------
// -- test Simplificador
// ---------------------

module Simplificador;
 reg   a, b, c, d;
 wire  s, s1, s2, s3, s4, s5;
          // instancia
simplificadorA SA(s1,a,b,d);
simplificadorB SB(s2,a,b,d);
simplificadorC SC(s3,a,c,d);
simplificadorD SD(s4,a,b,c);
simplificadorE SE(s5,a,c,d);
or OR1 (s,s1,s2,s3,s4,s5);
initial begin: start
a=0; b=0; c=0; d=0;
end
 
          // parte principal
 initial begin : main
      $display("Guia 08_02 - Pedro Siqueira - 405830");
      $display("Simplificador");
 	   $monitor("%b%b%b%b = %b", a, b, c, d, s);
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