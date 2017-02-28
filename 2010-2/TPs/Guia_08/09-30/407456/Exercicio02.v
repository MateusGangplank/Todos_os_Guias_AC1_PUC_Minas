/*
PUC-Minas - Instituto de Informática
ARQ1 Guia-08
Data de entrega: 27-30/09/2010

Tema: Circuitos lógicos
Aluno: Washington Luis			Matricula: 407456
*/

module simplificar (s, a, b, c, d);

	input a, b, c, d;
	output s, s0, s1, s2, s3, s4, s5;	

	xnor XNOR1 (s0, a, d);
	and AND1 (s1, a, ~b);
	or OR1 (s2, s0, s1);
	and AND2 (s3, ~c, s2);
	and AND3 (s4, ~b, s0);
	or OR2 (s, s3, s4);

	//f2 = ( ~c( ~(a^d) + (a~b) ) ) + ( ~b ( ~(a^d) ) )

endmodule

module teste;

	reg a, b, c, d;
	wire s;

	simplificar SMP1 (s, a, b, c, d);

	initial
	begin

$display ("Teste Quine-McCluskey - Exercicio 02");
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
    Teste Quine-McCluskey - Exercicio 02
    
    f (a, b, c, d) = s
    f (0, 0, 0, 0) = 1
    f (0, 0, 0, 1) = 0
    f (0, 0, 1, 0) = 1
    f (0, 0, 1, 1) = 0
    f (0, 1, 0, 0) = 1
    f (0, 1, 0, 1) = 0
    f (0, 1, 1, 0) = 0
    f (0, 1, 1, 1) = 0
    f (1, 0, 0, 0) = 1
    f (1, 0, 0, 1) = 1
    f (1, 0, 1, 0) = 0
    f (1, 0, 1, 1) = 1
    f (1, 1, 0, 0) = 0
    f (1, 1, 0, 1) = 1
    f (1, 1, 1, 0) = 0
    f (1, 1, 1, 1) = 0
    */