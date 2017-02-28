// ------------------------- 
// Exemplo0016 - Executar operações  
// Nome: Matheus Filipe Sieiro Vargas	 
// Matricula: 451601 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Matheus Filipe Sieiro Vargas - 451601"); 
$display("Operações básicas"); 
a = 3 + 14;
b = 3 * 8;
c = 33/5;
d = 25-11;
e = 2 * 8 + 7 - 1;
$display("Somas:");
$display("3 + 14 = %d = %3b", a, a);
$display("3 * 8 = %d = %3b", b, b);
$display("33|5 = %d = %3b", c, c);
$display("25-11 = %d = %3b", d, d);
$display("2 * 8 + 7 - 1 = %d = %3b", e, e); 
end
endmodule