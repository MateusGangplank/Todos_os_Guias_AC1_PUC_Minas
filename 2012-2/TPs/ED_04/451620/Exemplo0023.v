// -------------------------
// Exemplo0023 – COMPARADOR IGUALDADE
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
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
module test_comparadorIgualdade;
// ------------------------- definir dados
reg  x;
reg  y;
reg  carry;
wire igualdade;

comparadorIgualdade fa1 (igualdade,x,y,carry);

// ------------------------- parte principal
initial begin
$display("Exemplo0023 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU’s comparador Igualdade");

x = 0; y = 0; carry = 0;
// projetar testes do modulo
$display("a  b  carry  s  ");
#1 $monitor("%b  %b     %b     %b",x,y,carry,igualdade);

#1 x = 0; y = 0; carry = 1;
#1 x = 0; y = 1; carry = 0;
#1 x = 0; y = 1; carry = 1;
#1 x = 1; y = 0; carry = 0;
#1 x = 1; y = 0; carry = 1;
#1 x = 1; y = 1; carry = 0;
#1 x = 1; y = 1; carry = 1;
end
endmodule // test_comparadorIgualdade