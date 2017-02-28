// ------------------------- 
// Exemplo0018 - Executar operações  
// Nome: Ítalo Guimarães Otoni	 
// Matricula: 451581 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a;
reg [3:0] b;
reg [2:0] c;
reg [4:0] d;
reg [3:0] e;
reg tmp; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0018 - Ítalo Guimarães Otoni - 451581"); 
a = ~'b101010 + 'b1;
b = ~'o25 + 'b1;
c = ~27 +'b1;
d = ~'h2C + 'b1;
e = ~(25-35) +'b1;
$display("Complemento de 2 :");
$display("101010(2) é : = %d = %b", a, a);
$display("25(8) = %d = %b", b, b);
$display("27(10) = %d = %b", c, c);
$display("2C(16) = %d = %b", d, d);
$display("25 - 35 = %d = %b", e, e); 
end
endmodule