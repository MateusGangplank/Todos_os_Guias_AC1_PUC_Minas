// ------------------------- 
// Exemplo0035 - F4 
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s_and, output [3:0] s_or,
			  output [3:0] s_notx, output[3:0] s_noty,
			  output [3:0] s_nor, output [3:0] s_nand,
			  output [3:0] s_xor, output [3:0] s_xnor, 	
				input [3:0] a,
				input [3:0] b); 

	and a1(s_and[0],a[0],b[0]);
	and a2(s_and[1],a[1],b[1]);
	and a3(s_and[2],a[2],b[2]);
	and a4(s_and[3],a[3],b[3]);
	
	or o1(s_or[0],a[0],b[0]);
	or o2(s_or[1],a[1],b[1]);
	or o3(s_or[2],a[2],b[2]);
	or o4(s_or[3],a[3],b[3]);
	
	not n1(s_notx[0],a[0]);
	not n2(s_notx[1],a[1]);
	not n3(s_notx[2],a[2]);
	not n4(s_notx[3],a[3]);
	
	not n1(s_noty[0],b[0]);
	not n2(s_noty[1],b[1]);
	not n3(s_noty[2],b[2]);
	not n4(s_noty[3],b[3]);
	
//Nand
	not na1(s_nand[0],s_and[0]);	
	not na2(s_nand[1],s_and[1]);
	not na3(s_nand[2],s_and[2]);
	not na4(s_nand[3],s_and[3]);
	
//Nor
	not no1(s_nor[0],s_or[0]);	
	not no2(s_nor[1],s_or[1]);
	not no3(s_nor[2],s_or[2]);
	not no4(s_nor[3],s_or[3]);
	
	xor x1(s_xor[0],a[0],b[0]);
	xor x2(s_xor[1],a[1],b[1]);
	xor x3(s_xor[2],a[2],b[2]);
	xor x4(s_xor[3],a[3],b[3]);
	
	xnor xn1(s_xnor[0],a[0],b[0]);
	xnor xn1(s_xnor[1],a[1],b[1]);
	xnor xn1(s_xnor[2],a[2],b[2]);
	xnor xn1(s_xnor[3],a[3],b[3]);
		
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y;
wire [3:0]a;
wire [3:0]b;
wire [3:0]c;
wire [3:0]d;
wire [3:0]e;
wire [3:0]f;
wire [3:0]g;
wire [3:0]h;
 

f4 modulo (a,b,c,d,e,f,g,h,x,y); 
// ------------------------- parte principal 
initial begin
 
$display("Exemplo0035 - Rafael Lopes Barbosa - 435052"); 
$display("Test LU's module");
 
x = 4'b0011; y = 4'b0101; 
// projetar testes do modulo 
#1 $display("A = %4b; B = %4b; NOT(A)= %4b; NOT(B)= %4b; OR = %4b; NOR = %4b; AND = %4b; NAND = %4b; XOR = %4b; XNOR = %4b;",x,y,c,d,b,e,a,f,g,h); 

end 
endmodule // test_f4 