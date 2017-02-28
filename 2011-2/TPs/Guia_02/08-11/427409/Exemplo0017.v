// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Guilherme Rodrigues Melo de Oliveira 
// Matricula: 427409
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [4:0] b; 
reg [5:0] c; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0017 - Guilherme Rodrigues Melo de Oliveira - 427409");

a = 34;
b = 26;
c = a + b;

$display("\n");
$display("\nExercicio02");
$display("\n");
$display("\nA)");
$display("a = %b", a);
$display("b = %b", b);
$display("a + b = %b", c);

end 
endmodule // test_base 

module test_base_02; 

reg [4:0] a; 
reg [4:0] b; 
reg [5:0] c; 

initial begin 


a = 26;
b = 19;
c = a + b;

$display("\n");
$display("\nB)");
$display("a = %b", a);
$display("b = %o = %b", b,b);
$display("a + b = %b", c);

end 
endmodule

module test_base_03; 

reg [9:0] a; 
reg [5:0] b; 
reg [3:0] c; 

initial begin 


a = 668;
b = 45;
c = a / b;

$display("\n");
$display("\nC)");
$display("a = %o = %b", a,a);
$display("b = %h = %b", b,b);
$display("a / b = %b", c);

end 
endmodule

module test_base_04; 

reg [8:0] a; 
reg [8:0] b; 
reg [6:0] c; 

initial begin 


a = 425;
b = 361;
c = a - b;

$display("\n");
$display("\nD)");
$display("a = %h = %b", a,a);
$display("b = %b", b);
$display("a / b = %b", c);

end 
endmodule

module test_base_05; 

reg [4:0] a; 
reg [5:0] b; 
reg [6:0] c; 
reg [9:0] d;
 
initial begin 


a = 25;
b = 33;
c = 107;
d = (a*b)+c ;

$display("\n");
$display("\nE)");
$display("a = %d = %b", a,a);
$display("b = %o = %b", b,b);
$display("c = %h = %b", c,c);
$display("a * b + c = %b", d);

end 
endmodule