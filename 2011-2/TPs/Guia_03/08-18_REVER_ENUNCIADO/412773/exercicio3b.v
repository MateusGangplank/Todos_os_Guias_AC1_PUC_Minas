// -------------------------
// Exercicios003B - 
// Nome: Silvino Henrique Santos de Souza
// Matricula: 412773
// -------------------------
module EXERCICIO6; 
// ------------------------- definir dados 
reg [7:0] a; 
wire [7:0] ac;
wire [7:0] ac2;
assign ac = ~a;
assign ac2 = ac + 1;
// ------------------------- parte principal 
initial begin 
$display("\nExercicio0036 - Silvino Henrique Santos de Souza - 412773"); 
$display("Test number system"); 
a = 00000000;
$display("\n1's COMPLEMENT"); 
$monitor("a = %8b = %8b", a, ac);
a = 00000000;
#1;
a = 00000001;
#1;
a = 00100111;
#1;
a = 10100101;
#1;
a = 11111110;
#1;
a = 11111111;
#1;
a = 11111000; 
#1;
$display("\nExercicio0037 - Silvino Henrique Santos de Souza - 412773");
$display("Test number system"); 
$display("\n2's COMPLEMENT"); 
$monitor("a = %8b = %8b", a, ac2);
a = 00000000;
#1;
a = 00000001;
#1;
a = 00100111;
#1;
a = 10100101;
#1;
a = 11111110;
#1;
a = 11111111;
#1;
a = 11111000; 
#1;
end
endmodule //