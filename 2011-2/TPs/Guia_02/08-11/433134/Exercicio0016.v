// -------------------------
// Exercicio0016  
// Nome: Douglas Cruz de Matos
// Matricula: 433134
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [10:0] a;
reg [10:0] b;
reg [10:0] c;
reg [10:0] d;
reg [10:0] e;

// ------------------------- parte principal
initial begin 
$display("Exercicio0016 - Douglas Cruz de Matos - 433134"); 
$display("Exercicio 1 system"); 
//--testando valores positivos
a = 2+14; 
b = 7 * 3;
c = 34 / 3; 
d = 19 - 11;
e = (2 * 4) + (6 - 1); 
$display("\n\tCalculos Simples"); 
$display("a =\t %d =\t\t %5b", a, a); 
$display("b =\t %d =\t\t %5b", b, b); 
$display("c =\t %f =\t %6b", c, c); 
$display("d =\t %d =\t\t %5b", d, d); 
$display("e =\t %d =\t\t %5b", e, e);

a = 10'b(100010) + 10'b11010;
b = 10'b(11010) + 10'o(23);
c = 10'o(1234)  /  10'h(2D);
d = 10'h(1A9) – 10'b(101101001);
e = (25 )* 10'o(41) + 10'h(6B) ;
$display("\n\tCalculos Simples");

$display("a =\t %d =\t\t %10b", a, a);
$display("b =\t %d =\t\t %10b", b, b);
$display("c =\t %f =\t %10b", c, c);
$display("d =\t %d =\t\t %10b", d, d);
$display("e =\t %d =\t\t %10b", e, e);
//--Professor não consegui compreender qual a proposta do exercicio 2, pois não sei converter dados em VHDL

a = ~(6'b100111)+1'b1;
b = ~(8'o54)+1'b1;
c = ~(7'b13)+1'b1;
d = ~(5'h1B)+1'b1;
e = ~(7'b25 +1'b1)+ (7'b36);
end
endmodule // test_base 