// -------------------------
// Exemplo0037 - CIRCUITOS GUIA 05
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------


/**
* Criar somador/Subtrator, recebendo o sinal
*/
module somsub ( output s, output cout, input x, input y, input sinal );
//criar fio
wire [3:0] saida;
//criar circuito
xor teste1 ( saida[0], y       , sinal    );
xor teste2 ( saida[1], x       , saida[0] );
xor teste3 ( s       , saida[1], sinal    );
and teste4 ( saida[2], sinal   , saida[1] );
and teste5 ( saida[3], saida[0], x        );
or  teste6 ( cout    , saida[2], saida[3] );
//terminar modulo
endmodule

/**
*recebe carry in + sinal
*/
module somsub1 ( output s, output cout, input x, input y, input sinal, input carry );
//criar fio
wire [3:0] saida;
//criar circuito
xor teste7  ( saida[0], y       , sinal    );
xor teste8  ( saida[1], x       , saida[0] );
xor teste9  ( s       , saida[1], carry    );
and teste10 ( saida[2], carry   , saida[1] );
and teste11 ( saida[3], saida[0], x        );
or  teste12 ( cout    , saida[2], saida[3] );
//terminar modulo
endmodule

//criar circuito
module circuito;
//criar regsitradores
reg [2:0] x;
reg [2:0] y;
reg sinal;
//criar fio
wire [10:0] s;
//criar circuito
somsub  teste13 ( s[0], s[1] , x[0], y[0], sinal       );
somsub1 teste14 ( s[2], s[3] , x[1], y[1], sinal, s[1] );
somsub1 teste15 ( s[4], s[5] , x[2], y[2], sinal, s[3] );
xor     teste16 ( s[6], sinal, s[5]                    );
//verificar se e' igual a zero (1) ou diferente de zero (0)
nor     teste17 ( s[7], s[6] , s[4], s[2], s[0]        );
//verificar carry
xor     teste18 ( s[8], sinal, s[5]                    );
//verificar overflow
xor     teste19 ( s[9], s[6] , s[4]                    );
//verificar se eh positivo ou negativo
and     teste20 ( s[10], sinal, s[6]                   );
//atribuir valor inicial
initial begin
x = 3'b000;
y = 3'b000;
sinal = 0;
//terminar initial
end

//parte principal
initial begin
//identificaçao
$display ( "Exemplo 0037" );
$display ( "Autor: Rodolfo Herman - 451612" );
$display ( "\n Somador/Subtrator\tZero = 1\t\t\t\t\t\t\t\tNegativo = 1\n" );
#2 $display ( "%3b + %3b = %b%b%b%b \tzero = %b \tcarry = %b \t overflow = %b \t Negativo = %b ", x, y, s[6], s[4], s[2], s[0], s[7], s[8], s[9], s[10] );
//mudar valor
x = 3'b010;
y = 3'b011;
sinal = 0;
#2 $display ( "%3b + %3b = %b%b%b%b \tzero = %b \tcarry = %b \t overflow = %b \t Negativo = %b ", x, y, s[6], s[4], s[2], s[0], s[7], s[8], s[9], s[10] );
//mudar valor
x = 3'b101;
y = 3'b101;
sinal = 0;
#2 $display ( "%3b + %3b = %b%b%b%b \tzero = %b \tcarry = %b \t overflow = %b \t Negativo = %b ", x, y, s[6], s[4], s[2], s[0], s[7], s[8], s[9], s[10] );
//mudar valor
x = 3'b010;
y = 3'b011;
sinal = 1;
#2 $display ( "%3b -  %3b = %b%b%b%b \tzero = %b \tcarry = %b \t overflow = %b \t Negativo = %b ", x, y, s[6], s[4], s[2], s[0], s[7], s[8], s[9], s[10] );
//mudar valor
x = 3'b101;
y = 3'b100;
sinal = 1;
#2 $display ( "%3b -  %3b = %b%b%b%b \tzero = %b \tcarry = %b \t overflow = %b \t Negativo = %b ", x, y, s[6], s[4], s[2], s[0], s[7], s[8], s[9], s[10] );
//mudar valor
x = 3'b101;
y = 3'b110;
sinal = 1;
#2 $display ( "%3b -  %3b = %b%b%b%b \tzero = %b \tcarry = %b \t overflow = %b \t Negativo = %b ", x, y, s[6], s[4], s[2], s[0], s[7], s[8], s[9], s[10] );
//terminar initial
end
//terminar
endmodule