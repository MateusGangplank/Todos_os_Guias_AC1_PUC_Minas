// ------------------------- 
// Exemplo0033 - F4 
// Nome: Debora Amaral Chaves
// Matricula: 437659 
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [3:0] s, output [3:0] s2 , 
                    input  [3:0] a, 
                    input  [3:0] b); 
 
and and1(s[0],a[0],b[0]);
and and2(s[1],a[1],b[1]);
and and3(s[2],a[2],b[2]);
and and4(s[3],a[3],b[3]);

or or1(s2[0],a[0],b[0]);
or or2(s2[1],a[1],b[1]);
or or3(s2[2],a[2],b[2]);
or or4(s2[3],a[3],b[3]);
 
 
endmodule // f4 

module questao3 (	  output [3:0] s_and,
						  output [3:0] s_nor,
						  output [3:0] s_or,
						  output [3:0] s_nand,
						  output [3:0] s_xor,
						  output [3:0] s_xnor,
						  output [3:0] s_notA,
						  output [3:0] s_notB,
						  input  [3:0] a, 
                    input  [3:0] b ); 
       reg  [3:0] x;
		 reg  [3:0] y; 
       wire [3:0] saida_and;
		 wire  [3:0] saida_or; 
 f4 modulo (saida_and, saida_or, a, b);
 
 // not das entrada A
not not1(s_notA[0],a[0]);
not not2(s_notA[1],a[1]);
not not3(s_notA[2],a[2]);
not not4(s_notA[3],a[3]);

 // not das entrada B
not not5(s_notB[0],b[0]);
not not6(s_notB[1],b[1]);
not not7(s_notB[2],b[2]);
not not8(s_notB[3],b[3]);

//not de and = NAND
not nand1(s_nand[0],saida_and[0]);
not nand2(s_nand[1],saida_and[1]);
not nand3(s_nand[2],saida_and[2]);
not nand4(s_nand[3],saida_and[3]);


// or das saidas
not nor1(s_nor[0],saida_or[0]); 
not nor2(s_nor[1],saida_or[1]);
not nor3(s_nor[2],saida_or[2]);
not nor4(s_nor[3],saida_or[3]);

// xor das saidas
xor xor1(s_xor[0],a[0],b[0]); 
xor xor2(s_xor[1],a[1],b[1]);
xor xor3(s_xor[2],a[2],b[2]);
xor xor4(s_xor[3],a[3],b[3]);

// xnor das saidas
not xnor1(s_xnor[0],saida_xor[0]); 
not xnor2(s_xnor[1],saida_xor[1]);
not xnor3(s_xnor[2],saida_xor[2]);
not xnor4(s_xnor[3],saida_xor[3]);
endmodule // questao2 

 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x;
		 reg  [3:0] y; 
       wire [3:0] z; 
		 wire [3:0] p;
		 wire [3:0] r;
		 wire [3:0] t; 
		 wire [3:0] u;
		 wire [3:0] v;
		 wire [3:0] f; 
		 wire [3:0] g;

 
       questao3 modulo (z,p,r,t,u,v,f,g,x,y); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0033 - Debora Amaral - 437659"); 
      $display("Test LU's module"); 
 
   #1   x = 4'b0011;  y = 4'b0101;
 
   // projetar testes do modulo
	#1 $display("x     y    AND NOR OR NAND XOR XNOR NOT(x) NOT(y)");  
	#1 $display("%4b %4b %4b %4b %4b 4b %4b %4b %4b %4b",x,y,z,p,r,t,u,v,f,g);
	#1 x = 4'b0011;       y = 4'b0101; 
   #1 $display("%4b %4b %4b %4b %4b 4b %4b %4b %4b %4b",x,y,z,p,r,t,u,v,f,g);
	#1 x = 4'b1111;       y = 4'b1011; 
	#1 $display("%4b %4b %4b %4b %4b 4b %4b %4b %4b %4b",x,y,z,p,r,t,u,v,f,g);
	#1 x = 4'b0000;       y = 4'b1111; 
	#1 $display("%4b %4b %4b %4b %4b 4b %4b %4b %4b %4b",x,y,z,p,r,t,u,v,f,g); 
 
 //Apresentou resultados estranhos na nor e nand.
 
   end 
 
endmodule // test_f4  Exemplo0033