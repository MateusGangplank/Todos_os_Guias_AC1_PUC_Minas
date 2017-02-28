// ---------------------
// Guia 05 Ex01
// Nome: Felipe Barros Silva
// Matricula: 376508
// ---------------------


module somacompleto ( s0, s1, a, b, c, v);
output s0, s1;
input a, b, c, v;
wire temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13;
or Or1 (s0, temp0, temp1);
or Or2 (s1, temp2, temp3, temp4, temp5);
xor Xor1 (temp0, a, b);
and And1 (temp1, temp6, temp7);
xor Xor2 (temp6, v, c);
and And2 (temp7, a, b);
and And3 (temp2, temp6, b);
and And4 (temp3, temp8, a, temp6);
not Not1 (temp8 , b);
and And5 (temp4, temp0, temp9);
and And6 (temp5, c, temp10);
and And7 (temp11, c, v);
or Or3 (temp12, v, temp13);
and And8 (temp13, b, a, v);

//end module
endmodule

module teste;
  // FAZER DESCRICAO DO MODULO DE TESTES.
endmodule


