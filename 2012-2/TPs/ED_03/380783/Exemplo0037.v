
 // ------------------------- 
// Exemplo0037 - F4 
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (
output s1,
output s2,  
output s5,
output s6,  
output s7,
output s8,  
output s9,
output s10,  
output s11,
input a, 
input b,

input a1, 
input b1,
input chave
); 

xor XOR1 (s1, a, a1);
xor XOR2 (s2, b, b1);

and and1 (s5, a, s1);
and and2 (s6, b, s2);

and and3(s7, ~s1,s6);

or or1(s8, s5,s7);
or or2(s10, s1,s2);

xnor XOR3 (s9, s8, chave);

and and4(s11, s9, s10);


endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg v; 
reg w; 
reg v1; 
reg w1; 
reg c; 
wire z1;
wire z2;
wire z3;
wire z4;
wire z5;
wire z6;
wire z7;
wire z8;
wire z9;
f4 modulo (z1,z2,z3,z4,z5,z6,z7,z8,z9,v,w,v1,w1,c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0037 - Lucas Siqueira Chagas - 380783"); 
$display("Test LU's module"); 
$display("( v | w | x | y | v1 | w1 | x1 | y1 | | Chave )     =    S "); 

end 
endmodule // test_f4 