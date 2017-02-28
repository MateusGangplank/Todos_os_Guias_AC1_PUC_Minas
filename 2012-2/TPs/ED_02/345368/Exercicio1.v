// -------------------------
// Exercício0021 - Operações
// Nome: Marcio Santana Correa	
// Matricula: 345368
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [4:0] c;
// -------------------------
// ------------------------- 

initial begin
$display("Exercício0021 - Marcio Santana Correa - 345368");
$display("Teste de Operações");
a=2;
b=14;
c=(a+b);
$display("Soma (2+14) = ");
$display("c = %d = %5b", c, c );
a=3;
b=9;
c=(a*b);
$display("Soma (3*9) = ");
$display("c = %d = %5b", c, c );
a=32;
b=5;
c=(a/b);
$display("Soma (32/5) = ");
$display("c = %d = %5b", c, c );
a=24;
b=11;
c=(a-b);
$display("Soma (24-11) = ");
$display("c = %d = %5b", c, c );
a=2;
b=6;
c=(a*b);
a=7;
b=1;
c=(c+a-b);

$display("Soma (2*6+7-1) = ");
$display("c = %d = %5b", c, c );

// -------------------------
end
endmodule
