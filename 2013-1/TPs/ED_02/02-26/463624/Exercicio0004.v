// ------------------------- 
// Exercicio4
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Comp8 ( output [7:0]s , input [7:0]a );
assign s = ~a + 8'b1;
endmodule
module Comp7 ( output [6:0]s , input [6:0]a );
assign s = ~a + 7'b1;
endmodule
module Comp6 ( output [5:0]s , input [5:0]a );
assign s = ~a + 6'b1;
endmodule
module Comp5 ( output [4:0]s , input [4:0]a );
assign s = ~a + 5'b1;
endmodule
module exercicio03; 
// ------------------------- definir dados 
reg [7:0] a; 
wire [7:0] s;
reg [6:0] a1; 
wire [6:0] s1;
reg [5:0] a2; 
wire [5:0] s2;
reg [4:0] a3; 
wire [4:0] s3;


Comp8 comp1 (s, a);
Comp7 comp2 (s1, a1);
Comp6 comp3 (s2, a2);
Comp5 comp4 (s3, a3);
//-------------------------- preparacao
initial begin : start
a = 8'b101111;
a1 = 7'b111001;
a2 = 6'd25;
a3 = 5'hd;
end
// ------------------------- parte principal 
initial begin : main
$display("Exercicio004 - Mateus Cunha da Silva - 463624"); 
$display("Test number system");
#1;
$display(" ~%b  = %b ", a, s);
a = 8'o24;
#1 $display(" ~%b  = %b ", a, s);
$display(" ~%b  = %b ", a1, s1);
$display(" ~%b  = %b ", a2, s2);
$display(" ~%b  = %b ", a3, s3);
end
endmodule // test_base


