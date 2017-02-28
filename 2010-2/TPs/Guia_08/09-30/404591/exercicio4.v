// Guia 08_04 - Circuito 01 utilizando apenas portas NAND
// Nome: Márcia Cibele Martins Carneiro 
// Matricula: 404591
// -------------------------------------------------------------------------------------------------------------------------------

// REFAZER o circuito 01 utilizando apenas portas NAND.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module funcao (s0, a, b, c, d);

output s0;
input a, b, c, d;
wire saida1, saida2, saida3, saida4, saida5, saida6;

nand NAND1(saida1, a, a);
nand NAND2(saida2, b, b);
nand NAND3(saida3, d, d);
nand NAND4(saida4, saida1, c);
nand NAND5(saida5, saida2, c);
nand NAND6(saida6, a, b, saida3);
nand NAND7(s0, saida4, saida5, saida6);

endmodule 

module teste;

reg a, b, c, d;
wire s0, saida1, saida2, saida3, saida4, saida5, saida6;

funcao F1 (s0, a, b, c, d);

initial begin:start

a=0; b=0; c=0; d=0; 
end

initial begin: main
	$display("Guia 08 - Marcia Cibele Martins Carneiro - 404591");
	$monitor("%b %b %b %b = %b", a, b, c, d, s0);
		
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

endmodule

/* Resultado obtido
     ----jGRASP exec: D:\MeusDocumentos\2010-2_arq1_programas\Icarus_Verilog\bin\vvp exercicio4.vvp
    
    Guia 08 - Marcia Cibele Martins Carneiro - 404591
    0 0 0 0 = 0
    0 0 0 1 = 0
    0 0 1 0 = 1
    0 0 1 1 = 1
    0 1 0 0 = 0
    0 1 0 1 = 0
    0 1 1 0 = 1
    0 1 1 1 = 1
    1 0 0 0 = 0
    1 0 0 1 = 0
    1 0 1 0 = 1
    1 0 1 1 = 1
    1 1 0 0 = 1
    1 1 0 1 = 0
    1 1 1 0 = 1
    1 1 1 1 = 0
    
     ----jGRASP: operation complete.
 */