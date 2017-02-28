// -------------------------
// Exercicio 03 - Guia 11
// Nome: Marlon Henrique de Azeredo Formiga
// Matricula: 397248
// -------------------------
// -------------------------
//  test number system
// -------------------------
module ex03(d, a, b, c);

d = a * b + c;

module test_ex03;
// ------------------------- definir dados
     reg [7:0] a;
     reg [7:0] b;
     reg [7:0] c;
	  reg [7:0] d;
// ------------------------- parte principal
initial begin
      $display("Exercicio 03 - Marlon Henrique de Azeredo Formiga - 397248");
      
a =   5;
b =  10;
c =  15;
d = a * b + c;
$display("a = %d = %8b", a, a);
$display("b = %d = %8b", b, b);
$display("c = %d = %8b", c, c);
$display("d = %d = %8b", d, d);
end
endmodule //