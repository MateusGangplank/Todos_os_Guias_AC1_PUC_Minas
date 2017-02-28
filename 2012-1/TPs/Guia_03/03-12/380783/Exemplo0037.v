
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
output s3,
output s4, 
output s5,
output s6,
output s7, 
output s8,
output s9, 
output s10,
output s11,
output s12,
output sF1,
output sF2,
output sF3,
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

and and1 (s5, a, s1);
and and2 (s6, b, s2);
and and3 (s7, c, s3);
and and4 (s8, d, s4);

or OR1 (sF1, s1,s2,s3,s4);

and and5 (s9, ~s1, s6);
and and6 (s10, ~s1, ~s2,s7);
and and6 (s11,~s3, ~s1, ~s2,s8);

or OR2 (sF2, s9,s10,s11,s5);

xnor xnor1 (s12,sF2,chave);
and (sF3,s12, sF1);



endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg v; 
reg w; 
reg x; 
reg y;
reg v1; 
reg w1; 
reg x1; 
reg y1;
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
wire z10;
wire z11;
wire z12;
wire zF1;
wire zF2;
wire zF3;
f4 modulo (z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,zF1,zF2,zF3, v,w,x, y,v1,w1,x1, y1, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0037 - Lucas Siqueira Chagas - 380783"); 
$display("Test LU's module"); 
$display("( v | w | x | y | v1 | w1 | x1 | y1 | | Chave )     =    S "); 
#1 v=0; w=0; x=0; y=0; v1=0; w1=0; x1=0; y1=0; c=0;
$monitor("(%b | %b | %b | %b | %b | %b | %b | %b | | %b)     =    %b ", v,w,x,y,v1,w1,x1,y1,c,zF3);
#1 v=1; w=0; x=1; y=0; v1=0; w1=1; x1=0; y1=0; c=1;
#1 v=1; w=0; x=1; y=0; v1=0; w1=1; x1=0; y1=0; c=1;
#1 v=1; w=0; x=1; y=1; v1=0; w1=1; x1=1; y1=0; c=1;
#1 v=0; w=0; x=1; y=0; v1=0; w1=1; x1=0; y1=0; c=1;
#1 v=0; w=1; x=1; y=0; v1=1; w1=1; x1=1; y1=0; c=1;
#1 v=0; w=0; x=1; y=1; v1=0; w1=1; x1=0; y1=1; c=1;

#1 v=1; w=0; x=1; y=0; v1=0; w1=1; x1=0; y1=0; c=0;
#1 v=1; w=0; x=1; y=0; v1=0; w1=1; x1=0; y1=0; c=0;
#1 v=1; w=0; x=1; y=1; v1=0; w1=1; x1=1; y1=0; c=0;
#1 v=0; w=0; x=1; y=0; v1=0; w1=1; x1=0; y1=0; c=0;
#1 v=0; w=1; x=1; y=0; v1=1; w1=1; x1=1; y1=0; c=0;
#1 v=0; w=0; x=1; y=1; v1=0; w1=1; x1=0; y1=1; c=0;
end 
endmodule // test_f4 