// -------------------------
// Exemplo0022 - FULL SUBTRACT 
// Nome: Silvino Henrique Santos de Souza
// Matricula: 412773
// ------------------------- 

// ------------------------- 
// full subtract
// ------------------------- 


// descrever por portas 

module xorGate (output [2:0] s1,
					 input [5:0] a,
					 input [5:0] b);
assign s1 = (a ^ b);
endmodule // xorGate

module andGate (output [2:0] s2,
					 input [5:0] a,
					 input [5:0] b);
assign s2 = (~a & b);
endmodule // andGate

module orGate (output [2:0] s3,
					input [5:0] a,
					input [5:0] b);
assign s3 = (a | b);
endmodule // orGate

module test_fullSubtract; 
// ------------------------- definir dados 
	reg [5:0] a; 
	reg [5:0] b; 
	reg [5:0] bin;
	wire [2:0] di; 
	wire [2:0] bout;
	xorGate bonanza (s4, a, b);
	andGate danubio (s3, a, b);
	andGate bilara (s2, s4, bin);
	xorGate bonanza (di, bin, s4);
	orGate domada (bout, s2, s3);

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0022 - Silvino Henrique Santos de Souza - 412773"); 
	$display("Test ALU's full subtract"); 

// projetar testes do somador complete 
	a = 6'b000000; b = 6'b000001; bin = 6'b000000;
	$display("\n%b - %b com bin %b = %b%b", a, b, bin, di, bout);

end 

endmodule // test_fullSubtract 