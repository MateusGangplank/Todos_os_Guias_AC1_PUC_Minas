// -----------------------------------------------------------------------------------------------------------------
// Guia 08 - Exericio 05 - Simplificação por Quine-McCluskey - f ( a, b, c, d ) = SoP ( m( 0, 2, 4, 8, 9, 11, 13 ) )
// usando portas NOR.
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -----------------------------------------------------------------------------------------------------------------

//---------------
//-- Not com Nor
//---------------

module notgate(s, a);

output s;
input a;

nor NOR1(s, a, a);

endmodule

//---------------
//-- And com Nor
//---------------

module andgate(s, a, b, c);

output s;
input a, b, c;

wire s1, s2, s3;

nor NOR1(s1, a, a);
nor NOR2(s2, b, b);
nor NOR3(s3, c, c);
nor NOR4(s, s1, s2, s3);

endmodule

//---------------
//-- Or com Nor
//---------------

module orgate(s, a, b, c, d, e);

output s;
input a, b, c, d, e;

wire s1;

nor NOR1(s1, a, b, c, d, e);
nor NOR2(s ,s1, s1, s1, s1, s1);

endmodule

//-----------------
//-- Simplificacao
//-----------------

module simplificacao(s0, a, b, c, d);

output s0;
input a, b, c, d;

wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;

andgate AND1(s12, s1, s2, s3);
andgate AND2(s13, s4, s5, s6);
andgate AND3(s14, s7, s8, s9);
andgate AND4(s15, a, s10, d);
andgate AND5(s16, a, s11, d);
orgate OR1(s0, s12, s13, s14, s15, s16);
notgate NOT1(s1, a);
notgate NOT2(s2, b);
notgate NOT3(s3, d);
notgate NOT4(s4, a);
notgate NOT5(s5, c);
notgate NOT6(s6, d);
notgate NOT7(s7, b);
notgate NOT8(s8, c);
notgate NOT9(s9, d);
notgate NOT10(s10, b);
notgate NOT11(s11, c);

endmodule //--fim module simplificacao


//-----------------------
//-- Teste Simplificacao
//-----------------------

module testesimplificacao;

reg a, b, c, d;
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;

//--instância
simplificacao SP1 (s0, a, b, c, d);

initial begin:start
a=0; b=0; c=0; d=0;    
end

//-- parte principal
initial begin:main
$display("Guia 08 - Exercicio 02 - Eduardo de Abreu Fortes - 384047");
$display("Simplificacao por Quine-McCluskey da funcao = f ( a, b, c, d ) = SoP ( m( 0, 2, 4, 8, 9, 11, 13 ) )");
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



