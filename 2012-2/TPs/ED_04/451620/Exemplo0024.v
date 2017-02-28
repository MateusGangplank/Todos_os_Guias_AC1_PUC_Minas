// -------------------------
// Exemplo0024 – COMPARADOR DIFERENCA
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
module test_comparadorDiferenca;
// ------------------------- definir dados
reg  x;
reg  y;
reg  carry;
wire diferenca;

comparadorDiferenca fa1 (diferenca,x,y,carry);

// ------------------------- parte principal
initial begin
$display("Exemplo0024 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU’s comparador Diferenca");

x = 0; y = 0; carry = 0;
// projetar testes do modulo
$display("a  b  carry  s  ");
#1 $monitor("%b  %b     %b     %b",x,y,carry,diferenca);

#1 x = 0; y = 0; carry = 1;
#1 x = 0; y = 1; carry = 0;
#1 x = 0; y = 1; carry = 1;
#1 x = 1; y = 0; carry = 0;
#1 x = 1; y = 0; carry = 1;
#1 x = 1; y = 1; carry = 0;
#1 x = 1; y = 1; carry = 1;
end
endmodule // test_comparadorDiferenca