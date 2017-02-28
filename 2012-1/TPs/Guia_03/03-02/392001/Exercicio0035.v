// -------------------------
// Exemplo0035 - F4
// Nome: Flavio Andrade Amaral Motta
// Matricula: 392001
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output s, input a, input b, input chave, input chave2, input chave3);

wire s_not1p;
wire s_or1;
wire s_nor1;
wire s_and1p;
wire s_nand1;
wire s_xor1;
wire s_xnor1;

wire s_and2;
wire s_and3;
wire s_and4;
wire s_and5;
wire s_and6;
wire s_and7;
wire s_and8;
wire s_not2;
wire s_not3;
wire s_not4;
wire s_or2;



	and AND2(s_and2, s_not2, s_not3, s_not4, s_not1p);
	and AND3(s_and3, s_not2, s_not3, chave3, s_or1);
	and AND4(s_and4, s_not2, chave2, s_not4, s_nor1);
	and AND5(s_and5, s_not2, chave2, chave3, s_and1p);
	and AND6(s_and6, chave, s_not3, s_not4, s_nand1);
	and AND7(s_and7, chave, s_not3, chave3, s_xor1);
	and AND8(s_and8, chave, chave2, s_not4, s_xnor1);
	
	not NOT1(s_not1p, a);
	or OR1(s_or1, a, b);
	nor NOR1(s_nor1, a, b);
	and AND1(s_and1p, a, b);
	nand NAND1(s_nand1p, a, b);
	xor XOR1(s_xor1, a, b);
	xnor XNOR1(s_xnor1, a, b);
	
	not NOT2(s_not2, chave);
	not NOT3(s_not3, chave2);
	not NOT4(s_not4, chave3);
	
	or OR2(s, s_and2, s_and3, s_and4, s_and5, s_and6, s_and7, s_and8);
						  
// descrever por portas
endmodule // f4
module test_f4;
// ------------------------- definir dados
 reg x; 
 reg y; 
 reg c;
 reg c2;
 reg c3;
 wire s; 
 
 f4 modulo (s, x, y, c, c2, c3);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0035 - Flavio A A Motta - 392001");
      $display("Test LU's module");
		
#1 x = 2'b00; y = 2'b01; c = 1;

   // projetar testes do modulo
#1 $monitor("%4b %4b %4b",x,y,s,c);

#1 x = 2'b10; y = 2'b10; c = 0;
#1 x = 2'b01; y = 2'b00; c = 0;
#1 x = 2'b01; y = 2'b00; c = 1;

end
endmodule // test_f4