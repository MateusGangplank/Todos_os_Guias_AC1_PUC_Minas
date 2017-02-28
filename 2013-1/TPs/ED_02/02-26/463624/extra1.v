// ------------------------- 
// extra 1
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Comp2byte( output [7:0]s , input [7:0]a );

assign s = ~a ;

endmodule


module exercicioextra; 
// ------------------------- definir dados 

reg [7:0] a; 
wire [7:0] s;
Comp2byte comp1 (s, a);


// ------------------------- parte principal 
initial begin : main
$display("Extra1 - Mateus Cunha da Silva - 463624"); 
$display("Test number system");

$monitor(" comp2(%b) = %b",a , s);


#1 a = 8'b1; 
#1 a = 8'd2;
#1 a = 8'd3;




end
endmodule // test_base


