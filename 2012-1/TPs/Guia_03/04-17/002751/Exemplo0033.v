// ------------------------- 
// Exemplo0033 - F4 
// Nome:Milton costa teles da silva
// Matricula: 002751
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 

module f4 (output [3:0] s1, output [3:0] s2,input [3:0] a, input [3:0] b, input[3:0]c); 
	
	// --descrever por portas 
	assign s1[3:0] = ((~(a & b) & c)) | ((a & b) & ~c);
	assign s2[3:0] = ((~(a | b) & c)) | ((a | b) & ~c);
	
endmodule // f4 

module test_f4; 
	// ------------------------- definir dados 
	reg [3:0]  x; 
   reg [3:0]  y;
	reg [3:0]  z; 
   wire [3:0] s1;
	wire [3:0] s2;  
	
	f4 modulo (s1,s2, x, y,z); 
	
	// ------------------------- parte principal 
		initial begin 
		
		$display("Exemplo0033 - Milton costa teles da silva - 002751"); 
		$display("Test LU's module"); 
		
		x = 4'b0011; y = 4'b0101; z = 0;
		
		// --projetar testes do modulo 
		#1 $display("\n%3b  %3b %3b = %3b %3b",x,y,z,s1,s2); 
		
	end
endmodule // test_f4 