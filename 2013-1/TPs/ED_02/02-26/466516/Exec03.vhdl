// ------------------------- 
// Exec03 - BASE 
// Nome: Matheus de Souza Castro Santos 
// Matricula: 466516
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [3:0] b; 
reg [2:0] c; 
reg [4:0] d; 
reg [3:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exec03 - Matheus de Souza Castro Santos - 466516"); 
$display("Test number system"); 
 

a = ~'b101010 + 1  ;
b = ~'o25 + 1 ;
c = ~'d27 + 1 ;
d = ~'h2C + 1 ;
e = ~(25 - 35) + 1 ;


 
$display("\nPositive value"); 
$display("a = %b = %b", a, a); 
$display("b = %b = %b", b, b); 
$display("c = %b = %b", c, c); 
$display("d = %b = %b", d, d); 
$display("e = %b = %b", e, e); 


end 
endmodule // test_base 