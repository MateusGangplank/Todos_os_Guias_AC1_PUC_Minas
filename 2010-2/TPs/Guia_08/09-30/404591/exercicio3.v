// ---------------------
// Guia 08_03 - Implementar o circuito simplificado por Quine-McCluskey
// Nome: Márcia Cibele Martins Carneiro 
// Matricula: 404591
// -------------------------------------------------------------------------------------------------------------------------------

// Dados os mapas de Karnaugh para as entradas (a, b, c, d, e) respectivamente
// Implementar o circuito simplificado por Quine-McCluskey.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module funcao (s0, a, b, c, d, e);

output s0;
input a, b, c, d, e;
wire saida1, saida2, saida3, saida4, saida5, saida6, saida7, saida8, saida9, saida10, saida11, saida12, saida13;

not NOT1(saida1, a);
not NOT2(saida2, b);
not NOT3(saida3, c);
not NOT4(saida4, d);
not NOT5(saida5, e);

and AND1(saida6, a, saida2, saida3, d, saida5);
and AND2(saida7, a, b, d, e);
and AND3(saida8, saida1, saida3, saida4);
and AND4(saida9, saida2, saida4, e);
and AND5(saida10, saida2, c, saida4);
and AND6(saida11, c, d, e);
and AND7(saida12, b, c, e);
and AND8(saida13, b, c, d);

or OR1(s0, saida6, saida7, saida8, saida9, saida10, saida11, saida12, saida13);

endmodule

// ---------------------------------------------------------------------------------------------

module teste;

reg a, b, c, d, e;
wire s1;

funcao F2(s0, a, b, c, d, e);
initial begin: start

a=0;b=0;c=0;d=0; e=0;
end


initial begin: main
	$display("Guia 08 - Marcia Cibele Martins Carneiro - 404591");
	$display("Funcao S = ab'c'de'+ abde + a'c'd' + b'd'e + b'cd' + cde + bce + bcd");
	$monitor("%b %b %b %b %b = %b", a, b, c, d, e, s0);
		
#1 a=0;b=0;c=0;d=0;e=1;
#1 a=0;b=0;c=0;d=1;e=0;
#1 a=0;b=0;c=0;d=1;e=1;
#1 a=0;b=0;c=1;d=0;e=0;
#1 a=0;b=0;c=1;d=0;e=1;
#1 a=0;b=0;c=1;d=1;e=0;
#1 a=0;b=0;c=1;d=1;e=1;
#1 a=0;b=1;c=0;d=0;e=0;
#1 a=0;b=1;c=0;d=0;e=1;
#1 a=0;b=1;c=0;d=1;e=0;
#1 a=0;b=1;c=0;d=1;e=1;
#1 a=0;b=1;c=1;d=0;e=0;
#1 a=0;b=1;c=1;d=0;e=1;
#1 a=0;b=1;c=1;d=1;e=0;
#1 a=0;b=1;c=1;d=1;e=1;
#1 a=1;b=0;c=0;d=0;e=0;
#1 a=1;b=0;c=0;d=0;e=1;
#1 a=1;b=0;c=0;d=1;e=0;
#1 a=1;b=0;c=0;d=1;e=1;
#1 a=1;b=0;c=1;d=0;e=0;
#1 a=1;b=0;c=1;d=0;e=1;
#1 a=1;b=0;c=1;d=1;e=0;
#1 a=1;b=0;c=1;d=1;e=1;
#1 a=1;b=1;c=0;d=0;e=0;
#1 a=1;b=1;c=0;d=0;e=1;
#1 a=1;b=1;c=0;d=1;e=0;
#1 a=1;b=1;c=0;d=1;e=1;
#1 a=1;b=1;c=1;d=0;e=0;
#1 a=1;b=1;c=1;d=0;e=1;
#1 a=1;b=1;c=1;d=1;e=0;
#1 a=1;b=1;c=1;d=1;e=1;

end

endmodule

/* Resultado obtido

     ----jGRASP exec: D:\MeusDocumentos\2010-2_arq1_programas\Icarus_Verilog\bin\vvp exercicio3.vvp
    
    Guia 08 - Marcia Cibele Martins Carneiro - 404591
    Funcao S = ab'c'de'+ abde + a'c'd' + b'd'e + b'cd' + cde + bce + bcd
    0 0 0 0 0 = 1
    0 0 0 0 1 = 1
    0 0 0 1 0 = 0
    0 0 0 1 1 = 0
    0 0 1 0 0 = 1
    0 0 1 0 1 = 1
    0 0 1 1 0 = 0
    0 0 1 1 1 = 1
    0 1 0 0 0 = 1
    0 1 0 0 1 = 1
    0 1 0 1 0 = 0
    0 1 0 1 1 = 0
    0 1 1 0 0 = 0
    0 1 1 0 1 = 1
    0 1 1 1 0 = 1
    0 1 1 1 1 = 1
    1 0 0 0 0 = 0
    1 0 0 0 1 = 1
    1 0 0 1 0 = 1
    1 0 0 1 1 = 0
    1 0 1 0 0 = 1
    1 0 1 0 1 = 1
    1 0 1 1 0 = 0
    1 0 1 1 1 = 1
    1 1 0 0 0 = 0
    1 1 0 0 1 = 0
    1 1 0 1 0 = 0
    1 1 0 1 1 = 1
    1 1 1 0 0 = 0
    1 1 1 0 1 = 1
    1 1 1 1 0 = 1
    1 1 1 1 1 = 1
    
     ----jGRASP: operation complete.
*/