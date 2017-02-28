// ------------------------- 
// Exemplo0034 - F4
// Nome: Rayan Darwin
// Matricula: 412770
	
// ------------------------- 
// f4_gate 
// ------------------------- 
	
	module f4 (output [1:0] s, input [1:0] a, input [1:0] b, input [1:0] chave);

	wire S_And1[1:0];
	wire S_And2[1:0];
	wire S_And3[1:0];
	wire S_And4[1:0];
	wire S_Not1[1:0];
	wire S_Not2[1:0];
	wire S_Xnor1[1:0];
	wire S_Xor1[1:0];
	wire S_Nor1[1:0];
	wire S_Or1[1:0];
	wire S_Or2[1:0];

	and ANDa(S_And1[0], chave[0], chave[1], S_Xnor1[0]);
	and ANDb(S_And1[1], chave[0], chave[1], S_Xnor1[1]);
 	and ANDc(S_And2[0], chave[0], S_Not2[0], S_Xor1[0]);
 	and ANDd(S_And2[1], chave[0], S_Not2[1], S_Xor1[1]);
 	and ANDe(S_And3[0], S_Not1[0], chave[1] , S_Nor1[0]);
 	and ANDf(S_And3[1], S_Not1[1], chave[1] , S_Nor1[1]);
 	and ANDg(S_And4[0], S_Not1[0], S_Not2[0], S_Or1[0]);
 	and ANDh(S_And4[1], S_Not1[1], S_Not2[1], S_Or1[1]);
 
 	or ORa(S_Or1[0], a[0], b[0]);
 	or ORb(S_Or1[1], a[1], b[1]);
 	or ORc(s[0], S_And2[0], S_And3[0], S_And4[0], S_And5[0]);
 	or ORd(s[1], S_And2[1], S_And3[1], S_And4[1], S_And5[1]);
	 
 	xnor XNORa(S_Xnor1[0], a[0], b[0]);
 	xnor XNORb(S_Xnor1[1], a[1], b[1]);
	 
 	xor XORa(S_Xor1[0], a[0], b[0]);
 	xor XORb(S_Xor1[1], a[1], b[1]);
	 
 	nor NORa(S_Nor1[0], a[0], b[0]);
	nor NORb(S_Nor1[1], a[1], b[1]);
 
 	not NOTa(S_Not1[0], chave[0]);
 	not NOTb(S_Not1[1], chave[0]);
 	not NOTc(S_Not2[0], chave2[1]);
 	not NOTd(S_Not2[1], chave[0]);
        
	endmodule // f4
	
 module test_f4; 
 // ------------------------- definir dados 
 reg [1:0] x; 
 reg [1:0] y; 
 reg [1:0] ch;
 wire [1:0] s; 
 
 f4 modulo (s, x, y, ch);
 
initial begin 

	//----------------------- identificar
	$display("Exemplo0034 - Rayan Darwin - 412770"); 
	$display("Test LU's module"); 
	
	$monitor("Resultado chave = %1b\n x = %2b \t y = %2b \t Resultado -> %2b\n", ch, x, y, s);
	#1 x = 2'b01; y = 2'b10; ch = 0; 
   #1 x = 2'b01; y = 2'b10; ch = 1;  
   #1 x = 2'b11; y = 2'b00; ch = 0;
   #1 x = 2'b11; y = 2'b00; ch = 1; 
	#1 x = 2'b01; y = 2'b00; ch = 0;
   #1 x = 2'b01; y = 2'b00; ch = 1; 
   #1 x = 2'b10; y = 2'b10; ch = 0;
   #1 x = 2'b10; y = 2'b10; ch = 1;   

 end 
 endmodule // test_f4