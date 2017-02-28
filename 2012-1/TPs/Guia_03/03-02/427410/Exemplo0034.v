// -------------------------
//  Exemplo0034
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------

	module f4 (output [1:0] s, input [1:0] a, input [1:0] b, input [1:0] chave);

	wire And1[1:0];
	wire And2[1:0];
	wire And3[1:0];
	wire And4[1:0];
	wire Not1[1:0];
	wire Not2[1:0];
	wire Xnor1[1:0];
	wire Xor1[1:0];
	wire Nor1[1:0];
	wire Or1[1:0];
	wire Or2[1:0];

	and ANDa(And1[0], chave[0], chave[1], Xnor1[0]);
	and ANDb(And1[1], chave[0], chave[1], Xnor1[1]);
 	and ANDc(And2[0], chave[0], Not2[0], Xor1[0]);
 	and ANDd(And2[1], chave[0], Not2[1], Xor1[1]);
 	and ANDe(And3[0], Not1[0], chave[1] , Nor1[0]);
 	and ANDf(And3[1], Not1[1], chave[1] , Nor1[1]);
 	and ANDg(And4[0], Not1[0], Not2[0], Or1[0]);
 	and ANDh(And4[1], Not1[1], Not2[1], Or1[1]);
 
 	or ORa(Or1[0], a[0], b[0]);
 	or ORb(Or1[1], a[1], b[1]);
 	or ORc(s[0], And2[0], And3[0], And4[0], And5[0]);
 	or ORd(s[1], And2[1], And3[1], And4[1], And5[1]);
	 
 	xnor XNORa(Xnor1[0], a[0], b[0]);
 	xnor XNORb(Xnor1[1], a[1], b[1]);
	 
 	xor XORa(Xor1[0], a[0], b[0]);
 	xor XORb(Xor1[1], a[1], b[1]);
	 
 	nor NORa(Nor1[0], a[0], b[0]);
	nor NORb(Nor1[1], a[1], b[1]);
 
 	not NOTa(Not1[0], chave[0]);
 	not NOTb(Not1[1], chave[0]);
 	not NOTc(Not2[0], chave2[1]);
 	not NOTd(Not2[1], chave[0]);
        
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
	$display("Exemplo0034 - Gustavo Barbosa - 427410");
	$display("Test");
	
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
 endmodule 