// -------------------------
// Exemplo0032 - F2
// Nome: �talo Guimar�es Otoni
// Matricula: 451581
// -------------------------

module F2 (output s, input a, input b, input chave);

wire s1,s2,s3,s4,c1,c2;

not not0 (c1,chave);
buf buf0 (c2,chave);

or or0 (s1,a,b);
or or1 (s,s3,s4);

and and0 (s2,a,b);
and and1 (s3,s1,c1);
and and2 (s4,s2,c2);

endmodule

module TESTE;

reg x;
reg y;
wire z;

initial begin
x='b0;
y='b0;
end

F2 portas (z,x,y,0);

initial begin

$display("Exercicio0032 - �talo Guimar�es Otoni - 451581");
$display("\n");
$display("x | y = z");


$monitor("%b | %b = %b",x,y,z);
#1 x='b1;
#1 x='b0;y='b1;
#1 x='b1;
end
endmodule