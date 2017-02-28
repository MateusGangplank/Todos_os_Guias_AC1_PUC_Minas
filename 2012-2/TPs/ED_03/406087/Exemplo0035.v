// -------------------------
// Exemplo0035- F4 Utilizando Chave
// Nome: Fábio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// f4_gate
// -------------------------


module f4 (output s, input a,input b, input [2:0]chave);

wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;

xor xor1(s1, a, b);
or  or1 (s2, a, b);
and and1(s3, a, b);
xnor xnor1(s4, a, b);
nor  nor1 (s5, a, b);
nand nand1(s6, a, b);
not notA (s7, a);
not notB (s8, b);

//portas com chave
and and2(s9,  s1, ~chave[2], ~chave[1], ~chave[0]);
and and3(s10, s2, ~chave[2], ~chave[1], chave[0]);
and and4(s11, s3, ~chave[2], chave[1], ~chave[0]);
and and5(s12, s4, ~chave[2], chave[1], chave[0]);
and and6(s13, s5, chave[2], ~chave[1], ~chave[0]);
and and7(s14, s6, chave[2], ~chave[1], chave[0]);
and and8(s15, s7, chave[2], chave[1], ~chave[0]);
and and9(s16, s8, chave[2], chave[1], chave[0]);

//porta nativa com 8 entradas
or  or2 (s, s9, s10, s11, s12, s13, s14, s15, s16);

endmodule // f4
module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg [2:0]chave;
wire s;
f4 modulo (s, x, y, chave[2:0]);


// ------------------------- parte principal
initial begin
$display("Exemplo0035 - Fábio Fiuza Pereira - 406087");
$display("Test LU");

x = 0; y = 0; chave = 3'b000;

$monitor("x = %1b -- y = %1b chave1 = %3b Resultado = %1b",x,y,chave, s );

#1x = 0; y = 1; chave = 3'b000;
#1x = 1; y = 0; chave = 3'b000;
#1x = 1; y = 1; chave = 3'b000;

#1x = 0; y = 0; chave = 3'b001;
$display("\n");
#1x = 0; y = 1; chave = 3'b001;
#1x = 1; y = 0; chave = 3'b001;
#1x = 1; y = 1; chave = 3'b001;

#1x = 0; y = 0; chave = 3'b010;
$display("\n");
#1x = 0; y = 1; chave = 3'b010;
#1x = 1; y = 0; chave = 3'b010;
#1x = 1; y = 1; chave = 3'b010;

#1x = 0; y = 0; chave = 3'b011;
$display("\n");
#1x = 0; y = 1; chave = 3'b011;
#1x = 1; y = 0; chave = 3'b011;
#1x = 1; y = 1; chave = 3'b011;

#1x = 0; y = 0; chave = 3'b100;
$display("\n");
#1x = 0; y = 1; chave = 3'b100;
#1x = 1; y = 0; chave = 3'b100;
#1x = 1; y = 1; chave = 3'b100;

#1x = 0; y = 0; chave = 3'b101;
$display("\n");
#1x = 0; y = 1; chave = 3'b101;
#1x = 1; y = 0; chave = 3'b101;
#1x = 1; y = 1; chave = 3'b101;

#1x = 0; y = 0; chave = 3'b110;
$display("\n");
#1x = 0; y = 1; chave = 3'b110;
#1x = 1; y = 0; chave = 3'b110;
#1x = 1; y = 1; chave = 3'b110;

#1x = 0; y = 0; chave = 3'b111;
$display("\n");
#1x = 0; y = 1; chave = 3'b111;
#1x = 1; y = 0; chave = 3'b111;
#1x = 1; y = 1; chave = 3'b111;


end
endmodule // test_f4

// OBS.: EXPERIMENTE USAR $monitor