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

module xorgate (output [3:0] s, input [3:0] a, input [3:0] b);
	assign s = a ^ b;
endmodule

module xnorgate (output [3:0] s, input [3:0] a, input [3:0] b);
	assign s = ~(a ^ b);
endmodule

module orgate (output [3:0] s, input [3:0] a, input [3:0] b);
	assign s = a | b;
endmodule

module norgate (output [3:0] s, input [3:0] a, input [3:0] b);
	assign s = ~(a | b);
endmodule

module notgate (output [3:0] s, input [3:0] a);
	assign s = ~a;
endmodule

module andgate (output [3:0] s, input [3:0] a, input [3:0] b);
	assign s = a & b;
endmodule

module exemplo32;
	reg [3:0] a;
	reg [3:0] b;
	reg [3:0] chave;
	wire [3:0] s1;
	wire [3:0] s2;
	wire [3:0] s3;
	wire [3:0] s4;
	wire [3:0] w1;
	wire [3:0] w2;
	wire [3:0] w3;
	wire [3:0] w4;
	wire [3:0] w5;
	wire [3:0] w6;
	
	xnorgate XNOR1 (w1,a,b);
	xorgate XOR1 (w2,a,b);
	orgate OR1 (w3,a,b);
	norgate NOR1 (w4,a,b);
	notgate NOT1 (w5, chave);
	notgate NOT2 (w6, chave);
	andgate AND1 (s1,chave,w1);
	andgate AND2 (s2,chave,w2);
	andgate AND3 (s3,w5,w3);
	andgate AND4 (s4,w6,w4);
	
	initial begin
	 
      $display("Exemplo0032 - Andre Henriques Fernandes - 427386"); 
      $display("Test LU's module"); 
		
 		$display("a     b  chave XNOR XOR  OR   NOR");
		
		$monitor("%4b %4b %4b %4b %4b %4b %4b",a,b,chave,s1,s2,s3,s4);
		
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

