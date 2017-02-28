// Exemplo0004 - XOR 
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- xor gate 
// ------------------------- 
module xorgate (output [0:3] s, input [0:3] p, input [0:3] q);  
	assign s = p ^ q; 
endmodule 

// ------------------------- 
// -- test xor gate 
// ------------------------- 
module testxorgate; 
	reg [0:3] a,b; 	 
	wire [0:3] s; 
	xorgate XOR1 (s, a, b); 
	
	initial begin:start 
		a=4'b0101;
		b=4'b0101; // valor inicial 
	end 

	initial begin:main 
		$display("Exemplo 0005 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test XOR Gate:"); 
		$display("\n a ^ b = s\n");
		 
		$monitor("%b ^ %b = %b", a, b, s); 
		#1 a=0; b=0; // valores decimais 
		#1 a=4'b0010; b=4'b0001; // valores binarios 
		#1 a=4'd1; b=3; // decimal e decimal 
		#1 a=4'o5; b=2; // octal e decimal 
		#1 a=4'hA; b=3; // hexadecimal e decimal 
		#1 a=4'h9; b=4'o3; // hexadecimal e octal 
	end 
endmodule 