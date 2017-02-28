//------------------- 
// Exercicio0011
// Nome: Felipe Barros
// Matricula: 376508
//--------------------

module testebinario;

//---- definir dados
reg[4:0] a;
reg[4:0] b;
reg[3:0] c;
reg[4:0] d;
reg[3:0] e;


//--- parte principal
initial begin

a= 2+15;
b= 3*8;
c=32/3;
d=21-11;
e=(2*5)+6-1;

$display("\nresultado\n");
$display ("a=%5b", a);
$display ("b=%5b", b);
$display ("c=%5b", c);
$display ("d=%4b", d);
$display ("e=%4b", e);
end
endmodule
