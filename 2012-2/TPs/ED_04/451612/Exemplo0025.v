// -------------------------
// Exemplo0025 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Criar circuito
*/
module circuito;
//conexao
wire [3:0] s;
//registradores
reg [2:0] x;
//construir circuitos
or teste1 ( s[0], x[0], x[1] );
xor teste2 ( s[1], x[0], x[1] );
xor teste3 ( s[2], x[2], s[0] );
buf teste4 ( s[3], x[0] );
//atribuir valor inicial
initial begin
x = 3'b101;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0025");
$display ("Autor: Rodolfo Herman - 451612");
$display ("Test ALU's complemento 2");
//projetar teste dos modulos
#1 $display ( "\nX = %b\t Complemento2 = %b%b%b", x, s[2], s[1], s[3] );
//mudar valor
x = 3'b011;
#1 $display ( "\nX = %b\t Complemento2 = %b%b%b", x, s[2], s[1], s[3] );
//mudar valo
x = 3'b010;
#1 $display ( "\nX = %b\t Complemento2 = %b%b%b", x, s[2], s[1], s[3] );
//terminar intial
end
//terminar
endmodule