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
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
reg tmp; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Matheus Filipe Sieiro Vargas - 451601"); 
$display("Operações básicas em binario"); 
a = 'b101011 + (~'b1001 +'b1);
b = 'b10011 + (~'o15 + 'b1);
c = 'o35 + (~'hC + 'b1);
d = 'hBA + (~'b10111001 + 'b1);
e = 37 + (~'h1B + 'b1);
$display("Somas:");
$display("O complemento de 2 de :  = %b", a);
$display("O complemento de 2 de :  = %b", b);
$display("O complemento de 2 de :  = %b", c);
$display("O complemento de 2 de :  = %b", d);
$display("O complemento de 2 de :  = %b", e); 
end
endmodule