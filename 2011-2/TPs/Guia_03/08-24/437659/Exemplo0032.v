// ------------------------- 
// Exemplo0032 - F4 
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

module questao2 (	  output [3:0] s1,
						  output [3:0] s2,
						  output [3:0] s,
						  input  [3:0] a, 
                    input  [3:0] b,
						  input c ); 
       reg  [3:0] x;
		 reg  [3:0] y; 
       wire [3:0] z;
		 wire  [3:0] w; 
 f4 modulo (z, w, a, b);
  
// and com a saida da and e a chave seletora
and and1(s1[0],z[0],c); 
and and2(s1[1],z[1],c);
and and3(s1[2],z[2],c);
and and4(s1[3],z[3],c);

// and com a saida da or e a chave seletora negada
and and1(s2[0],w[0],~c); 
and and2(s2[1],w[1],~c);
and and3(s2[2],w[2],~c);
and and4(s2[3],w[3],~c);

// or das saidas
or or1(s[0],s1[0],s2[0]); 
or or2(s[1],s1[1],s2[1]);
or or3(s[2],s1[2],s2[2]);
or or4(s[3],s1[3],s2[3]);
endmodule // questao2 

 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x;
		 reg  [3:0] y; 
		 reg  c;
       wire [3:0] z; 
		 wire [3:0] p;
		 wire [3:0] r;

 
       questao2 modulo (z,p,r,x,y,c); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0032 - Debora Amaral - 437659"); 
      $display("Test LU's module"); 
 
   #1   x = 4'b0011;  y = 4'b0101; c = 1;
 
   // projetar testes do modulo
	#1 $display("x     y    c   saída");  
	#1 $display("%3b %3b %3b %3b",x,y,c,r);
	#1 x = 4'b0011;       y = 4'b0101; c = 0;
   #1 $display("%3b %3b %3b %3b",x,y,c,r);
	#1 x = 4'b1111;       y = 4'b1011; c = 1;
	#1 $display("%3b %3b %3b %3b",x,y,c,r);
	#1 x = 4'b0000;       y = 4'b1111; c = 0;
	#1 $display("%3b %3b %3b %3b",x,y,c,r); 
 
   end 
 
endmodule // test_f4  Exemplo0032