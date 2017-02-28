// ------------------------- 
// Exemplo0035 - SOMADOR ALGEBRICO
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// ------------------------- 

// -------------------------
//  somador
// -------------------------
module halfAdder (output s1, output s0, input a, input b);

// --------- Porta Xor
	xor (s0, a, b);
	
// --------- Porta And
	and (s1, a, b);
	
endmodule // halfAdder

module fullAdder (output carryOut, output s, input  a, input  b, input carryIn);
	wire s2,s1,s0;
	
// --------- Half Adder	
	halfAdder HA1 (s1, s0, a, b);
	halfAdder HA2 (s2, s, s0, carryIn);
	
// --------- Porta OR	
	or            (carryOut, s1, s2);
endmodule // fullAdder

module somadorAlg (output [3:0]s, output Flag, output plus, output mns, input [2:0]a, input [2:0]b);
	wire x1,x2,x3,ct1,ct2,ct3;
	
// -------- Portas Xors		
	xor XOR1      (x1, b[0], 1);
	xor XOR2      (x2, b[1], 1);
	xor XOR3      (x3, b[2], 1);
	xor XOR4      (s[3], ct3, 1);
	
// --------- Full Adder		
	fullAdder FA1 (ct1, s[0], a[0], x1, 1);
	fullAdder FA2 (ct2, s[1], a[1], x2, ct1);
	fullAdder FA3 (ct3, s[2], a[2], x3, ct2);
	
// --------- Porta Nor
	nor NOR1      (Flag, s[0], s[1], s[2], s[3]);
	
// ---------- Porta Not	
	not NOT1      (plus, s[3]);
	
	assign mns = s[3];
endmodule // somadorAlg

module test_somadorAlg;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	wire [3:0]soma;
	wire Flag;
	wire plus;
	wire mns;
	
	somadorAlg somadif (soma, Flag, plus, mns, x, y);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b000;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0035 - Pedro Henrique Lima Pinheiro - 451605");
      $display("Test ALU's somador algebrico");
      $monitor("%3b - %3b = %3b --- flag 0 = %b --- plus = %b --- minus = %b",x,y,soma,Flag,plus,mns); 
		repeat (7) begin
		#1 y = y + 1;  

		#1 x = x + 1;
		end

   end
endmodule // test_somadorAlg
