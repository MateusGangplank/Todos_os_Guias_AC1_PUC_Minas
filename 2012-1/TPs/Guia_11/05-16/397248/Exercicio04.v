// -------------------------
// Exercicio 04 - Guia 11
// Nome: Marlon Henrique de Azeredo Formiga
// Matricula: 397248
// -------------------------
// -------------------------
//  test number system
// -------------------------
module ex04(c, a, b);

c = a / b;

module test_ex04;
// ------------------------- definir dados
     reg [7:0] a;
     reg [7:0] b;
     reg [7:0] c;
// ------------------------- parte principal
initial begin
      $display("Exercicio 04 - Marlon Henrique de Azeredo Formiga - 397248");
      
a =   5;
b =  10;
c = a / b;
$display("a = %d = %8b", a, a);
$display("b = %d = %8b", b, b);
$display("d = %d = %8b", c, c);
end
endmodule //