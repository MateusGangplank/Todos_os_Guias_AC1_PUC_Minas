// ------------------------- 
// Exercicio0005 - BASE 
// Nome: Raphael Quintao 
// Matricula: 445171
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
$display("Exercicio 0005 - Raphael Quintao - 445171"); 

a = 6'b101011 + (~(4'b1001) + 1); 
b = 'b10011 + (~('o15) + 1); 
c = 'o35 + (~('hc)+1); 
d = 'hba + (~('b10111001)+1); 
e = 'd37 + (~('h1b)+1);

$display("a = %3d = %8b", a, a); 
$display("b = %3d = %8b", b, b); 
$display("c = %3d = %8b", c, c);
$display("d = %3d = %8b", d, d);
$display("e = %3d = %8b", e, e);
end 
endmodule // test_base 