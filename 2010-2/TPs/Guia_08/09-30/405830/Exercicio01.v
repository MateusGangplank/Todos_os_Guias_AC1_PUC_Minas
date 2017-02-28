// ---------------------
// Exemplo 08_01 - Simplificador
// Nome: Pedro Siqueira
// Matricula: 405830
// ---------------------

// ---------------------
// -- Simplificador
// ---------------------
module simplificadorA (s,a,c);
input a,c;
output s;
wire f;
not NOT1 (f,a);
and AND1 (s,f,c);
endmodule//endsimplifidadorA
module simplificadorB (s,a,b,c);
input a,b,c;
output s;
wire f;
not NOT2 (f,b);
and AND2 (s,a,f,c);
endmodule //endsimplificadorB
module simplificadorC (s,a,b,d);
input a,b,d;
output s;
wire f;
not NOT3 (f,d);
and AND3 (s,a,b,f);
endmodule //endsimplificadorC
// ---------------------
// -- test Simplificador
// ---------------------

module Simplificador;
 reg   a, b, c, d;
 wire  s, s1, s2, s3;
          // instancia
simplificadorA SA(s1,a,c);
simplificadorB SB(s2,a,b,c);
simplificadorC SC(s3,a,b,d);
or OR1 (s,s1,s2,s3);
initial begin: start
a=0; b=0; c=0; d=0;
end
 
          // parte principal
 initial begin : main
      $display("Guia 08_01 - Pedro Siqueira - 405830");
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
