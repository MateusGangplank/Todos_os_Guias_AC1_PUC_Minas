// -------------------------
// Exemplo0032 - F4 Utilizando Chave
// Nome: Fábio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, input a,input b, input chave);

wire s1, s2, s3, s4, nc;

//portas nativas
and and1(s1, a, b);
or  or1 (s2, a, b);
not not1(nc, chave);
and and1(s3, s1, nc);
and and1(s4, s2, chave);
or  or1 (s, s3, s4);

endmodule // f4
module test_f4;


// ------------------------- definir dados


reg x;
reg y;
reg chave;
wire s;
f4 modulo (s, x, y, chave);


// ------------------------- parte principal


initial begin
$display("Exemplo0032 - Fábio Fiuza Pereira - 406087");
$display("Test LU");

x = 0; y = 0; chave = 1;

$monitor("x = %1b -- y = %1b chave = %1b Resultado = %1b",x,y,chave,s );

#1x = 0; y = 1; chave = 1;
#1x = 1; y = 0; chave = 1;
#1x = 1; y = 1; chave = 1;

#1x = 0; y = 0; chave = 0;
$display("\n");
#1x = 0; y = 1; chave = 0;
#1x = 1; y = 0; chave = 0;
#1x = 1; y = 1; chave = 0;

end
endmodule // test_f4