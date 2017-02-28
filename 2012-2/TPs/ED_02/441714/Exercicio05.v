// -------------------------
// Exercicio 05 - Subtração com Complemento de 2 e complimento de bits
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display(" Exercicio 05 - Yousef - 441714");
$display("Test number system");

 a = 8'b101010 + (~8'b1001 + 1'b1); 
 
 b = 8'b11011 + (~8'o15 + 1'b1); 
			
 c = 8'o34 + (~8'hC + 1'b1); 
			
 d = 8'hDA + (~8'b10111001 + 1'b1); 
			
 e = 8'd27 + (~8'h1B + 1'b1); 



$display("\nSubtração dos Valores");
$display("a = %d = %8b", a, a);
$display("b = %d = %8b", b, b);
$display("c = %d = %8b", c, c);
$display("d = %d = %8b", d, d);
$display("e = %d = %8b", e, e);



end
endmodule // test_base