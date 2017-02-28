// -------------------------
// Exemplo0033 - F4
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, output s2, input a,input b, input chave);

wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;

and AND1 (temp1, a, b);
or OR1 (temp2, a, b);
nand NAND1 (temp3, a, b);
nor NOR1 (temp4, a, b);

not NOT1 (nchave, chave);

and AND2 (temp5, temp1, nchave);
and AND3 (temp6, temp2, nchave);
and AND4 (temp7, temp3, chave);
and AND5 (temp8, temp4, chave);

or OR2 (s, temp5, temp7);
or OR3 (s2, temp6, temp8);

endmodule // f4

module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg chave;
wire z, z2;

f4 modulo (z, z2, x, y, chave);
// ------------------------- parte principal
initial begin

$display("Exemplo0033 - Rafael Guimarães de Sousa - 451607");
$display("Test LU's module");

x = 'b0; y = 'b0; chave=0;

$display("Legenda: 0 - AND/OR \t 1 - NAND/NOR", chave);
$monitor("Chave: (%b) \t %b %b \t AND/NAND:%b \t OR/NOR:%b", chave, x, y, z, z2);

#1 x=0;y=1;
#1 x=1;y=0;
#1 x=1;y=1;
#1 chave=1;x=0;y=0;
#1 x=0;y=1;
#1 x=1;y=0;
#1 x=1;y=1;

end
endmodule