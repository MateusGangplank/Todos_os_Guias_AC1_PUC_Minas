// --------------------- 
// Exercicio0033
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output s0, output s1, input a, input b, input chave); 
	wire s2; 
	wire s3; 
	wire s4;
	wire s5;
	wire notchave;
	
	not(notchave, chave);
	or or1(s2, a, b);
	and and1(s3, a, b);
	nand nand1(s4, a, b);
	nor nor1(s5, a, b);

	assign s0 = chave? s2 : s4;
	assign s1 = chave? s3 : s5;

endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg x; 
       reg y; 
       wire z; 
		 wire w;
		 reg chave;
 
       f4 modulo (z, w, x, y, chave); 
 
// ------------------------- parte principal 
 
   initial begin 
         $display("Exemplo0033 - Marcio Enio G Dutra Junior - 441698"); 
         $display("Test LU's module"); 
			
			  chave = 1;
           x = 1'b0;       y = 1'b0; 
 
   // projetar testes do modulo 
   #1   $monitor("%3b %3b = %3b e %3b \tChave = %3b",x,y,z,w,chave); 
	#1	  chave = 0; 
	#1   x = 1'b0;  y = 1'b1; 
	#1	  chave = 1; 
	#1   x = 1'b1;  y = 1'b0;
	#1	  chave = 0; 
	#1   x = 1'b1;  y = 1'b1;
	#1	  chave = 1; 
 
   end 
 
endmodule // test_f4