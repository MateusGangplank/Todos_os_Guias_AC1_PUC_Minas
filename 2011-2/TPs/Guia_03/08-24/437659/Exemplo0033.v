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

module questao3 (	  output [3:0] s1,
						  output [3:0] s2_nor,
						  output [3:0] s3_nand,
						  output [3:0] s4,
						  output [3:0] s5,
						  output [3:0] s6,
						  output [3:0] s7,
						  output [3:0] saida1,
						  output [3:0] saida2,
						  input  [3:0] a, 
                    input  [3:0] b,
						  input c ); 
       reg  [3:0] x;
		 reg  [3:0] y; 
       wire [3:0] z;
		 wire  [3:0] w; 
 f4 modulo (z, w, a, b);
 
 // not de or = NOR
not nor1(s2_nor[0],w[0]);
not nor2(s2_nor[1],w[1]);
not nor3(s2_nor[2],w[2]);
not nor4(s2_nor[3],w[3]);

//not de and = NAND
not nand1(s3_nand[0],z[0]);
not nand2(s3_nand[1],z[1]);
not nand3(s3_nand[2],z[2]);
not nand4(s3_nand[3],z[3]);
  
// and com a saida da and e a chave seletora
and and1(s1[0],z[0],~c); 
and and2(s1[1],z[1],~c);
and and3(s1[2],z[2],~c);
and and4(s1[3],z[3],~c);

// and com a saida da or e a chave seletora negada
and and1(s4[0],w[0],~c); 
and and2(s4[1],w[1],~c);
and and3(s4[2],w[2],~c);
and and4(s4[3],w[3],~c);

// and com a saida da nor e a chave seletora
and and1(s5[0],s2_nor[0],c); 
and and2(s5[1],s2_nor[1],c);
and and3(s5[2],s2_nor[2],c);
and and4(s5[3],s2_nor[3],c);

// and com a saida da nand e a chave seletora
and and1(s6[0],s3_nand[0],c); 
and and2(s6[1],s3_nand[1],c);
and and3(s6[2],s3_nand[2],c);
and and4(s6[3],s3_nand[3],c);

// or das saidas
or or1(saida1[0],s1[0],s5[0]); 
or or2(saida1[1],s1[1],s5[1]);
or or3(saida1[2],s1[2],s5[2]);
or or4(saida1[3],s1[3],s5[3]);

// or das saidas
or or1(saida2[0],s4[0],s6[0]); 
or or2(saida2[1],s4[1],s6[1]);
or or3(saida2[2],s4[2],s6[2]);
or or4(saida2[3],s4[3],s6[3]);
endmodule // questao2 

 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x;
		 reg  [3:0] y; 
		 reg  c;
       wire [3:0] z; 
		 wire [3:0] p;
		 wire [3:0] r;
		 wire [3:0] t; 
		 wire [3:0] u;
		 wire [3:0] v;
		 wire [3:0] f; 
		 wire [3:0] g;
		 wire [3:0] h;

 
       questao3 modulo (z,p,r,t,u,v,f,g,h,x,y,c); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0033 - Debora Amaral - 437659"); 
      $display("Test LU's module"); 
 
   #1   x = 4'b0011;  y = 4'b0101; c = 1;
 
   // projetar testes do modulo
	#1 $display("x     y    c   saída(0-OR e AND) ou  saida(1-NAND e NOR)");  
	#1 $display("%4b %4b %4b %4b %4b ",x,y,c,g,h);
	#1 x = 4'b0011;       y = 4'b0101; c = 0;
   #1 $display("%4b %4b %4b %4b %4b",x,y,c,r,g,h);
	#1 x = 4'b1111;       y = 4'b1011; c = 1;
	#1 $display("%4b %4b %4b %4b %4b",x,y,c,r,g,h);
	#1 x = 4'b0000;       y = 4'b1111; c = 0;
	#1 $display("%4b %4b %4b %4b %4b",x,y,c,r,g,h); 
 
 //Apresentou resultados estranhos na nor e nand.
 
   end 
 
endmodule // test_f4  Exemplo0033