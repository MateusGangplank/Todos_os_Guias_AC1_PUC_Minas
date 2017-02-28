// -------------------------
// Exemplo0021 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Criar circuito
*/
module circuito;
//conexao
wire [14:0] s;
//registradores
reg [2:0] x, y;
reg carry;
//construir circuitos
//circuito 1
xor teste1 ( s[0], x[0], y[0] );
and teste2 ( s[1], x[0], x[0] );
xor teste3 ( s[2], s[0], carry );
and teste4 ( s[3], s[0], carry );
or teste5 ( s[4], s[1], s[3] );
//circuito 2
xor teste6 ( s[5], x[1], y[1] );
and teste7 ( s[6], x[1], x[1] );
xor teste8 ( s[7], s[4], s[5] );
and teste9 ( s[8], s[4], s[5] );
or teste10 ( s[9], s[6], s[8] );
//circuito 3
xor teste11 ( s[10], x[2], y[2] );
and teste12 ( s[11], x[2], x[2] );
xor teste13 ( s[12], s[9], s[10] );
and teste14 ( s[13], s[9], s[10] );
or teste15 ( s[14], s[13], s[11] );
//atribuir valor inicial
initial begin
x = 3'b011;
y = 3'b001;
carry = 0;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0021");
$display ("Autor: Rodolfo Herman - 451612");
$display ("Test ALU's somador");
//projetar teste dos modulos
#2 $display ( "%b + %b = %b%b%b%b", x, y, s[14], s[12], s[7], s[2] );
//mudar
x = 3'b011;
y = 3'b011;
#2 $display ( "%b + %b = %b%b%b%b", x, y, s[14], s[12], s[7], s[2] );
//mudar
x = 3'b011;
y = 3'b101;
#2 $display ( "%b + %b = %b%b%b%b", x, y, s[14], s[12], s[7], s[2] );
//terminar intial
end
//terminar
endmodule