 // ------------------------- 
// Extra01 - BASE 
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
// ------------------------- parte principal 
initial begin 
$display("Extra01 - Gustavo Jota Resende - 427413"); 
a = ~854;

$display("\nNegative mixed expression"); 
$display("Extra 01"); 
$display("a = %d = %8b", a, a);

end 
endmodule // test_base 

// Versao Teste 
// 0.1 01. ( OK ) identificacao de programa 
// Resultados: a = 169 = 10101001 