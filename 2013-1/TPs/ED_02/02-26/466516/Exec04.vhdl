// ------------------------- 
// Exec04 - BASE 
// Nome: Matheus de Souza Castro Santos 
// Matricula: 466516
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [6:0] b; 
reg [5:0] c; 
reg [4:0] d; 
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exec04 - Matheus de Souza Castro Santos - 466516"); 
$display("Test number system"); 
 
a = ~'b101111 +1; //-- com 8 bits de comprimento 
b = ~'b111001 + 1; //--321(4) com 7 bits de comprimento 
c = ~'d25 + 1; //--com 6 bits de comprimento 
d = ~'hD + 1; //--com 5 bits de comprimento 
e = ~'o24 + 1;//--com 8 bits de comprimento 


 
$display("\nPositive value"); 
$display("a = %b = %b", a, a); 
$display("b = %b = %b", b, b); 
$display("c = %b = %b", c, c); 
$display("d = %b = %b", d, d); 
$display("e = %b = %b", e, e); 


end 
endmodule // test_base 