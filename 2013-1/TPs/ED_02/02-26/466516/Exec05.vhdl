// ------------------------- 
// Exec05 - BASE 
// Nome: Matheus de Souza Castro Santos 
// Matricula: 466516
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c; 
reg [7:0] d; 
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exec03 - Matheus de Souza Castro Santos - 466516"); 
$display("Test number system"); 
 

a = ~('b101011 - 'b1001) + 1;
b = ~('b10011 - 'o15) + 1;
c = ~('o35 - 'hC) + 1;
d = ~('hBA - 'b10111001) + 1;
e = ~('o37 - 'h1B) + 1;

 
$display("\nPositive value"); 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 


end 
endmodule // test_base 