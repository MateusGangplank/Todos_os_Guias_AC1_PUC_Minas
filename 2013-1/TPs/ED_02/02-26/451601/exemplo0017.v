// ------------------------- 
// Exemplo0017 - Executar operações  
// Nome: Matheus Filipe Sieiro Vargas	 
// Matricula: 451601 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [6:0] a;
reg [4:0] b;
reg [3:0] c;
reg [2:0] d;
reg [4:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Matheus Filipe Sieiro Vargas - 451601"); 
$display("Operações básicas em binario"); 
a = 'b100110 + 'b11011;
b = 'b11101 + 'o25;
c = 'o1234/'h4C;
d = 'h1BA - 'b101110011;
e = 25 + 'o32 + 'h8A;
$display("Somas:");
$display("100110(2) + 11011(2) = %d = %b", a, a);
$display("11101(2) + 25(8) = %d = %b", b, b);
$display("1234(8) / 4C(16) = %d = %b", c, c);
$display("1BA(16) - 101110011(2) = %d = %b", d, d);
$display("25 * 32(8) + 8A(16) = %d = %b", e, e); 
end
endmodule