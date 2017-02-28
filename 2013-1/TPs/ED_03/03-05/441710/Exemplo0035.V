// ---------------------
// Exercicio0035
// Nome: Thais Mairink 
// Matricula: 441710
// --------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output s, input a, input b, input chave1, input chave2, input chave3); 
	wire s0; 
	wire s1; 
	wire s2;
	wire s3;
	wire s4;
	wire s5;
	wire s6;
	
	not(s0, a);
	or or1(s1, a, b);
	nor nor1(s2, a, b);
	and and1(s3, a, b);
	nand nand1(s4, a, b);
	xor xor1(s5, a, b);
	xnor xnor1(s6, a, b);

	assign s = (~chave1 & ~chave2 & ~chave3)? s0:(~chave1 & ~chave2 & chave3)? s1:(~chave1 & chave2 & ~chave3)? s2:
	(~chave1 & chave2 & chave3)? s3:(chave1 & ~chave2 & ~chave3)? s4: (chave1 & ~chave2 & chave3)? s5: 
	(chave1 & chave2 & ~chave3)? s6 : 0;	
endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg x; 
       reg y; 
       wire z; 
		 reg chave1, chave2, chave3;
 
       f4 modulo (z, x, y, chave1, chave2, chave3); 
 
// ------------------------- parte principal 
 
   initial begin 
         $display("Exemplo0035 - Thais Mairink - 441710"); 
         $display("Test LU's module"); 
			
				  chave1 = 0; chave2 = 0; chave3 = 0;
           x = 1'b0;       y = 1'b0; 
 
   // projetar testes do modulo 
		  $display("NOT X");
		  $monitor("X    Y");
   #1   $monitor("%3b %3b = %3b \tChave %3b",x,y,z,chave1,chave2,chave3); 
	#1   x = 1'b0;  y = 1'b1; 
	#1   x = 1'b1;  y = 1'b0;
	#1   x = 1'b1;  y = 1'b1;
		  $display("OR");
	chave1 = 0; chave2 = 0; chave3 = 1;
	#1   x = 1'b0;  y = 1'b0;
	#1   x = 1'b0;  y = 1'b1; 
	#1   x = 1'b1;  y = 1'b0;
	#1   x = 1'b1;  y = 1'b1;
		  $display("NOR");
	chave1 = 0; chave2 = 1; chave3 = 0;
	#1   x = 1'b0;  y = 1'b0;
	#1   x = 1'b0;  y = 1'b1; 
	#1   x = 1'b1;  y = 1'b0;
	#1   x = 1'b1;  y = 1'b1;
		  $display("AND");
	chave1 = 0; chave2 = 1; chave3 = 1;
	#1   x = 1'b0;  y = 1'b0;
	#1   x = 1'b0;  y = 1'b1; 
	#1   x = 1'b1;  y = 1'b0;
	#1   x = 1'b1;  y = 1'b1;
		  $display("NAND");
	chave1 = 1; chave2 = 0; chave3 = 0;
	#1   x = 1'b0;  y = 1'b0;
	#1   x = 1'b0;  y = 1'b1; 
	#1   x = 1'b1;  y = 1'b0;
	#1   x = 1'b1;  y = 1'b1;
		  $display("XOR");
	chave1 = 1; chave2 = 0; chave3 = 1;
	#1   x = 1'b0;  y = 1'b0;
	#1   x = 1'b0;  y = 1'b1; 
	#1   x = 1'b1;  y = 1'b0;
	#1   x = 1'b1;  y = 1'b1;
		  $display("XNOR");
	chave1 = 1; chave2 = 1; chave3 = 0;
	#1   x = 1'b0;  y = 1'b0;
	#1   x = 1'b0;  y = 1'b1; 
	#1   x = 1'b1;  y = 1'b0;
	#1   x = 1'b1;  y = 1'b1;
 
   end 
 
endmodule // test_f4