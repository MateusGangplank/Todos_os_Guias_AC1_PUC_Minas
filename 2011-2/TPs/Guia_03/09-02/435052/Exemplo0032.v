// ------------------------- 
// Exemplo0032 - F4 
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s,
output [3:0] s1, 
input [3:0] a,
input [3:0] b); 

and a1(s[0],a[0],b[0]);
and a2(s[1],a[1],b[1]);
and a3(s[2],a[2],b[2]);
and a4(s[3],a[3],b[3]);

or o1(s1[0],a[0],b[0]);
or o1(s1[1],a[1],b[1]);
or o1(s1[2],a[2],b[2]);
or o1(s1[3],a[3],b[3]);

endmodule // f4 
module exemplo0032 (output[3:0] s,
					 output[3:0] s1,
					 output[3:0] s2,
					 input [3:0] a,
					 input [3:0] b,
					 input chave);
					 
	reg [3:0] x;
	reg [3:0] y;
	wire[3:0] z;
	wire[3:0] w;					 

f4 modulo (z, w, a, b); 

and a1(s[0],z[0],chave);
and a2(s[1],z[1],chave);
and a3(s[2],z[2],chave);
and a4(s[3],z[3],chave);

and a1(s1[0],w[0],~chave);
and a2(s1[1],w[1],~chave);
and a3(s1[2],w[2],~chave);
and a4(s1[3],w[3],~chave);

or o1(s2[0],s[0],s1[0]);
or o2(s2[1],s[1],s1[1]);
or o3(s2[2],s[2],s1[2]);
or o4(s2[3],s[3],s1[3]);

endmodule

module test_f4;
	reg[3:0] x;
	reg[3:0] y;
	reg chave;
	wire[3:0] z;
	wire[3:0] s;
	wire[3:0] r;
	
	exemplo0032 modulo(z,s,r,x,y,chave);
// ------------------------- parte principal 
initial begin
 
$display("Exemplo0032 - Rafael Lopes Barbosa - 435052"); 
$display("Test LU's module");
 
x = 4'b0011; y = 4'b0101; chave = 0;
// projetar testes do modulo 
#1 $display("%3b %3b = %3b     %3b",x,y,r,chave); 

end 
endmodule // test_f4 