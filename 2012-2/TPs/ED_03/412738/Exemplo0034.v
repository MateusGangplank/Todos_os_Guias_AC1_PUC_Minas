// ------------------------------------------------------------ 
// Exemplo0034 - F4
// Nome: Felipe Torres
// Matricula: 412738
	
// ------------------------------------------------------------- 
// f4_gate 
// ------------------------------------------------------------- 
	
	module f4 (output s, input a, input b, input [1:0] chave);

	wire S_And1;
	wire S_And2;
	wire S_And3;
	wire S_And4;
	wire S_Not1;
	wire S_Not2;
	wire S_Xnor1;
	wire S_Xor1;
	wire S_Nor1;
	wire S_Or1;

	// ----------------------- declarando as variaveis -------------------------
	
	and ANDa(S_And1, chave[0], chave[1], S_Xnor1);
 	and ANDb(S_And2, chave[0], S_Not2, S_Xor1);
 	and ANDc(S_And3, S_Not1, chave[1] , S_Nor1);
 	and ANDd(S_And4, S_Not1, S_Not2, S_Or1);
 
 	or ORa(S_Or1, a, b);
 	or ORd(s, S_And1, S_And2, S_And3, S_And4);

 	xnor XNORa(S_Xnor1, a, b);

	xor XORa(S_Xor1, a, b);
	 
 	nor NORa(S_Nor1, a, b);
 
 	not NOTa(S_Not1, chave[0]);
 	not NOTb(S_Not2, chave[1]);
        
	endmodule // f4
	
 module test_f4; 
 // ------------------------- definindo os dados ----------------------------- 
 reg x; 
 reg y; 
 reg [1:0] ch;
 wire s; 
 
 f4 modulo (s, x, y, ch);
 
initial begin 

	//----------------------- identificador -----------------------------------
	$display("Exemplo0034 - Felipe Torres - 412738"); 
	$display("Test LU's module"); 

	#1 x = 0; y = 0; ch = 00; 
	$monitor("Resultado chave = %2b\n x = %1b \t y = %1b \t Resultado -> %1b\n", ch, x, y, s);
   #1 x = 0; y = 1; ch = 10;  
   #1 x = 0; y = 0; ch = 11;
   #1 x = 1; y = 1; ch = 01; 
	#1 x = 1; y = 0; ch = 11;
   #1 x = 1; y = 1; ch = 10; 

 end 
 endmodule // test_f4