// ------------------------- 
// Exemplo0032 - SOMADOR ALGEBRICO
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// ------------------------- 

// -------------------------
//  somador
// -------------------------
module halfAdder (output s1, output s0, input a, input b);
	xor (s0, a, b);
	and (s1, a, b);
endmodule // halfAdder

module fullAdder (output carryOut, output s, input  a, input  b, input carryIn);
	wire s2,s1,s0;

// -------- Half Adder
	halfAdder HA1 (s1, s0, a, b);
	halfAdder HA2 (s2, s, s0, carryIn);
	
// --------- Porta OR	
	or            (carryOut, s1, s2);
	
endmodule // fullAdder

module somadorAg (output [3:0]s, output z, input [2:0]a, input [2:0]b, input carryIn);
	wire x1,x2,x3,ct1,ct2,ct3;

// -------- Portas xors	
	xor XOR1      (x1, b[0], carryIn);
	xor XOR2      (x2, b[1], carryIn);
	xor XOR3      (x3, b[2], carryIn);
	xor XOR4      (s[3], ct3, carryIn);
	
// --------- Full Adder	
	fullAdder FA1 (ct1, s[0], a[0], x1, carryIn);
	fullAdder FA2 (ct2, s[1], a[1], x2, ct1);
	fullAdder FA3 (ct3, s[2], a[2], x3, ct2);
	
// --------- Porta nor
	nor NOR1      (z, s[0], s[1], s[2], s[3]);
	
endmodule // somadorAg

module test_somadorAg;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	reg c;
	wire [3:0]soma;
	wire z;
	
	somadorAg somad (soma, z, x, y, c);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b000;
		c = 1;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0032 - Pedro Henrique Lima Pinheiro - 451605");
      $display("Test ALU's somador algebrico");
      $monitor("%3b - %3b = %3b --- flag 0 = %b",x,y,soma,z); 
		repeat (7) begin
		#1 y = y + 1;  
		end
		repeat (7) begin
		#1 x = x + 1;
		end
   end
endmodule // test_somadorAg

