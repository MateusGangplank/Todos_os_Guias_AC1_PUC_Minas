// -------------------------
// Exemplo0032 - F4
// Nome: Ítalo Guimarães Otoni
// Matricula: 451581
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s,input a,input b, input chave);

wire temp1, temp2, temp3, temp4;

or OR1 (temp1, a, b);
and AND1 (temp2, a, b);

not NOT1 (notchave, chave);

and AND2 (temp3, temp2, chave);
and AND3 (temp4, temp1, notchave);

xor XOR1 (s, temp3, temp4);

endmodule // f4

module test_f4;

reg x;
reg y;
reg chave;
wire z;

f4 modulo (z, x, y, chave);

initial begin

$display("Exemplo0031 - Ítalo Guimarães Otoni - 451581");


x = 'b0; y = 'b1; chave=0;

$monitor("%b",z);

end
endmodule // test_f4