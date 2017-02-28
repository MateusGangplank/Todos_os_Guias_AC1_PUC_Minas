// ------------------------- 
// Extra01 - BASE 
// Nome: Gabriel Luiz Marquezini Gonçalves Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// test number system 
// -------------------------
module complemento (output [7:0] s, input [7:0] p);
assign s=~p;
endmodule
//
//
module testcomplemento; 
// ------------------------- definir dados 
reg [7:0] a;  
wire [7:0] s;
complemento  Comp1(s,a);
// ------------------------- parte principal 
initial begin:start 
$display("Extra01 - Gabriel Luiz Marquezini Gonçalves Vieira - 441691"); 
$display("Test number system"); 
a = 8'b00000000; 
$display("\nResults"); 
$monitor("C1 de %b = %b", a, s); 
#1a = 25;
#1a = 8'b110110;
#1a = 8'o25;
#1a = 8'h4C;
end 
endmodule // test_base 
