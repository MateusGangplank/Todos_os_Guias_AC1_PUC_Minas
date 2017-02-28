
 // ------------------------- 
// Exemplo0034 - F4 
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
output s6,
output s7, 
output s8,
output SF1, 
output SF2,
input a, 
input b,

input chave
); 
or OR1 (s1, a,b);
xor XOR1 (s2, a, b);
nor NOR1 (s3,a,b);
xnor XNOR1 (s4,a,b);
and AND2 (s5,s1,~chave);
and AND3 (s6,s2,chave);
and AND4 (s7,s3,~chave);
and AND5 (s8,s4,chave);
or OR3 (SF1,s5,s7);
or OR4 (SF2,s6,s8);

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg  x; 
reg y;
reg c; 
wire z1;
wire z2;
wire z3;
wire z4;
wire z5;
wire z6;
wire z7;
wire z8;
wire zF1;
wire zF2;
f4 modulo (z1,z2,z3,z4,z5,z6,z7,z8,zF1,zF2, x,y, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Lucas Siqueira Chagas - 380783"); 
$display("Test LU's module"); 
end 
endmodule // test_f4 