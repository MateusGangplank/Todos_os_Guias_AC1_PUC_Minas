// ------------------------- 
// Exemplo0019 - Executar operações  
// Nome: Matheus Filipe Sieiro Vargas	 
// Matricula: 451601 
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
$display("Exemplo0011 - Matheus Filipe Sieiro Vargas - 451601"); 
$display("Operações básicas em binario"); 
a = ~101111 + 'b1;
b = ~111001 + 'b1;
c = ~25 + 'b1;
d = ~'hD + 'b1;
e = ~'o24 + 'b1;
$display("Somas:");
$display(" O complemento de 2 de :101111(2) é : = %d = %b", a, a);
$display("O complemento de 2 de :321(4) = %d = %b", b, b);
$display("O complemento de 2 de :25(10) = %d = %b", c, c);
$display("O complemento de 2 de :D(16) = %d = %b", d, d);
$display("O complemento de 2 de :24(8) = %d = %b", e, e); 
end
endmodule