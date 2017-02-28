
 // ------------------------- 
// Guia 2
// Nome: Vinicius dos santos bordoni
// Matricula: 365595
// ------------------------- 
// ------------------------- 
// Operações1
// ------------------------- 
// ------------------------- 
module operacoes1; 

reg [4:0] a; 
reg [4:0] b; 
reg [1:0] c; 
reg [3:0] d; 
reg [4:0] e;
 
initial begin 
$display("Guia 02-1 - Vinicius dos Santos Bordoni - 365595"); 
$display("Operacoes"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3;
d = 19 - 11;
e = 2**4 + 6 - 1; 
$display("\nOverflow"); 
$display("a = 2 + 14 = %d = %b" , a, a); 
$display("b = 3 * 7 = %d = %b", b, b); 
$display("c = 34 / 3 = %d = %b", c, c);
$display("d = 19 - 11 = %d = %b", d, d); 
$display("e = 2**4 + 6 - 1 = %d = %b", e, e); 
//ou $displayb.
end 
endmodule //
