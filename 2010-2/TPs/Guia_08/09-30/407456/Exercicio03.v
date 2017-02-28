/*
PUC-Minas - Instituto de Informática
ARQ1 Guia-08
Data de entrega: 27-30/09/2010

Tema: Circuitos lógicos
Aluno: Washington Luis			Matricula: 407456
*/

module simplificar (s, a, b, c, d, e);

	input a, b, c, d, e;
	output s, s0, s1, s2, s3, s4, s5, s6, s7;
	
	and AND1 (s0, a, ~b, ~c, d, ~e);
	and AND2 (s1, b, c, d);
	and AND3 (s2, ~a, ~c, ~d);
	and AND4 (s3, ~b, c, ~d, ~e);
	and AND5 (s4, ~b, c, d, e);
	and AND6 (s5, a, b, d, e);
	and AND7 (s6, c, ~d, e);
	and AND8 (s7, ~b, ~c, ~d, e);
	or OR1 (s, s0, s1, s2, s3, s4, s5, s6, s7);	

	//f3 = (a~b~cd~e) + (~b~c~de) + (~bc~d~e) + (c~de) + (~bcde) + (bcd) + (~a~c~d) + (abde)
	
endmodule

module teste;

	reg a, b, c, d, e;
	wire s;

	simplificar SMP1 (s, a, b, c, d, e);

	initial
	begin

$display ("Teste Quine-McCluskey - Exercicio 03");
$display ("");
$display ("f (a, b, c, d, e) = s");
$monitor ("f (%b, %b, %b, %b, %b) = %b", a, b, c, d, e, s);

	a = 0; b = 0; c = 0; d = 0; e = 0;
#1 a = 0; b = 0; c = 0; d = 0; e = 1;
#1 a = 0; b = 0; c = 0; d = 1; e = 0;
#1 a = 0; b = 0; c = 0; d = 1; e = 1;
#1 a = 0; b = 0; c = 1; d = 0; e = 0;
#1 a = 0; b = 0; c = 1; d = 0; e = 1;
#1 a = 0; b = 0; c = 1; d = 1; e = 0;
#1 a = 0; b = 0; c = 1; d = 1; e = 1;
#1 a = 0; b = 1; c = 0; d = 0; e = 0;
#1 a = 0; b = 1; c = 0; d = 0; e = 1;
#1 a = 0; b = 1; c = 0; d = 1; e = 0;
#1 a = 0; b = 1; c = 0; d = 1; e = 1;
#1 a = 0; b = 1; c = 1; d = 0; e = 0;
#1 a = 0; b = 1; c = 1; d = 0; e = 1;
#1 a = 0; b = 1; c = 1; d = 1; e = 0;
#1 a = 0; b = 1; c = 1; d = 1; e = 1;
#1	a = 1; b = 0; c = 0; d = 0; e = 0;
#1 a = 1; b = 0; c = 0; d = 0; e = 1;
#1 a = 1; b = 0; c = 0; d = 1; e = 0;
#1 a = 1; b = 0; c = 0; d = 1; e = 1;
#1 a = 1; b = 0; c = 1; d = 0; e = 0;
#1 a = 1; b = 0; c = 1; d = 0; e = 1;
#1 a = 1; b = 0; c = 1; d = 1; e = 0;
#1 a = 1; b = 0; c = 1; d = 1; e = 1;
#1 a = 1; b = 1; c = 0; d = 0; e = 0;
#1 a = 1; b = 1; c = 0; d = 0; e = 1;
#1 a = 1; b = 1; c = 0; d = 1; e = 0;
#1 a = 1; b = 1; c = 0; d = 1; e = 1;
#1 a = 1; b = 1; c = 1; d = 0; e = 0;
#1 a = 1; b = 1; c = 1; d = 0; e = 1;
#1 a = 1; b = 1; c = 1; d = 1; e = 0;
#1 a = 1; b = 1; c = 1; d = 1; e = 1;

end

endmodule//teste

/*
    Teste Quine-McCluskey - Exercicio 03
    
    f (a, b, c, d, e) = s
    f (0, 0, 0, 0, 0) = 1
    f (0, 0, 0, 0, 1) = 1
    f (0, 0, 0, 1, 0) = 0
    f (0, 0, 0, 1, 1) = 0
    f (0, 0, 1, 0, 0) = 1
    f (0, 0, 1, 0, 1) = 1
    f (0, 0, 1, 1, 0) = 0
    f (0, 0, 1, 1, 1) = 1
    f (0, 1, 0, 0, 0) = 1
    f (0, 1, 0, 0, 1) = 1
    f (0, 1, 0, 1, 0) = 0
    f (0, 1, 0, 1, 1) = 0
    f (0, 1, 1, 0, 0) = 0
    f (0, 1, 1, 0, 1) = 1
    f (0, 1, 1, 1, 0) = 1
    f (0, 1, 1, 1, 1) = 1
    f (1, 0, 0, 0, 0) = 1
    f (1, 0, 0, 0, 1) = 1
    f (1, 0, 0, 1, 0) = 1
    f (1, 0, 0, 1, 1) = 0
    f (1, 0, 1, 0, 0) = 1
    f (1, 0, 1, 0, 1) = 1
    f (1, 0, 1, 1, 0) = 0
    f (1, 0, 1, 1, 1) = 1
    f (1, 1, 0, 0, 0) = 0
    f (1, 1, 0, 0, 1) = 0
    f (1, 1, 0, 1, 0) = 0
    f (1, 1, 0, 1, 1) = 1
    f (1, 1, 1, 0, 0) = 0
    f (1, 1, 1, 0, 1) = 1
    f (1, 1, 1, 1, 0) = 1
    f (1, 1, 1, 1, 1) = 1
   
	*/
	/*
	Teste Quine-McCluskey - Exercicio 03
    
    f (a, b, c, d, e) = s
    f (0, 0, 0, 0, 0) = 1
    f (0, 0, 0, 0, 1) = 1
    f (0, 0, 0, 1, 0) = 0
    f (0, 0, 0, 1, 1) = 0
    f (0, 0, 1, 0, 0) = 1
    f (0, 0, 1, 0, 1) = 1
    f (0, 0, 1, 1, 0) = 0
    f (0, 0, 1, 1, 1) = 1
    f (0, 1, 0, 0, 0) = 1
    f (0, 1, 0, 0, 1) = 1
    f (0, 1, 0, 1, 0) = 0
    f (0, 1, 0, 1, 1) = 0
    f (0, 1, 1, 0, 0) = 0
    f (0, 1, 1, 0, 1) = 1
    f (0, 1, 1, 1, 0) = 1
    f (0, 1, 1, 1, 1) = 1
    f (1, 0, 0, 0, 0) = 0
    f (1, 0, 0, 0, 1) = 1
    f (1, 0, 0, 1, 0) = 1
    f (1, 0, 0, 1, 1) = 0
    f (1, 0, 1, 0, 0) = 1
    f (1, 0, 1, 0, 1) = 1
    f (1, 0, 1, 1, 0) = 0
    f (1, 0, 1, 1, 1) = 1
    f (1, 1, 0, 0, 0) = 0
    f (1, 1, 0, 0, 1) = 0
    f (1, 1, 0, 1, 0) = 0
    f (1, 1, 0, 1, 1) = 1
    f (1, 1, 1, 0, 0) = 0
    f (1, 1, 1, 0, 1) = 1
    f (1, 1, 1, 1, 0) = 1
    f (1, 1, 1, 1, 1) = 1
    */