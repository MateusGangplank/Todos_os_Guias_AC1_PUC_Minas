// Exemplo0005- xor
// Nome : Julio Mirnada Machado
// Matricula: 435666


// xor gate

module xorgate (output [0:3]s, input [0:3]p, input [0:3]q); 
	assign s = p^q ; 
endmodule // xorgate

// Test xor Gate 

module testxorgate;
reg [0:3]a , b;
wire [0:3]s;

xorgate XOR1(s,a,b);
	
	initial begin:start
		a=4'b0011;b=4'b0101;
end
	initial begin
		$display("Exemplo0005 Julio Machado - 435666");
		$display("Test XOR gate");
		$display("\na^b=s\n");
		$monitor("%b ^ %b = %b", a, b, s); 
	#1 a=0; b=0; 				 // valores decimais 
	#1 a=4'b0010; b=4'b0001; // valores binarios 
	#1 a=4'd1; b=3;			 // decimal e decimal 
	#1 a=4'o5; b=2; 			 // octal e decimal 
	#1 a=4'hA; b=3; 			 // hexadecimal e decimal 
	#1 a=4'h9; b=4'o3;		 // hexadecimal e octal 
	

	end
endmodule // testandgate