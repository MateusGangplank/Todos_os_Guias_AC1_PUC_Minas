
 // ------------------------- 
// Exemplo0032 - F4 
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
input a, 
input b,
input c,
input d,
input e
); 

and AND1(s1,a,b,c,d);
and AND2(s2,S1,e);
or or1(s3,a,b,c,d);
and and3(s4,s3,~e);
or or2 (s5, s4, s2);

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg  x; 
reg y;
reg  x1; 
reg y1;  
reg c; 
wire z1;
wire z2;
wire z3;
wire z4;
wire z5;
f4 modulo (z1,z2,z3,z4,z5, x, y, x1, y1, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Lucas Siqueira Chagas - 380783"); 
$display("Test LU's module"); 

end 
endmodule // test_f4 