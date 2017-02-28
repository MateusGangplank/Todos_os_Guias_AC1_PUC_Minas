// ------------------------- 
// Exemplo0035 - LU and e or e nand e nor e xnor e xor
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module orGate (output [3:0] s5, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s5 = (w | x);         
 	endmodule // orGate 
module xorGate (output [3:0] s2, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s2 = (w ^ x); 
	endmodule // xorGate 
module xnorGate (output [3:0] s4, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s4 = ~(w ^ x);         
 	endmodule // xnorGate 
module norGate (output [3:0] s3, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s3 = ~(w | x); 
	endmodule // norGate 
module andGate (output [3:0] s0, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s0 = (w & x); 
	endmodule // andGate 
module nandGate (output [3:0] s1, 
			  input [3:0] w, 
			  input [3:0] x); 
 assign s1 = ~(w & x); 
	endmodule // nandGate 
	module test_f5; 
// ------------------------- definir dados 
	reg [3:0] w; 
	reg [3:0] x; 
	wire [3:0] s0; 
	wire [3:0] s1; 
	wire [3:0] s2; 
	wire [3:0] s3; 
	wire [3:0] s4; 
	wire [3:0] s5; 
	orGate ana (s5, w, x);
	norGate mari (s3, w, x);
	xorGate nathalia (s2, w, x);
	xnorGate norberta (s4, w, x);
	nandGate catarina (s1, w, x);
	andGate olivia (s0, w, x);
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0035 - Pedro Henrique Vilar Locatelli - 427453"); 
	$display("Test LU's module"); 
	w = 4'b0011; x = 4'b0101;
		// projetar testes do modulo 
	$display("%b or %b  = %b", w, x, s5); 
	$display("%b nor %b  = %b", w, x, s3); 
	$display("%b xor %b  = %b", w, x, s2); 
	$display("%b xnor %b  = %b", w, x, s4); 
	$display("%b nand %b  = %b", w, x, s0); 
	$display("%b and %b  = %b", w, x, s1); 
end 
endmodule // test_f5 