// -------------------------
// Exemplo0033 - F4 Utilizando Chave
// Nome: Fábio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// f4_gate
// -------------------------


module f4 (output s, input a,input b, input chave1, input chave2);

wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12;

//portas nativas

and and1(s1, a, b);
or  or1 (s2, a, b);
nand nand1(s3, a, b);
nor  nor1 (s4, a, b);
and and2(s5, s1, chave1);
and and3(s6, s2, chave1);
and and4(s7, s3, chave1);
and and5(s8, s4, chave1);
or  or2 (s9, s5, s6);
or  or3 (s10, s7, s8);
and and6(s11, s9, chave2);
and and7(s12, s10, chave2);
or  or4 (s, s12, s11);


endmodule // f4
module test_f4;


// ------------------------- definir dados


reg x;
reg y;
reg chave1;
reg chave2;
wire s;
f4 modulo (s, x, y, chave1, chave2);


// ------------------------- parte principal


initial begin
$display("Exemplo0033 - Fábio Fiuza Pereira - 406087");
$display("Test LU");

x = 0; y = 0; chave1 = 1; chave2 = 1;

$monitor("x = %1b -- y = %1b chave1 = %1b  chave2 = %1b Resultado = %1b",x,y,chave1, chave2, s );

#1x = 0; y = 1; chave1 = 1; chave2 = 1;
#1x = 1; y = 0; chave1 = 1; chave2 = 1;
#1x = 1; y = 1; chave1 = 1; chave2 = 1;

#1x = 0; y = 0; chave1 = 0; chave2 = 1;
$display("\n");
#1x = 0; y = 1; chave1 = 0; chave2 = 0;
#1x = 1; y = 0; chave1 = 0; chave2 = 0;
#1x = 1; y = 1; chave1 = 0; chave2 = 0;

#1x = 0; y = 0; chave1 = 1; chave2 = 0;
$display("\n");
#1x = 0; y = 1; chave1 = 1; chave2 = 0;
#1x = 1; y = 0; chave1 = 1; chave2 = 0;
#1x = 1; y = 1; chave1 = 1; chave2 = 0;

end
endmodule // test_f4