// ------------------------- 
// Exemplo0016 - Executar operações  
// Nome: Ítalo Guimarães Otoni	 
// Matricula: 451581 
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
$display("Exemplo0016 - Ítalo Guimarães Otoni - 451581");  
a = 3 + 14;
b = 3 * 8;
c = 33/5;
d = 25-11;
e = 2 * 8 + 7 - 1;
$display("3 + 14 = %d = %b", a, a);
$display("3 * 8 = %d = %b", b, b);
$display("33|5 = %d = %b", c, c);
$display("25-11 = %d = %b", d, d);
$display("2 * 8 + 7 - 1 = %d = %b", e, e); 
end
endmodule