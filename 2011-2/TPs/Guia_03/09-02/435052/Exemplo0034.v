// ------------------------- 
// Exemplo0035 - F4 
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s_or,  output [3:0] s_nor,
			  output [3:0] s_xor, output [3:0] s_xnor,
			  output [3:0] s1, output [3:0] s2,
			  output [3:0] s3, output [3:0] s4,
			  output [3:0]	s_final, output[3:0] s_final2, 	
				input [3:0] a,
				input [3:0] b,
				input chave); 

	
	or o1(s_or[0],a[0],b[0]);
	or o2(s_or[1],a[1],b[1]);
	or o3(s_or[2],a[2],b[2]);
	or o4(s_or[3],a[3],b[3]);
	
//Nor
	not no1(s_nor[0],s_or[0]);	
	not no2(s_nor[1],s_or[1]);
	not no3(s_nor[2],s_or[2]);
	not no4(s_nor[3],s_or[3]);
	
	
	and a1(s1[0],s_or[0],~chave);
	and a2(s1[1],s_or[1],~chave);
	and a3(s1[2],s_or[2],~chave);
	and a4(s1[3],s_or[3],~chave);
	
	and a1(s2[0],s_nor[0],~chave);
	and a2(s2[1],s_nor[1],~chave);
	and a3(s2[2],s_nor[2],~chave);
	and a4(s2[3],s_nor[3],~chave);

	xor x1(s_xor[0],a[0],b[0]);
	xor x2(s_xor[1],a[1],b[1]);
	xor x3(s_xor[2],a[2],b[2]);
	xor x4(s_xor[3],a[3],b[3]);
	
	xnor xn1(s_xnor[0],a[0],b[0]);
	xnor xn1(s_xnor[1],a[1],b[1]);
	xnor xn1(s_xnor[2],a[2],b[2]);
	xnor xn1(s_xnor[3],a[3],b[3]);
	

	and a1(s3[0],s_xor[0],chave);
	and a2(s3[1],s_xor[1],chave);
	and a3(s3[2],s_xor[2],chave);
	and a4(s3[3],s_xor[3],chave);
	
	and a1(s4[0],s_xnor[0],chave);
	and a2(s4[1],s_xnor[1],chave);
	and a3(s4[2],s_xnor[2],chave);
	and a4(s4[3],s_xnor[3],chave);

	
	or o1(s_final[0],s1[0],s3[0]);
	or o2(s_final[1],s1[1],s3[1]);
	or o3(s_final[2],s1[2],s3[2]);
	or o4(s_final[3],s1[3],s3[3]);
	
	or o1(s_final2[0],s2[0],s4[0]);
	or o2(s_final2[1],s2[1],s4[1]);
	or o3(s_final2[2],s2[2],s4[2]);
	or o4(s_final2[3],s2[3],s4[3]);
		
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y;
reg chave;
wire [3:0]a;
wire [3:0]b;
wire [3:0]c;
wire [3:0]d;
wire [3:0]e;
wire [3:0]f;
wire [3:0]g;
wire [3:0]h;
wire [3:0]i;
wire [3:0]j;
 

f4 modulo (a,b,c,d,e,f,g,h,i,j,x,y,chave); 
// ------------------------- parte principal 
initial begin
 
$display("Exemplo0035 - Rafael Lopes Barbosa - 435052"); 
$display("Test LU's module");
 
x = 4'b0011; y = 4'b0101; chave = 0;
// projetar testes do modulo 
#1 $display("x = %4b    y = %4b = %4b  %4b    chave:%4b",x,y,i,j,chave); 

end 
endmodule // test_f4 