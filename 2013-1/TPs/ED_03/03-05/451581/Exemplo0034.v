// -------------------------
// Exemplo0034 - F4
// Nome: Ítalo Guimarães Otoni
// Matricula: 451581
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, output s2, input a,input b, input chave);

wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;

xor XOR1 (temp1, a, b);
xnor XNOR1 (temp2, a, b);
or OR1 (temp3, a, b);
nor NOR1 (temp4, a, b);

not NOT1 (nchave, chave);

and AND2 (temp5, temp1, chave);
and AND3 (temp6, temp2, chave);
and AND4 (temp7, temp3, nchave);
and AND5 (temp8, temp4, nchave);

or OR2 (s, temp5, temp7);
or OR3 (s2, temp6, temp8);

endmodule // f4

module test_f4;

reg x;
reg y;
reg chave;
wire z, z2;

f4 modulo (z, z2, x, y, chave);

initial begin

$display("Exemplo0033 - Ítalo Guimarães Otoni - 451581");


x = 'b0; y = 'b0; chave=0;

$display("Sendo Chave: 0 - XOR/XNOR \t 1 - OR/NOR");
$monitor("Chave: (%b) \t %b %b \t XOR/OR: %b \t XNOR/NOR: %b", chave, x, y, z, z2);

#1 x=0;y=1;
#1 x=1;y=0;
#1 x=1;y=1;
#1 chave=1;x=0;y=0;
#1 x=0;y=1;
#1 x=1;y=0;
#1 x=1;y=1;

end
endmodule