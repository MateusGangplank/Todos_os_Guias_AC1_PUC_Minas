// Exemplo0031 - F4 
// Nome: Matheus Filipe Sieiro Vargas	 
// Matricula: 451601 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [7:0] s, input [3:0] a,input [3:0] b); 
and andgate1 (s[0],a[0],b[0]); 
and andgate2 (s[1],a[1],b[1]);
and andgate3 (s[2],a[2],b[2]);
and andgate4 (s[3],a[3],b[3]);
 
or orgate1 (s[4],a[0],b[0]);
or orgate2 (s[5],a[1],b[1]);
or orgate3 (s[6],a[2],b[2]);
or orgate4 (s[7],a[3],b[3]);
  
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [7:0] z; 
f4 modulo (z, x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Matheus Filipe Sieiro Vargas - 451601"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; 
// projetar testes do modulo 
#1 $display("x|y = %4b /n x&y = %4b ",z[7:4],z[3:0]); 
end 
endmodule // test_f4 