/*
PUC-Minas - Instituto de Informática
ARQ1 Guia-05
Data de entrega:  30/08-03/09/2010
Nome: Washington Luis de Souza Ramos
Matricula: 407456
Prof.: Theldo Cruz
*/

module fullSubtractor (s0, c0, a, b, c);

input a, b, c;
output s0, c0;

xor (s1, a, c);
and (c1, ~a, c);
xor (s0, s1, b);
and (c2, ~s1, b);
or (c0, c2, c1);

endmodule//fullSubtractor

module halfSubtractor (s0, c0, a, b);

input a, b;
output s0, c0;

xor (s0, a, b);
and (c0, ~a, b);

endmodule//halfSubtractor

module teste;

reg a0, b0, a1, b1, a2, b2;
wire c0, c1, c2, s0, s1, s2;

halfSubtractor HS1 (s0, c0, a0, b0);
fullSubtractor FS1 (s1, c1, a1, b1, c0);
fullSubtractor FS2 (s2, c2, a2, b2, c1);

initial
begin
$display ("Full-Subtractor Gate Test");
$display ("Exercicio 02");
$display ("\n Nome: Washington Luis \n Matricula: 407456 \n");
$display ("(abc - cde) = resultado, vemUm\n");

	a2 = 0; a1 = 0; a0 = 0; b2 = 0; b1 = 0; b0 = 0;
$monitor ("(%b%b%b - %b%b%b) = %b%b%b, %b", a2, a1, a0, b2, b1, b0, s2, s1, s0, c2);

#1 a2 = 0; a1 = 0; a0 = 1; b2 = 1; b1 = 0; b0 = 1;
#1 a2 = 0; a1 = 1; a0 = 0; b2 = 0; b1 = 1; b0 = 0;
#1 a2 = 0; a1 = 1; a0 = 1; b2 = 1; b1 = 1; b0 = 0;
#1 a2 = 1; a1 = 0; a0 = 0; b2 = 0; b1 = 0; b0 = 0;
#1 a2 = 1; a1 = 0; a0 = 1; b2 = 0; b1 = 1; b0 = 1;
#1 a2 = 1; a1 = 1; a0 = 0; b2 = 0; b1 = 0; b0 = 0;
#1 a2 = 1; a1 = 1; a0 = 1; b2 = 0; b1 = 0; b0 = 1;

end

endmodule//teste
