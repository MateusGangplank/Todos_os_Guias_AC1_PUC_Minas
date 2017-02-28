// -------------------------
// Exemplo0034 - F4 Utilizando Chave
// Nome: Fábio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// f4_gate
// -------------------------


module f4 (output s, input a,input b, input [1:0]chave);

wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12;

//portas nativas(2 entradas)
xor xor1(s1, a, b);
or  or1 (s2, a, b);
xnor xnor1(s3, a, b);
nor  nor1 (s4, a, b);


//portas nativas utilizando chaves
and and2(s5, s1, chave[1]);
and and3(s6, s2, chave[1]);
and and4(s7, s3, ~chave[1]);
and and5(s8, s4, ~chave[1]);

or  or2 (s9, s5, s6);
or  or3 (s10, s7, s8);

and and6(s11, s9, chave[0]);
and and7(s12, s10, ~chave[0]);

or  or4 (s, s12, s11);


endmodule // f4
module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg [1:0]chave;
wire s;
f4 modulo (s, x, y, chave[1:0]);
// ------------------------- parte principal
initial begin
$display("Exemplo0034 - Fábio Fiuza Pereira - 406087");
$display("Test LU");

x = 0; y = 0; chave = 2'b00;

$monitor("x = %1b -- y = %1b chave1 = %2b Resultado = %1b",x,y,chave, s );

#1x = 0; y = 1; chave = 2'b00;
#1x = 1; y = 0; chave = 2'b00;
#1x = 1; y = 1; chave = 2'b00;

#1x = 0; y = 0; chave = 2'b01;
$display("\n");
#1x = 0; y = 1; chave = 2'b01;
#1x = 1; y = 0; chave = 2'b01;
#1x = 1; y = 1; chave = 2'b01;

#1x = 0; y = 0; chave = 2'b10;
$display("\n");
#1x = 0; y = 1; chave = 2'b10;
#1x = 1; y = 0; chave = 2'b10;
#1x = 1; y = 1; chave = 2'b10;

#1x = 0; y = 0; chave = 2'b11;
$display("\n");
#1x = 0; y = 1; chave = 2'b11;
#1x = 1; y = 0; chave = 2'b11;
#1x = 1; y = 1; chave = 2'b11;


end
endmodule // test_f4