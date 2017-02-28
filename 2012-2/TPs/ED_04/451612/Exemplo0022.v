// -------------------------
// Exemplo0022 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Criar circuito
*/
module circuito;
//conexao
wire [20:0] s;
//registradores
reg [2:0] x, y;
reg carry;
//construir circuitos
//circuito 1
not teste1 ( s[0], x[0]);
xor teste2 ( s[1], x[0], y[0] );
and teste3 ( s[2], s[0], y[0] );
xor teste4 ( s[3], s[1], carry );
not teste5 ( s[4], s[1]);
and teste6 ( s[5], s[4], carry );
or teste7 ( s[6], s[5], s[2]);
//circuito 2
not teste8 ( s[7], x[1]);
xor teste9 ( s[8], x[1], y[1] );
and teste10 ( s[9], s[7], y[1] );
xor teste11 ( s[10], s[6], s[8] );
not teste12 ( s[11], s[8]);
and teste13 ( s[12], s[6], s[11] );
or teste14 ( s[13], s[9], s[12]);
//circuito 3
not teste15 ( s[14], x[2]);
xor teste16 ( s[15], x[2], y[2] );
and teste17 ( s[16], s[14], y[2] );
xor teste18 ( s[17], s[13], s[15] );
not teste19 ( s[18], s[15]);
and teste20 ( s[19], s[13], s[18] );
or teste21 ( s[20], s[19], s[16]);
//atribuir valor inicial
initial begin
x = 3'b101;
y = 3'b010;
carry = 0;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0022");
$display ("Autor: Rodolfo Herman - 451612");
$display ("Test ALU's subtrator");
//projetar teste dos modulos
#2 $display ( "%b - %b = %b%b%b%b", x, y, s[20], s[17], s[10], s[3] );
//mudar
x = 3'b101;
y = 3'b100;
#2 $display ( "%b - %b = %b%b%b%b", x, y, s[20], s[17], s[10], s[3] );
//mudar
x = 3'b101;
y = 3'b011;
#2 $display ( "%b - %b = %b%b%b%b", x, y, s[20], s[17], s[10], s[3] );
//terminar intial
end
//terminar
endmodule