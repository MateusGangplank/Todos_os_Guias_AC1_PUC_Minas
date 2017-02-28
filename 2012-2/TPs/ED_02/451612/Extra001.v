// -------------------------
// Extra 001 - OPERAÇÕES
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 1.0
// -------------------------
// -------------------------

// -------------------------
// -- Porta NOT
// -------------------------
module pnot (output [0:7] s, input [0:7] p);
// Associar a saida com a contrapositiva da entrada
assign s = ~p;
//terminar
endmodule

/**
* Testar porta
*/
module testador;
// Criar registrador
reg [0:7] a;
// Criar (fio)
wire [0:7] s;
// Definir dados
integer contar;
//instancia
pnot NOT1 (s, a);
// Atribuir valor inicial
initial begin
a= 8'b00000000; // valor inicial
//terminar initial
end

/**
* Main parte principal
*/
initial begin
//Identificaçao
$display ( "Extra 01" );
$display ( "Autor : Rodolfo Herman - 451612" );
$display("\n\t\tCOMPLEMENTO 1\n");
//Atribuir repetiçao
contar = 5;
//Iniciar repetiçao
repeat ( contar ) begin
// Msotrar
#1 $display("Complemento1 de %d :  %8b = %b", a, a, s);
//Acrescentar + 1
a = a + 8'b00000001;
//passar para proximo
contar = contar -1;
//terminar repetiçao
end
//terminar initial
end
//terminar
endmodule

/**
* Documentação
*/

/**
* Versão 1.0
* O exercicio solicitou o complemento 1 ( C1 ) de um numero qualquer de 8-bits. Para realizar a operçao foi feito um modulo da porta NOT
* sendo que a negaçao do numero resulta emseu complemento. Para testar mais de um valor foi criado uma repetiçao.
* Apos testes com os numeros 8'b00000000, 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000111, os resultados foram os esperados para o seu complemento 1 ( C1 ).
*/