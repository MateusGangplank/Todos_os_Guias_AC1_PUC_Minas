// ------------------------- 
// Exemplo0033 - F4 
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s, output[3:0] s2, 
input [3:0] a,
input [3:0] b);


and a1(s[0],a[0],b[0]); 
and a1(s[1],a[1],b[1]);	
and a1(s[2],a[2],b[2]);
and a1(s[3],a[3],b[3]);

or o1(s2[0],a[0],b[0]);
or o1(s2[1],a[1],b[1]);
or o1(s2[2],a[2],b[2]);
or o1(s2[3],a[3],b[3]);

endmodule // f4 

module exemplo0033(output [3:0] s1,
						 output [3:0] s2_nor, 
						 output [3:0] s3_nand, 
						 output [3:0] s4,
						 output [3:0] s5, 
						 output [3:0] s6, 
						 output [3:0] s7,
						 output [3:0] saida1,
						 output [3:0] saida2,
						 input [3:0] a, 
						 input [3:0] b, 
						 input chave);
reg [3:0] x;
reg [3:0] y;
wire [3:0] z;
wire [3:0] w;

f4 modulo(z, w, a, b);


not nor1(s2_nor[0],w[0]);
not nor1(s2_nor[1],w[1]);
not nor1(s2_nor[2],w[2]);
not nor1(s2_nor[3],w[3]);


not nand1(s3_nand[0],z[0]);
not nand2(s3_nand[1],z[1]);
not nand3(s3_nand[2],z[2]);
not nand4(s3_nand[3],z[3]);


and a1(s1[0],z[0],~chave);
and a2(s1[1],z[1],~chave);
and a3(s1[2],z[2],~chave);
and a4(s1[3],z[3],~chave);

and a1(s4[0],w[0],~chave);
and a2(s4[1],w[1],~chave);
and a3(s4[2],w[2],~chave);
and a4(s4[3],w[3],~chave);

and a1(s5[0],s2_nor[0],chave);
and a2(s5[1],s2_nor[1],chave);
and a3(s5[2],s2_nor[2],chave);
and a4(s5[3],s2_nor[3],chave);

and a1(s6[0],s3_nand[0],chave);
and a2(s6[1],s3_nand[1],chave);
and a3(s6[2],s3_nand[2],chave);
and a4(s6[3],s3_nand[3],chave);

or o1(saida1[0],s1[0],s5[0]); 
or o2(saida1[1],s1[1],s5[1]);
or o3(saida1[2],s1[2],s5[2]);
or o4(saida1[3],s1[3],s5[3]);

or o1(saida2[0],s4[0],s6[0]);
or o2(saida2[1],s4[1],s6[1]);
or o3(saida2[2],s4[2],s6[2]);
or o4(saida2[3],s4[3],s6[3]);
endmodule //exemplo0033

module test_f4;
// ------------------------- definir dados 
		 reg [3:0] x; 
		 reg [3:0] y;	
		 reg chave;
		 wire [3:0] z; 
		 wire [3:0] p;
		 wire [3:0] r;
		 wire [3:0] t; 
		 wire [3:0] u;
		 wire [3:0] v;
		 wire [3:0] f; 
		 wire [3:0] g;
		 wire [3:0] h;
		 

		exemplo0033 modulo (z,p,r,t,u,v,f,g,h,x,y,chave); 
// ------------------------- parte principal 
initial begin
 
$display("Exemplo0033 - Rafael Lopes Barbosa - 435052"); 
$display("Test LU's module");
 
x = 4'b0011; y = 4'b0101; chave = 0;
// projetar testes do modulo 
#1 $display("%4b %4b = %4b %4b    %4b",x,y,h,g,chave); 

end 
endmodule // test_f4 