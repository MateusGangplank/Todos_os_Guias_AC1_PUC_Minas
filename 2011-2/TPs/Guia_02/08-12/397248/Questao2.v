 // ------------------------- 
// Questao2 - Guia02 
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;

reg [5:0] op1;
reg [4:0] op2;
reg [4:0] op3;
reg [4:0] op4;
reg [9:0] op5;
reg [5:0] op6;
reg [8:0] op7;
reg [8:0] op8;
reg [5:0] op9;
reg [6:0] op10;
// ------------------------- parte principal 
initial begin 
$display("Questao2 - Marlon Henrique de Azeredo Formiga - 397248"); 
$display("Test number system");
op1 = 6'b100010;
op2 = 5'b11010;
op3 = 5'b11010;
op4 = 5'o23;
op5 = 10'o1234;
op6 = 6'h2d;
op7 = 9'h1a9;
op8 = 9'b101101001;
op9 = 6'o41;
op10 = 7'h6b;

 
a = op1 + op2; 
b = op3 + op4; 
c = op5 / op6; 
d = op7 - op8;
e = 25 * op9 + op10;
 
$display("\nResultados das equacoes"); 
$display("a = %6b", a); 
$display("b = %6b", b); 
$display("c = %4b", c); 
$display("d = %7b", d); 
$display("e = %10b", e); 
end 
endmodule // test_base 