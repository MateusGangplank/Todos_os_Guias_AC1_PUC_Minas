// -------------------------
// Exercício 3 - BASE
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------

// -------------------------
// test number system
// -------------------------

module test_base_01;
// ------------------------- definir dados

reg [6:0]result_a;
reg [5:0]result_b;
reg [5:0]result_c;
reg [6:0]result_d;
reg [3:0]result_e;
reg c;
// ------------------------- parte principal
initial begin
$display("Exercicio 3 - Gabriel Benjamim de Carvalho - 396690");
$display("Test number system");

result_a = 'b100110;

result_b = 'o24;

result_c = 25;

result_d = 'h2D;

result_e = 27-37;

c = 1'b1;

$display("\nResults value");
$display("result_a = %7b", ~result_a + c);
$display("result_b = %6b", ~result_b + c);
$display("result_c = %6b", ~result_c + c);
$display("result_d = %7b", ~result_d + c);
$display("result_e = %4b", ~result_e + c);

end

endmodule // test_base