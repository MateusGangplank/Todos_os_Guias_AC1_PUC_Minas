// ---------------------
// Guia 05 Ex02
// Nome: Felipe Barros Silva
// Matricula: 376508
// ---------------------


module diferencacompleto (s0, s1, a, b, v);
output s0, s1;
input a, b, v;
//wire temp1, temp2, temp3, temp4);
wire temp1, temp2, temp3, temp4;    // CORRIGIDO
or Or1 (s0, a, temp1);
or Or2 (s1, temp2, temp3);
and And1 (temp1, a, temp4);
xor Xor1 (temp4, b, v);
and And2 (temp2, b, v);
and And3 (temp3, temp4, a);

endmodule

module teste;
 // FAZER A DESCRICAO DO MODULO DE TESTES
endmodule








