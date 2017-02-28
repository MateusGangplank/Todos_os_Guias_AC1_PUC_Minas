// ------------------------- 
// Exemplo0032 - SOMADOR ALG
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// ------------------------- 
// -------------------------
//  somador algebrico
// -------------------------
module halfAdder (output s1, output s0, input a, input b);
xor (s0, a, b);
and (s1, a, b);
endmodule // halfAdder
module fullAdder (output carryOut, output s, input  a, input  b, input carryIn);
wire s2,s1,s0;
halfAdder HA1 (s1, s0, a, b);
halfAdder HA2 (s2, s, s0, carryIn);
or (carryOut, s1, s2);
endmodule // fullAdder
module somadorAlg (output [3:0]s, output zFlag, input [2:0]a, input [2:0]b, input carryIn);
wire s3,s4,s5,cout1,cout2,cout3;
xor XOR1      (s3, b[0], carryIn);
xor XOR2      (s4, b[1], carryIn);
xor XOR3      (s5, b[2], carryIn);
fullAdder FA1 (cout1, s[0], a[0], s3, carryIn);
fullAdder FA2 (cout2, s[1], a[1], s4, cout1);
fullAdder FA3 (cout3, s[2], a[2], s5, cout2);
xor XOR4      (s[3], cout3, carryIn);
nor NOR1      (zFlag, s[0], s[1], s[2], s[3]);
endmodule // somadorAlg
module test_somadorAlg;
// ------------------------- definir dados
 reg [2:0]x;
reg [2:0]y;
reg c;
wire [3:0]soma;
wire zFlag;
somadorAlg somadif (soma, zFlag, x, y, c);
initial begin: start
x = 3'b000; 
y = 3'b000;
c = 1;
end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0032 - Gabriel Carlos Damasceno Arriel - 382175");
      $display("Test ALU's somador algebrico");
		$display(" a     b     s   |   Sinal"); 
      $monitor("%3b - %3b = %3b | ZERO-flag = %b",x,y,soma,zFlag); 
		repeat (7) begin
		#1 y = y + 1;  
		end
		repeat (7) begin
		#1 x = x + 1;
		end
   end
endmodule // test_somadorAlg
