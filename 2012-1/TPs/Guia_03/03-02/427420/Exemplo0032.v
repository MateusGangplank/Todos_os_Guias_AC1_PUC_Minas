// ------------------------- 
// Exemplo0032 - F4 
// Nome: Jenifer Henrique Moreira Borges 
// Matricula: 427420
// ------------------------- 
// ------------------------- 
// f4_gate 
// -------------------------  
 
 module f4 (output [1:0] s, input [1:0] a, input [1:0] b, input chave); 
 	 
	 //descrever por portas
	 wire [1:0] saidaAnd;
	 wire [1:0] saidaOr;
	 wire [3:0] saida;
	 wire saidaNot;
 
	 and AND1(saidaAnd[0], a[0], b[0]);
	 and AND2(saidaAnd[1], a[1], b[1]);
	 
	 or OR1(saidaOr[0], a[0], b[0]);
	 or OR2(saidaOr[1], a[1], b[1]);
	 
	 and AND3(saida[0], saidaAnd[0], chave);
	 and AND4(saida[1], saidaAnd[1], chave);
	 
	 and AND5(saida[2], saidaOr[0], saidaNot);
	 and AND6(saida[3], saidaOr[1], saidaNot);
	 
	 not NOT1(saidaNot, chave);
	 
	 or OR5(s[0], saida[0], saida[2]);
	 or OR6(s[1], saida[1], saida[3]);
 
 endmodule // f4
 
 module test_f4; 
 // ------------------------- definir dados 
 reg [1:0] x; 
 reg [1:0] y; 
 reg ch;
 wire [1:0] s; 
 
 f4 modulo (s, x, y, ch);
 
initial begin 

	//----------------------- identificar
	$display("Exemplo0032 - Jenifer Henrique - 427420"); 
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