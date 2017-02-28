// -------------------------
// Exercício 1 - BASE
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------

// -------------------------
// test number system
// -------------------------

module test_base_01;
// ------------------------- definir dados

reg [5:0]op1;
reg [5:0]op2;

reg [4:0]result_a;
reg [4:0]result_b;
reg [2:0]result_c;
reg [3:0]result_d;
reg [4:0]result_e;
// ------------------------- parte principal
initial begin
$display("Exercicio 1 - Gabriel Benjamim de Carvalho - 396690");
$display("Test number system");

op1 = 2;
op2 = 14;
result_a = op1 + op2;
op1 = 3;
op2 = 9;
result_b = op1 * op2;
op1 = 32;
op2 = 5;
result_c = op1 / op2;
op1 = 24;
op2 = 11;
result_d = op1 - op2;
op1 = 2 * 6;
op2 = 7 - 1;
result_e = op1 + op2;


$display("\nResults value");
$display("result_a = %d = %5b", result_a, result_a);
$display("result_b = %d = %5b", result_b, result_b);
$display("result_c = %d = %3b", result_c, result_c);
$display("result_d = %d = %4b", result_d, result_d);
$display("result_e = %d = %5b", result_e, result_e);



end

endmodule // test_base