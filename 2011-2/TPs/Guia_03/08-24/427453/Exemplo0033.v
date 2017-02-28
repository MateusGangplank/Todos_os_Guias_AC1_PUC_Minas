// ------------------------- 
// Exemplo0033 - LU and e or e nand e nor
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module lastChance (output [3:0] s0, 
			          input [3:0] s5, 
			          input [3:0] s3, 
			          input [3:0] key); 
 assign s0 = (s5 & ~key) | (s3 & key); 
	endmodule // lastChance 
module oneMoreTime (output [3:0] s1, 
			           input [3:0] s2, 
			           input [3:0] s4, 
			           input [3:0] key); 
 assign s1 = (s2 & ~key) | (s4 & key); 
	endmodule // oneMoreTime 
module orGate (output [3:0] s5, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s5 = (w | x);         
 	endmodule // orGate 
module andGate (output [3:0] s2, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s2 = (w & x); 
	endmodule // andGate 
module norGate (output [3:0] s4, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s4 = ~(w | x);         
 	endmodule // norGate 
module nandGate (output [3:0] s3, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s3 = ~(w & x); 
	endmodule // nandGate 
	module test_f5; 
// ------------------------- definir dados 
	reg [3:0] w; 
	reg [3:0] x; 
	reg [3:0] key; 
	wire [3:0] s0; 
	wire [3:0] s1; 
	wire [3:0] s2; 
	wire [3:0] s3; 
	wire [3:0] s4; 
	wire [3:0] s5; 
	orGate ana (s5, w, x);
	nandGate mari (s3, w, x);
	andGate nathalia (s2, w, x);
	norGate norberta (s4, w, x);
	lastChance bruno (s0, s5, s3, key);
	oneMoreTime fernao (s1, s2, s4, key);
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0033 - Pedro Henrique Vilar Locatelli - 427453"); 
	$display("Test LU's module"); 
	w = 4'b0011; x = 4'b0101;
		// projetar testes do modulo 
	#1 key = 4'b1111;
	$monitor("%b operação(or ou nand) %b com chave %b = %b e %b operação(nor ou and) %b com chave %b = %b", w, x, key, s0, w, x, key, s1); 
	#2 key = 4'b0000;
end 
endmodule // test_f5 