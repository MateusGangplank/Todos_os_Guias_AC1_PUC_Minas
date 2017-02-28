// ------------------------- 
// Exercicios - BASE 
// Nome: Miguel Sousa 
// Matricula: 463985 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [2:0] c; 
reg [3:0] d;
reg [4:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicios - Miguel Sousa - 463985"); 
$display("Test number system"); 
a = 3+14;
b = 3*8;
c = 33/5;
d = 25-11;
e = 2*8+7-1;
$display("Exercicio 01");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);
end 
endmodule
//---------------------------------------
module test_base_02;
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;
initial begin
a = 6'b100110 + 5'b11011;
b = 5'b11101 + 5'o25;
c = 10'o1234 / 7'h4C; 
d = 9'h1BA - 9'b101110011;
e = 5'o25 * 6'o32 + 8'h8A;
$display("Exercicio 02");
$display("a = %d = %7b", a, a);
$display("b = %d = %6b", b, b);
$display("c = %d = %4b", c, c);
$display("d = %d = %7b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule
//---------------------------------
module test_base_03;
reg [5:0] a;
reg [4:0] b;
reg [4:0] c;
reg [5:0] d;
reg [4:0] e;
initial begin
a = ~(6'b101010)+1;
b = ~(5'o25)+1;
c = ~(27)+1;
d = ~(6'h2C)+1; 
e = ~(25-35)+1;
$display("Exercicio 03");
$display("a = %6b", a);
$display("b = %5b", b);
$display("c = %5b", c);
$display("d = %6b", d);
$display("e = %5b", e);
end
endmodule 
//---------------------------------
module test_base_04;
reg[7:0] a;
reg[6:0] b;
reg[5:0] c;
reg[4:0] d;
reg[7:0] e;
initial begin
a = ~(6'b101111)+1;
b = ~(6'b111001)+1;
c = ~(5'd25)+1;
d = ~(4'hD)+1;
e = ~(5'o24)+1;
$display("Exercicio 04");
$display("a = %8b", a);
$display("b = %7b", b);
$display("c = %6b", c);
$display("d = %5b", d);
$display("e = %8b", e);
end
endmodule
//----------------------------
module test_base_05;
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
initial begin
a = 6'b101011+(~(4'b1001)+1);
b = 5'b10011+(~(4'o15)+1);
c = 5'o35 +(~(4'hC)+1);
d = 8'hBA +(~(8'b10111001)+1);
e = 37 +(~(5'h1B)+1);
$display("Exercicio 05");
$display("a = %8b", a, a);
$display("b = %8b", b, b);
$display("c = %8b", c, c);
$display("d = %8b", d, d);
$display("e = %8b", e, e);
end
endmodule