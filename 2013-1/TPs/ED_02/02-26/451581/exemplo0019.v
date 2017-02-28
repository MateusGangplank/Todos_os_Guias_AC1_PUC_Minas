// ------------------------- 
// Exemplo0019 - Executar operações  
// Nome: Ítalo Guimarães Otoni	 
// Matricula: 451581 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;
reg tmp; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0019 - Ítalo Guimarães Otoni - 451581");  
a = ~101111 + 'b1;
b = ~111001 + 'b1;
c = ~25 + 'b1;
d = ~'hD + 'b1;
e = ~'o24 + 'b1;
$display("Complemento de 2 :");
$display("101111(2) é : = %d = %b", a, a);
$display("321(4) = %d = %b", b, b);
$display("25(10) = %d = %b", c, c);
$display("D(16) = %d = %b", d, d);
$display("24(8) = %d = %b", e, e); 
end
endmodule