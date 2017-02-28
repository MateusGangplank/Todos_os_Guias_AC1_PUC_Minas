// --------------------------------------------------------------- 
// Exemplo0032 - F4 
// Nome: Felipe Torres 
// Matricula: 412738
// --------------------------------------------------------------- 
// --------------------------------------------------------------- 
// f4_gate 
// ---------------------------------------------------------------  
 
 module f4 (output s, input a, input  b, input chave); 
 	 
	 //descrever por portas
	 wire saidaAnd;
	 wire saidaOr;
	 wire [1:0] saida;
	 wire saidaNot;
 
	 and AND1(saidaAnd, a, b);
	 or OR1(saidaOr, a, b);
	 
	 and AND2(saida[0], saidaAnd, chave);
	 
	 and AND3(saida[1], saidaOr, saidaNot);
	 	 
	 not NOT1(saidaNot, chave);
	 
	 or OR2(s, saida[0], saida[1]);
 
 endmodule // f4
 
 module test_f4; 
 // ------------------------- definir dados -----------------------------------------
 reg x; 
 reg y; 
 reg ch;
 wire s; 
 
 f4 modulo (s, x, y, ch);
 
initial begin 

	//----------------------- identificador -------------------------------------------- 
	$display("Exemplo0032 - Felipe Torres - 412738"); 
	$display("Test LU's module"); 
	
	#1 x = 0; y = 0; ch = 0; 
	$monitor("Resultado chave = %1b\n x = %1b \t y = %1b \t Resultado -> %1b\n", ch, x, y, s);
   #1 x = 0; y = 1; ch = 1;  
   #1 x = 1; y = 0; ch = 0;
   #1 x = 1; y = 1; ch = 1; 

 end 
 endmodule // test_f4