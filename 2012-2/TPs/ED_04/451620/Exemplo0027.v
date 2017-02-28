// -------------------------
// Exemplo0027 - COMPARADOR COM CHAVE
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// comparador Diferenca
// -------------------------
module comparadorDiferenca (output s,
input a,
input b,
input carry);

wire temp1,temp2,temp3,temp4,temp5;

xnor xnor1 ( temp1,a,b );
xnor xnor2 ( temp2,a,carry );
xnor xnor3 ( temp3,b,carry );
and and1   ( temp4,temp2, temp1 );
and and2   ( temp5,temp4, temp3 );
not not1   ( s, temp5 );

endmodule // comparadorDiferenca

// comparador Igualdade
// -------------------------
module comparadorIgualdade (output s,
input a,
input b,
input carry);

wire temp1,temp2,temp3,temp4;

xnor xnor1 ( temp1,a,b );
xnor xnor2 ( temp2,a,carry );
xnor xnor3 ( temp3,b,carry );
and and1   ( temp4,temp2, temp1 );
and and2   ( s,temp4, temp3 );

endmodule // comparadorIgualdade

module test;
// ------------------------- definir dados
reg  x;
reg  y;
reg  carry;
reg chave;
wire resp,resp1;
wire chave2,c1,c2,saida;

comparadorDiferenca fa1 (resp,x,y,carry);
comparadorIgualdade fa2 (resp1,x,y,carry);
not not1 (chave2,chave);
and and1 (c1,chave2,resp);
and and2 (c2,chave,resp1);
or or1   (saida,c1,c2);


// ------------------------- parte principal
initial begin
$display("Exemplo0027 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU’s COMPARADOR COM CHAVE");

x = 0; y = 1; carry = 0; chave = 0;
// projetar testes do modulo
$display("chave   a  b  carry  s  ");
#1 $monitor("%b       %b  %b     %b   %b",chave,x,y,carry,saida);

#1 x = 0; y = 1; carry = 0; chave = 1;
#1 x = 1; y = 1; carry = 0; chave = 0;
#1 x = 1; y = 1; carry = 0; chave = 1;
#1 x = 0; y = 0; carry = 0; chave = 0;
#1 x = 0; y = 0; carry = 0; chave = 1;
end
endmodule // test_comparadorDiferenca