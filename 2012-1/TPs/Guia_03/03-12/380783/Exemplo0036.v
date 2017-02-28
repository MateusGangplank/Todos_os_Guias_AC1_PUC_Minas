
 // ------------------------- 
// Exemplo0036 - F4 
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (
output s1,
output s2, 
output s3,
output s4, 
output s5,
output sF1,
input a, 
input b,
input c, 
input d,

input a1, 
input b1,
input c1,
input d1,
input chave
); 

xor XOR1 (s1, a, a1);
xor XOR2 (s2, b, b1);
xor XOR3 (s3, c, c1);
xor XOR4 (s4, d, d1);

nor NOR1 (s5, s1,s2,s3,s4);
xor XOR1 (sF1, chave,s5);



endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg x; 
reg y;
reg v;
reg w;
reg x1; 
reg y1;
reg v1;
reg w1;
reg c; 
wire z1;
wire z2;
wire z3;
wire z4;
wire z5;
wire zF1;
f4 modulo (z1,z2,z3,z4,z5,zF1, v,w,x, y,v1,w1,x1, y1, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0036 - Lucas Siqueira Chagas - 380783"); 
$display("Test LU's module"); 

end 
endmodule // test_f4 