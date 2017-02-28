//-------------------
// Exercicio0012 -- calculo binário
// Nome: Felipe Barros
// Matricula: 376508
// -------------------

module CalculoBinario;

// -- definir dados
reg[5:0] a;
reg[8:0] b;
reg[8:0] c;
reg[8:0] d;
reg[8:0] e;

//-- parte princpal
initial begin
$display ("Exercicio0012 - calculo binario ");
//-- questão
a= 6'b101010 + 5'b11010;
b= 5'b11010 + 5'o25;
c= 8'o1234 / 8'h2B;
d= 9'h1CA - 9'b101110001;
e= 6'o25 * 6'o31 + 6'h7A;

//-- resultado

$display ("/nresultado/n");
$display ("a=%6b", a);
$display ("b=%9b", b);
$display ("c=%9b", c);
$display ("d=%9b", d);
$display ("e=%9b", e);
end
endmodule