// -----------------------------------------------------------------------------------------------------------------------
// Guia 08 - Exericio 01 - Simplificação por Quine-McCluskey - f ( a, b, c, d ) = SoP ( m( 2, 3, 6, 7, 10, 11, 12, 14 ) )
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -----------------------------------------------------------------------------------------------------------------------

//-----------------
//-- Simplificacao
//-----------------

module simplificacao(s0, a, b, c, d);

output s0;
input a, b, c, d;

wire s1, s2, s3, s4, s5, s6;

and AND1(s4, s1, c);
and AND2(s5, s2, c);
and AND3(s6, a, b, s3);
or OR1(s0, s4, s5, s6);
not NOT1(s1, a);
not NOT2(s2, b);
not NOT3(s3, d);

endmodule //--fim module simplificacao

//-----------------------
//-- Teste Simplificacao
//-----------------------

module testesimplificacao;

reg a, b, c, d;
wire s0, s1, s2, s3, s4, s5, s6;

//--instância
simplificacao SP1 (s0, a, b, c, d);

initial begin:start
a=0; b=0; c=0; d=0;    
end

//-- parte principal
initial begin:main
$display("Guia 08 - Exercicio 01 - Eduardo de Abreu Fortes - 384047");
$display("Simplificacao por Quine-McCluskey da funcao = f ( a, b, c, d ) = SoP ( m( 2, 3, 6, 7, 10, 11, 12, 14 ) )");
$display("\na b c d = s0\n");
$monitor("%b %b %b %b = %b", a, b, c, d, s0);
#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;

end
 
endmodule //-- fim teste simplificacao






