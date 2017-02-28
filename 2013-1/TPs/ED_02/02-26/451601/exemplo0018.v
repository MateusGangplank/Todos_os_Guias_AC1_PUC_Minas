// ------------------------- 
// Exemplo0018 - Executar operações  
// Nome: Matheus Filipe Sieiro Vargas	 
// Matricula: 451601 
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
$display("Exemplo0011 - Matheus Filipe Sieiro Vargas - 451601"); 
$display("Operações básicas em binario"); 
a = ~'b101010 + 'b1;
b = ~'o25 + 'b1;
c = ~27 +'b1;
d = ~'h2C + 'b1;
e = ~(25-35) +'b1;
$display("Somas:");
$display(" O complemento de 2 de :101010(2) é : = %d = %b", a, a);
$display("O complemento de 2 de :25(8) = %d = %b", b, b);
$display("O complemento de 2 de :27(10) = %d = %b", c, c);
$display("O complemento de 2 de :2C(16) = %d = %b", d, d);
$display("O complemento de 2 de :25 - 35 = %d = %b", e, e); 
end
endmodule