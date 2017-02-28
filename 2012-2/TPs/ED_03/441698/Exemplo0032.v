// --------------------- 
// Exercicio0032
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output s, input a, input b, input chave); 
	wire s0; 
	wire s1; 
	wire notchave;
	
	not(notchave, chave);
	or or1(s0, a, b);
	
	and and1(s1, a, b);

	assign s = chave? s0: s1;

endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg x; 
       reg y; 
       wire z; 
		 reg chave;
 
       f4 modulo (z, x, y, chave); 
 
// ------------------------- parte principal 
 
   initial begin 
         $display("Exemplo0032 - Marcio Enio G Dutra Junior - 441698"); 
         $display("Test LU's module"); 
			
			  chave = 1;
           x = 1'b0;       y = 1'b0; 
 
   // projetar testes do modulo 
   #1   $monitor("%3b %3b = %3b \tChave = %3b",x,y,z,chave); 
	#1	  chave = 0; 
	#1   x = 1'b0;  y = 1'b1; 
	#1	  chave = 1; 
	#1   x = 1'b1;  y = 1'b0;
	#1	  chave = 0; 
	#1   x = 1'b1;  y = 1'b1;
	#1	  chave = 1; 
 
   end 
 
endmodule // test_f4