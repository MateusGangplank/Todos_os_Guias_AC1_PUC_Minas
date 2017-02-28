// ------------------------- 
// Exemplo0011 - BASE 
// Nome: Andre Henriques Fernandes 
// Matricula: 427386 
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [3:0] s, 
                    input  [3:0] a, 
                    input  [3:0] b); 
 
// descrever por portas 
 
endmodule // f4 

module andgate (output [3:0] s, input [3:0] a, input [3:0] b);
	assign s = a & b;
endmodule

module orgate (output [3:0] s, input [3:0] a, input [3:0] b);
	assign s = a | b;
endmodule

module notgate (output [3:0] s, input [3:0] a);
	assign s = ~a;
endmodule

module exemplo32;
	reg [3:0] a;
	reg [3:0] b;
	reg [3:0] chave;
	wire [3:0] s1;
	wire [3:0] s2;
	wire [3:0] s3;
	wire [3:0] s4;
	wire [3:0] s5;
	
	andgate AND1 (s1,a,b);
	orgate OR1 (s2,a,b);
	notgate NOT1 (s5, chave);
	andgate AND2 (s3,s5,s1);
	andgate AND3 (s4,chave,s2);
	
	initial begin
	 
      $display("Exemplo0032 - Andre Henriques Fernandes - 427386"); 
      $display("Test LU's module"); 
		
 		$display("a     b  chave AND OR");
		
		$monitor("%4b %4b %4b %4b %4b",a,b,chave,s3,s4);
		
      a = 4'b0000; b = 4'b0000; chave=4'b0000;
 
   #1 a = 4'b0001; b = 4'b1010; chave=4'b1010; 
			
	#1 a = 4'b0010; b = 4'b1001; chave=4'b1100; 
	
	#1 a = 4'b0011; b = 4'b1000; chave=4'b0011;
	 
	#1 a = 4'b0100; b = 4'b0111; chave=4'b1001;
	
	#1 a = 4'b0101; b = 4'b0110; chave=4'b0100; 
	
	#1 a = 4'b0110; b = 4'b0101; chave=4'b0010;
	
	#1 a = 4'b0111; b = 4'b0100; chave=4'b1111; 
	
	#1 a = 4'b1000; b = 4'b0011; chave=4'b1101; 
	
	#1 a = 4'b1001; b = 4'b0010; chave=4'b1110;
	
	#1 a = 4'b1010; b = 4'b0001; chave=4'b1011;
	
 
   end 
 
endmodule // test_f4

