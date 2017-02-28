/*
PUC-Minas - Instituto de Informática
ARQ1 Guia-08
Data de entrega: 27-30/09/2010

Tema: Circuitos lógicos
Aluno: Washington Luis			Matricula: 407456
*/

module simplificar (s, a, b, c, d);

input a, b, c, d;
output s, s0, s1, s2;

and AND1 (s0, a, b, ~d);
and AND2 (s1, a, ~b, c);
and AND3 (s2, ~a, c);

or OR1 (s, s0, s1, s2);

//f1 = (ab~d) + (a~bc) + (~ac)

endmodule

module teste;

reg a, b, c, d;
wire s;

simplificar SMP1 (s, a, b, c, d);

initial
begin

$display ("Teste Quine-McCluskey - Exercicio 01");
$display ("");
$display ("f (a, b, c, d) = s");
$monitor ("f (%b, %b, %b, %b) = %b", a, b, c, d, s);

	a = 0; b = 0; c = 0; d = 0;
#1 a = 0; b = 0; c = 0; d = 1;
#1 a = 0; b = 0; c = 1; d = 0;
#1 a = 0; b = 0; c = 1; d = 1;
#1 a = 0; b = 1; c = 0; d = 0;
#1 a = 0; b = 1; c = 0; d = 1;
#1 a = 0; b = 1; c = 1; d = 0;
#1 a = 0; b = 1; c = 1; d = 1;
#1 a = 1; b = 0; c = 0; d = 0;
#1 a = 1; b = 0; c = 0; d = 1;
#1 a = 1; b = 0; c = 1; d = 0;
#1 a = 1; b = 0; c = 1; d = 1;
#1 a = 1; b = 1; c = 0; d = 0;
#1 a = 1; b = 1; c = 0; d = 1;
#1 a = 1; b = 1; c = 1; d = 0;
#1 a = 1; b = 1; c = 1; d = 1;

end

endmodule//teste

/*
Teste Quine-McCluskey - Exercicio 01
    
    f (a, b, c, d) = s
    f (0, 0, 0, 0) = 0
    f (0, 0, 0, 1) = 0
    f (0, 0, 1, 0) = 1
    f (0, 0, 1, 1) = 1
    f (0, 1, 0, 0) = 0
    f (0, 1, 0, 1) = 0
    f (0, 1, 1, 0) = 1
    f (0, 1, 1, 1) = 1
    f (1, 0, 0, 0) = 0
    f (1, 0, 0, 1) = 0
    f (1, 0, 1, 0) = 1
    f (1, 0, 1, 1) = 1
    f (1, 1, 0, 0) = 1
    f (1, 1, 0, 1) = 0
    f (1, 1, 1, 0) = 1
    f (1, 1, 1, 1) = 0
   
    */