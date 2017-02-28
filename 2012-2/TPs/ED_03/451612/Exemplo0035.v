// -------------------------
// Exemplo0035 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Criar circuito
*/
module modulos;
//criar conexao
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s30;
//criar registradores
reg a;
reg b;
reg [2:0] chave;
//realizar testes
not teste0       ( s30, b );
not teste1       ( s0, a  );
or teste2        ( s1, a, b );
nor teste3       ( s2, a, b );
and teste4       ( s3, a, b );
nand teste5      ( s4, a, b );
xor teste6       ( s5, a, b );
xnor teste7      ( s6, a, b );
not teste8       ( s7, chave [0]   );
not teste9       ( s8, chave [1]   );
not teste10      ( s9, chave [2]   );
buf teste11      ( s10, chave [0]  );
buf teste12      ( s11, chave [1]  );
buf teste13      ( s12, chave [2]  );
and teste14      ( s13, s0, s7, s8, s9   );
and teste15      ( s14, s1, s10, s8, s9  );
and teste16      ( s15, s2, s7, s11, 29  );
and teste17      ( s16, s3, s10, s11, s9  );
and teste18      ( s17, s4, s7, s8, s12   );
and teste19      ( s18, s5, s10, s8, s12  );
and teste20      ( s19, s6, s10, s11, s12 );
and teste21      ( s20, s30, s7, s10, s12 );
or teste22       ( s21, s20, s13 );
or teste23       ( s22, s14, s15 );
or teste24       ( s23, s16, s17 );
or teste25       ( s24, s18, s19 );
or teste26       ( s25, s21, s22 );
or teste27       ( s26, s23, s24 );
or teste28       ( s27, s25, s26 );
//atribuir valor inicial
initial begin
a = 0;
b = 0;
chave = 3'b000;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0035");
$display ("Autor: Rodolfo Herman");
$display ("Test LU's module");
//projetar teste dos modulos

//NOT-A
chave = 3'b000;
a = 0;
b = 0;
$display ("\nchave = 000 \n(Porta NOT-A)");
#2 $display ( "a = %4b\t S = %4b ", a, s27 );
//mudar valor da chave

//OR
chave = 3'b001;
a = 1;
b = 0;
$display ("\nchave = 001 \n(Porta OR)");
#2 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s27 );

//NOR
chave = 3'b010;
b = 0;
a = 0;
$display ("\nchave = 010 \n(Porta NOR)");
#2 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s27 );

//AND
chave = 3'b011;
a = 1;
b = 1;
$display ("\nchave = 011 \n(Porta AND)");
#2 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s27 );

//NAND
chave = 3'b100;
a = 1;
b = 0;
$display ("\nchave = 100 \n(Porta NAND)");
#2 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s27 );
//mudar valor da chave

//XOR
chave = 3'b101;
a = 0;
b = 0;
$display ("\nchave = 101 \n(Porta XOR)");
#2 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s27 );

//NOT-B
chave = 3'b110;
b = 0;
a = 0;
$display ("\nchave = 110 \n(Porta NOT-B)");
#2 $display ( "b = %4b\t S = %4b ", a, b, s27 );

//XNOR
chave = 3'b111;
a = 1;
b = 1;
$display ("\nchave = 11 \n(Porta XNOR)");
#2 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s27 );
//terminar initial
end
//terminar
endmodule

// obs.: EXPERIMENTE USAR $monitor()