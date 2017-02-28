// ---------------------
// Exemplo 05_03 - PRODUTO
// Nome: Júlio Cézar Taveira Araújo
// Matricula: 380776
// ---------------------

// ---------------------
// -- Meia-Soma
// ---------------------

module meiasoma (s0, s1, a, b);

 output s0,s1;
 input a, b;
 xor (s0,a,b);
 and (s1,a,b);
 
endmodule//meiasoma

// ---------------------
// -- SOMA COMPLETA
// ---------------------

module somaCompleta (s0, s1, a, b, vaium );

input a, b, vaium;
output s0, s1;
wire w1, w2, w3;

meiasoma MS1 (w2,w1,a,b);
meiasoma MS2 (s0,w3,r,vaium);
or (s1,w3,w1);

endmodule//somaCompleta

// ---------------------
// --Produto
// ---------------------

module produto (s0, cout, e0, e1, e2, e3, cin);

input e0, e1, e2, e3, cin;
output s0, cout;

and AND1 (p1,e0, e1);
and AND2 (p2,e2,e3);
somaCompleta soma (s0,cout,p1,p2,cin);

endmodule//produto

// ---------------------
// --Produto Completo 2bits
// ---------------------

module produtoCompleto (s3, s2, s1, s0, a0, a1, b0, b1);

input a0, a1, b0, b1;
output s3, s2, s1, s0;
reg  p = 0;
produto P1 (s0,cout1,p,p,a0,b0,p);
produto P2 (s1,cout2,a0,b1,a1,b0,cout1);
produto P3 (s2,s3,a1,b1,p,p,cout2 );

endmodule//produtoCompleto