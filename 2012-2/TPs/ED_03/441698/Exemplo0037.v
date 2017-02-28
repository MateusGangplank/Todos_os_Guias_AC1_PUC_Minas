// ---------------------
// Exercicio0037
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output[1:0] s, input[1:0] a, input[1:0] b, input chave); 
	wire[1:0] s0; 
	wire[1:0] s1; 
	
	and and1(s0[0], ~a[0], b[0]);
	and and2(s0[1], ~a[1], b[1]);
	and and3(s1[0], a[0], ~b[0]);
	and and4(s1[1], a[1], ~b[1]);

	assign s = (chave)? s1: s0;              // usar apenas portas
	

endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg[1:0] x; 
       reg[1:0] y; 
       wire[1:0] z; 
		 reg chave;
 
       f4 modulo (z, x, y, chave); 
 
// ------------------------- parte principal 
 
   initial begin 
         $display("Exemplo0037 - Marcio Enio G Dutra Junior - 441698"); 
         $display("Test LU's module"); 
			
			  chave = 0;
           x = 2'b00;       y = 2'b00; 
 
   // projetar testes do modulo 
   #1   $monitor("%3b %3b = %3b \tChave = %3b",x,y,z,chave); 
	#1   x = 2'b00;  y = 2'b01; 
	#1   x = 2'b00;  y = 2'b10; 
	#1   x = 2'b00;  y = 2'b11; 
	#1   x = 2'b01;  y = 2'b00; 
	#1   x = 2'b01;  y = 2'b01; 
	#1   x = 2'b01;  y = 2'b10; 
	#1   x = 2'b01;  y = 2'b11;
	#1   x = 2'b10;  y = 2'b00; 
	#1   x = 2'b10;  y = 2'b01; 
	#1   x = 2'b10;  y = 2'b10; 
	#1   x = 2'b10;  y = 2'b11;
	#1   x = 2'b11;  y = 2'b00; 
	#1   x = 2'b11;  y = 2'b01; 
	#1   x = 2'b11;  y = 2'b10; 
	#1   x = 2'b11;  y = 2'b11;
	#1   x = 2'b00;  y = 2'b00;
	#1	  chave = 1;
		  $display("");
	#1   x = 2'b00;  y = 2'b01; 
	#1   x = 2'b00;  y = 2'b10; 
	#1   x = 2'b00;  y = 2'b11; 
	#1   x = 2'b01;  y = 2'b00; 
	#1   x = 2'b01;  y = 2'b01; 
	#1   x = 2'b01;  y = 2'b10; 
	#1   x = 2'b01;  y = 2'b11;
	#1   x = 2'b10;  y = 2'b00; 
	#1   x = 2'b10;  y = 2'b01; 
	#1   x = 2'b10;  y = 2'b10; 
	#1   x = 2'b10;  y = 2'b11;
	#1   x = 2'b11;  y = 2'b00; 
	#1   x = 2'b11;  y = 2'b01; 
	#1   x = 2'b11;  y = 2'b10; 
	#1   x = 2'b11;  y = 2'b11;
 
   end 
 
endmodule // test_f4