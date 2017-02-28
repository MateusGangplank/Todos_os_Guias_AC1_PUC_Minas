// ------------------------- 
// Exec02 - BASE 
// Nome: Matheus de Souza Castro Santos 
// Matricula: 466516
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d; 
reg [5:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exec02 - Matheus de Souza Castro Santos - 466516"); 
$display("Test number system"); 
 
a = 'b100110 + 'b11011 ;
b = 'b11101 + 'o25 ;
c = 'o1234 / 'h4C ;
d = 'h1BA - 'b101110011; 
e = 'o25 * 'o32 + 'h8A; 

 
$display("\nPositive value"); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 


end 
endmodule // test_base 