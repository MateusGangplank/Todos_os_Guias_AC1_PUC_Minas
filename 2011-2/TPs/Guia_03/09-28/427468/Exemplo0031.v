// ------------------------- 
// Exemplo0031 - F4 
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s1, output [3:0] s2, input [3:0] a, input [3:0] b); 
// -- descrição

and AND1 (s1[0], a[0], b[0]);
and AND2 (s1[1], a[1], b[1]);
and AND3 (s1[2], a[2], b[2]);
and AND4 (s1[3], a[3], b[3]);

or OR1 (s2[0], a[0], b[0]);
or OR2 (s2[1], a[1], b[1]);
or OR3 (s2[2], a[2], b[2]);
or OR4 (s2[3], a[3], b[3]);

endmodule // f4 
// ------------------------- 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] p; 
reg [3:0] q; 
wire[3:0] o, l; 
f4 modulo (l, o, p, q); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Ursula Rosa - 427468"); 
$display("Test LU's module"); 
p = 4'b0011; q = 4'b0101;
// projetar testes do modulo 
#1 $monitor("%3b %3b == AND %3b OR %3b",p,q,l,o); 
#1 p = 4'b1010; q = 4'b1101;
#1 p = 4'b1111; q = 4'b1111;
#1 p = 4'b0000; q = 4'b0000;
#1 p = 4'b1010; q = 4'b0101;
end 
endmodule // test_f4 