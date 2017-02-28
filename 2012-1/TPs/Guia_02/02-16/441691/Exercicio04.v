// ------------------------- 
// Exercicio04 - BASE 
// Nome: Gabriel Luiz Marquezini Gonçalves Vieira 
// Matricula: 441691 
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
$display("Exercicio04 - Gabriel Luiz Marquezini Gonçalves Vieira - 441691"); 
$display("Test number system"); 
a = 'b101010; 
b = 'b11011; 
c = 23;
d = 'hE; 
e = 'o26;
a=~a+1'b1; 
b=~b+1'b1;
c=~c+1'b1;
d=~d+1'b1;
e=~e+1'b1;
$display("\nResults"); 
$display("a = %d = %b", a, a);  
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
end 
endmodule // test_base 
