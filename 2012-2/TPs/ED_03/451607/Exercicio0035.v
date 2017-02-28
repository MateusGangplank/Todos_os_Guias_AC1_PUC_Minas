// -------------------------
// Exemplo0035 - F4
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------

module F4 (output s, input x, input y, input chave0, input chave1, input chave2);

wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,c0,c1,c2,c3,c4,c5;

not notx (s0,x);
not noty (s14,y);

or or0 (s1,x,y);
nor nor0 (s2,x,y);
and and0 (s3,x,y);
nand nand0 (s4,x,y);
xor xor0 (s5,x,y);
xnor xnor0 (s6,x,y);

buf buf0 (c0,chave0);
not not0 (c1,chave0);

buf buf1 (c2,chave1);
not not1 (c3,chave1);

buf buf2 (c4,chave2);
not not0 (c5,chave2);

and and1 (s7,s0,s14,c0,c2,c4); 
and and2 (s8,s1,c0,c2,c5);
and and3 (s9,s2,c0,c3,c4);
and and4 (s10,s3,c0,c3,c5);
and and5 (s11,s4,c1,c2,c4);
and and6 (s12,s5,c1,c2,c5);
and and7 (s13,s6,c1,c3,c4);

or or1 (s,s7,s8,s9,s10,s11,s12,s13);

endmodule

module TESTE;

reg x,y,chave0,chave1,chave2;
wire z;

initial begin
x='b0;
y='b0;
chave0='b1;
chave1='b1;
chave2='b0;
end

F4 portas (z,x,y,chave0,chave1,chave2);

initial begin

$display("Exercicio0035 - Rafael Guimarães de Sousa - 451607");
$display(" NOT - 111 \n OR - 110 \n NOR - 101 \n AND - 100 \n NAND - 011 \n XOR - 010 \n XNOR - 001\n\n");

$monitor("x(%b) : y(%b) = %b       | Chave:%b%b%b",x,y,z,chave0,chave1,chave2);

#1 x='b1;
#1 x='b0;y='b1;
#1 x='b1;

end
endmodule
