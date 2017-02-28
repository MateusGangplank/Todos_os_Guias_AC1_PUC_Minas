// -------------------------
// Exercício 4 - BASE
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------

// -------------------------
// test number system
// -------------------------

module test_base_01;
// ------------------------- definir dados

reg [7:0]result_a;
reg [6:0]result_b;
reg [5:0]result_c;
reg [4:0]result_d;
reg [7:0]result_e;
reg c;
// ------------------------- parte principal
initial begin
$display("Exercicio 4 - Gabriel Benjamim de Carvalho - 396690");
$display("Test number system");

result_a = 'b101011;

result_b = 'o321;

result_c = 27;

result_d = 'hC;

result_e = 'o21;

c = 1'b1;

$display("\nResults value");
$display("result_a = %8b", ~result_a + c);
$display("result_b = %7b", ~result_b + c);
$display("result_c = %6b", ~result_c + c);
$display("result_d = %5b", ~result_d + c);
$display("result_e = %8b", ~result_e + c);

end

endmodule // test_base