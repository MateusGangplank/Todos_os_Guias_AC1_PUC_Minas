// -------------------------
// Exemplo0024 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Criar circuito
*/
module circuito;
//conexao
wire [4:0] s;
//registradores
reg [2:0] x, y;
reg carry;
//construir circuitos
xor teste1 ( s[0], x[0], y[0] );
xor teste2 ( s[1], x[1], y[1] );
xor teste3 ( s[2], x[2], y[2] );
or  teste4 ( s[3], s[0], s[1] );
or  teste5 ( s[4], s[2], s[3] );
//atribuir valor inicial
initial begin
x = 3'b000;
y = 3'b000;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0024");
$display ("Autor: Rodolfo Herman - 451612");
$display ("\nTeste LU comparador Diferença\n");
$display ("Saida = 1 - diferentes  |  Saida = 0 - iguais");
//projetar teste dos modulos
$monitor ( "a = %b\t b = %b\t saida = %b", x, y, s[4] );
//mudar
#1 x = 3'b101; y = 3'b100;
//mudar
#1 x = 3'b101; y = 3'b011;
//mudar
#1 x = 3'b101; y = 3'b101;
//mudar
#1 x = 3'b101; y = 3'b111;
//mudar
#1 x = 3'b111; y = 3'b111;
//terminar intial
end
//terminar
endmodule
