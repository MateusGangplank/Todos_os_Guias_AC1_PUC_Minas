// -------------------------
// Exemplo0035 - F4
// Nome: Ítalo Guimarães Otoni
// Matricula: 451581
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, input a,input b, input [2:0] chave);

wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, tempo13, temp14, temp15, temp16, temp17, temp18;
wire [2:0] nchave;

not NOT1 (temp1, a);
not NOT2 (temp2, b);
or OR1 (temp3, a, b);
nor NOR1 (temp4, a, b);
and AND1 (temp5, a, b);
nand NAND1 (temp6, a, b);
xor XOR1 (temp7, a, b);
xnor XNOR1 (temp8, a, b);

not NOT3 (nchave[0], chave[0]);
not NOT4 (nchave[1], chave[1]);
not NOT5 (nchave[2], chave[2]);

and AND2 (temp11, temp1, nchave[2], nchave[1], nchave[0]);
and AND3 (temp12, temp3, nchave[2], nchave[1], chave[0]);
and AND4 (temp13, temp4, nchave[2], chave[1], nchave[0]);
and AND5 (temp14, temp5, nchave[2], chave[1], chave[0]);
and AND6 (temp15, temp6, chave[2], nchave[1], nchave[0]);
and AND7 (temp16, temp7, chave[2], nchave[1], chave[0]);
and AND8 (temp17, temp8, chave[2], chave[1], nchave[0]);
and AND8 (temp18, temp2, chave[2], chave[1], chave[0]);

or OR2 (s, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18);

endmodule // f4

module test_f4;

reg x;
reg y;
reg [2:0] chave;
wire z;

f4 modulo (z, x, y, chave);

initial begin

$display("Exemplo0035 - Ítalo Guimarães Otoni - 451581");
$display("");

x = 'b0; y = 'b0; chave='b000;

$display("Sendo a Chave: \n 000-NOT(X)  \n 001-OR \n 010-NOR \n 011-AND \n 100-NAND \n 101-XOR \n 110-XNOR \n 111-NOT(Y)");
$display("");
$monitor("Chave: (%3b) \t %b %b \t %b", chave, x, y, z);

#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;
#1 chave='b001;x='b0;y='b0;
#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;
#1 chave='b010;x='b0;y='b0;
#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;
#1 chave='b011;x='b0;y='b0;
#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;
#1 chave='b100;x='b0;y='b0;
#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;
#1 chave='b101;x='b0;y='b0;
#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;
#1 chave='b110;x='b0;y='b0;
#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;
#1 chave='b111;x='b0;y='b0;
#1 x='b0;y='b1;
#1 x='b1;y='b0;
#1 x='b1;y='b1;


end
endmodule