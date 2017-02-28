// --------------------------------------------------------------------------
// Guia 05 - Exericio 03 - Protudo completo de dois valores de 2 bits cada
// Nome: Henrique Carvalho Parreira
// Matricula: 347133
// ---------------------------------------------------------------------------

// ------------
// -- Operacao 
// ------------

module produtoCompleto (s0, s1, s2, s3, a0, a1, b0, b1);
output s0, s1, s2, s3;
input a0, a1, b0, b1;

wire s4, s5, s6, s7, s8;

and AND1 (s4, a1, b1);
and AND2 (s5, a0, b0);
and AND3 (s6, a1, b0);
and AND4 (s7, a0, b1);
and AND5 (s3, s4, s5);
not NOT1 (s8, s5);
and AND6 (s2, s4, s8);
xor XOR1 (s1, s6, s7);

assign s0 = s5;

endmodule 

// ------------------------
// -- test Produto Completo 
// ------------------------

module testProdutoCompleto;
reg   a0, a1, a2, b0, b1, b2, c;
wire  s0, s1, s2, s3;


produtoCompleto PC1 (s0, s1, s2, s3, a0, a1, b0, b1);

initial begin:start
a1=0; a0=0; b1=0; b0=0;
end

//-- parte principal
initial begin:main
$display("Guia 05 - Exercicio 03 - Eduardo de Abreu Fortes - 384047");
$display("Henrique Carvalho Parreira - 347133");
$display("Test produto_completo de 2 bits");
$display("\na1 a0 * b1 b0 = s20 s10 s00\n");
$monitor("%b %b  *  %b %b  =  %b %b %b %b", a1, a0, b1, b0, s3, s2, s1, s0);
#1  a1=0; a0=0; b1=0; b0=1;
#1  a1=0; a0=0; b1=1; b0=0;
#1  a1=0; a0=0; b1=1; b0=1;
#1  a1=0; a0=1; b1=0; b0=0;
#1  a1=0; a0=1; b1=0; b0=1;
#1  a1=0; a0=1; b1=1; b0=0;
#1  a1=0; a0=1; b1=1; b0=1;
#1  a1=1; a0=0; b1=0; b0=0;
#1  a1=1; a0=0; b1=0; b0=1;
#1  a1=1; a0=0; b1=1; b0=0;
#1  a1=1; a0=0; b1=1; b0=1;
#1  a1=1; a0=1; b1=0; b0=0;
#1  a1=1; a0=1; b1=0; b0=1;
#1  a1=1; a0=1; b1=1; b0=0;
#1  a1=1; a0=1; b1=1; b0=1;

end

endmodule // -- fim module test produto completo