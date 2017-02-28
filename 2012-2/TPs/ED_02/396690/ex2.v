// -------------------------
// Exercício 2 - BASE
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------

// -------------------------
// test number system
// -------------------------

module test_base_01;
// ------------------------- definir dados

reg [8:0]op1;
reg [8:0]op2;

reg [6:0]result_a;
reg [5:0]result_b;
reg [3:0]result_c;
reg [6:0]result_d;
reg [10:0]result_e;
// ------------------------- parte principal
initial begin
$display("Exercicio 2 - Gabriel Benjamim de Carvalho - 396690");
$display("Test number system");

op1 = 6'b101010;
op2 = 5'b11011;
result_a = op1 + op2;
op1 = 5'b11011;
op2 = 5'o25;
result_b = op1 + op2;
op1 = 10'o1234;
op2 = 6'h3C;
result_c = op1 / op2;
op1 = 9'h1BA;
op2 = 9'b101110001;
result_d = op1 - op2;
op1 = 25 * 5'o32;
op2 = 7'h7A;
result_e = op1 + op2;

$display("\nResults value");
$display("result_a = %d = %5b", result_a, result_a);
$display("result_b = %d = %5b", result_b, result_b);
$display("result_c = %d = %4b", result_c, result_c);
$display("result_d = %d = %4b", result_d, result_d);
$display("result_e = %d = %10b", result_e, result_e);
//69, 48, 728, 73, 772


end

endmodule // test_base