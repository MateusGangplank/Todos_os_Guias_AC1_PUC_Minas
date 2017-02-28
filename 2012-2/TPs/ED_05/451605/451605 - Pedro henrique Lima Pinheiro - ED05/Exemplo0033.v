// ------------------------- 
// Exemplo0033 - INCREMENTO
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// ------------------------- 

// -------------------------
//  incremento de 1
// -------------------------
module halfAdder (output s1, output s0, input a, input b);
	xor (s0, a, b);
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

module incremento1 (output [3:0]s, input [2:0]a);
	wire x1,ct1,ct2,ct3;
	
// --------- Full Adder
	fullAdder FA1 (ct1, s[0], a[0], 1, 0);
	fullAdder FA2 (ct2, s[1], a[1], 0, ct1);
	fullAdder FA3 (ct3, s[2], a[2], 0, ct2);
	
// --------- Porta xor	
	xor XOR4      (s[3], ct3, 0);
	
endmodule // incremento1

module test_incremento1;
// ------------------------- definir dados
   reg [2:0]x;
	wire [3:0]soma;
	
	incremento1 inc (soma, x);
	
	initial begin: start
		x = 3'b000; 
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0033 - Pedro Henrique Lima Pinheiro - 451605");
      $display("Test ALU's incremento de 1");
      $monitor("%3b + 1 = %4b",x,soma); 
		repeat (7) begin
		#1 x = x + 1;
		end
   end
endmodule // test_incremento1