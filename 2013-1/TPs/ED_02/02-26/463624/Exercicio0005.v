// ------------------------- 
// Exercicio4
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Comp8 ( output [7:0]s , input [7:0]a, input [7:0] b );
wire [7:0]r;
assign r = ~b + 8'b1;
assign s = r + a;
endmodule


module exercicio05; 
// ------------------------- definir dados 

reg [7:0] a; 
reg [7:0] b; 
wire [7:0] s;
Comp8 comp1 (s, a, b);


// ------------------------- parte principal 
initial begin : main
$display("Exercicio004 - Mateus Cunha da Silva - 463624"); 
$display("Test number system");

$monitor(" %b - %b = %b",a, b , s);


#1 a = 8'b101011; b= 8'b1001;
#1 a = 8'b10011 ; b=8'o15;
#1 a = 8'o35 ; b=8'hc;
#1 a = 8'hba ; b=8'b10111001;
#1 a = 8'd37 ; b=8'h1b;



end
endmodule // test_base


