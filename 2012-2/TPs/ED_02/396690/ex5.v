// -------------------------
// Exercício 5 - BASE
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------

// -------------------------
// test number system
// -------------------------

module test_base_01;
// ------------------------- definir dados

reg [7:0]op1;
reg [7:0]op2;

reg [7:0]result_a;
reg [7:0]result_b;
reg [7:0]result_c;
reg [7:0]result_d;
reg [7:0]result_e;
reg c = 1'b1;
// ------------------------- parte principal
initial begin
$display("Exercicio 2 - Gabriel Benjamim de Carvalho - 396690");
$display("Test number system");

op1 = 'b101010;
op2 = 'b1001;
op2 = ~op2 + c;
result_a = op1 + op2;
op1 = 'b11011;
op2 = 'o15;
op2 = ~op2 + c;
result_b = op1 + op2;
op1 = 'o34;
op2 = 'hC;
op2 = ~op2 + c;
result_c = op1 + op2;
op1 = 'hDA;
op2 = 'b10111001;
op2 = ~op2 + c;
result_d = op1 + op2;
op1 = 'd27;
op2 = 'h1B;
op2 = ~op2 + c;
result_e = op1 + op2;

$display("\nResults value");
$display("result_a = %6b", result_a);
$display("result_b = %8b", result_b);
$display("result_c = %8b", result_c);
$display("result_d = %8b", result_d);
$display("result_e = %8b", result_e);


end

endmodule // test_base