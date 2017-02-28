
 // ------------------------- 
// Exemplo0031 - F4 
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (
output s1,
output s2, 
input a, 
input b,
input c,
input d
); 

and AND1(s1,a,b,c,d);
or OR1(s2,a,b,c,d);

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg  x; 
reg y;
reg  x1; 
reg y1;  
wire z2;
wire z1;
f4 modulo (z1,z2, x, y, x1, y1); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Lucas Siqueira Chagas - 380783"); 
$display("Test LU's module"); 

end 
endmodule // test_f4 