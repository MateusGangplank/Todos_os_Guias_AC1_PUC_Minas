// ------------------------- 
// Exemplo0032 - ALU
// Nome: Ailton Gomes 
// Matricula: 440092
// ------------------------- 
// ------------------------- 
// somador algebrico
// ------------------------- 
 module HA (output s, output CO, input x, input y); 
xor XOR1 (s, x, y);
and AND1 (CO, x, y);
endmodule // HA 
// -------------------------------------------------------------------------------------------------	 
 
module FU (output s, output CO, input x, input y, input CI); 
wire [2:0]s; 

HA HA1 (s[0], s[1], x, y);
HA HA2 (s, s[2], s[0], CI);

or OR1 (CO, s[1], s[2]);	 
  
endmodule // FU 
// -------------------------------------------------------------------------------------------------	 
	 
module Zero (output s, input [2:0] x, input ho); 

nor NOR1 (s, x[0], x[1], x[2], h0);
       
endmodule // detectorZero 
// -------------------------------------------------------------------------------------------------	 

module SA (output [2:0]s, output CO, input [2:0]x, input [2:0]y, input CI); 
wire [2:0]s;
wire [2:0]s1;

xor XOR1 ( s[0], y[0], CI);
xor XOR2 ( s[1], y[1], CI);
xor XOR3 ( s[2], y[2], CI);

FU FA1 (s[0], s1[0], x[0], s[0], CI);
FU FA2 (s[1], s1[1], x[1], s[1], s1[0]);
FU FA3 (s[2], s1[2], x[2], s[2], s1[1]);
xor XOR1 (CO, CI, s1[2]);
Zero DZ1 (x, s, CO);

endmodule // SA 
// ------------------------- 
// -- test Somador Algebrico
// -------------------------
module test_SA; 
// ------------------------- definir dados 
 
 reg  [2:0] x;
 reg  [2:0] y;
 reg  cIn;
 wire [2:0] s;
 wire cOut;
 wire dz;

// ------------------------- instancia 
 
SA modulo (s, cOut, x, y, cIn);
  
// ------------------------- parte principal 

 initial begin 
 $display("Exemplo0032 - Ailton Gomes - 440092"); 
 $display("Test ALU Somador Algebrico \n");
 
 $display("x  y ----> CI = CO  saida ---->> 'Zero'\n");

  #1 x = 4'b0001; y = 4'b0010; cIn = 0;
 $monitor("%4b  %4b ----> %b = %b %4b ---->> %b", x, y, cIn, cOut, s, dz);
  #1 x = 3'b001; y = 3'b010; cIn = 1;

  #1 x = 3'b110; y = 3'b100; cIn = 0;
  #1 x = 3'b110; y = 3'b100; cIn = 1;

  #1 x = 3'b110; y = 3'b010; cIn = 0;
  #1 x = 3'b110; y = 3'b010; cIn = 1;
 
  #1 x = 3'b011; y = 3'b010; cIn = 0;
  #1 x = 3'b011; y = 3'b010; cIn = 1;

end 
endmodule // test_SA 