// -------------------------
// Exemplo0033 - F2
// Nome: Ítalo Guimarães Otoni
// Matricula: 451581
// -------------------------

module F2 (output s,output ss, input a, input b, input chave);

wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,c0,c1;

and and0 (s0,a,b);
or or0 (s1,a,b);

nand nand0 (s2,a,b);
nor nor0 (s3,a,b);

not not0 (c1,chave);
buf buf0 (c0,chave);

and and1 (s4,s0,c1);
and and2 (s5,s1,c1);
and and3 (s6,s2,c0);
and and4 (s7,s3,c0);

or or1 (s,s4,s6);
or or2 (ss,s5,s7);

endmodule

module TESTE;

reg x,y;
wire z,z1;

initial begin
x= 'b0;
y= 'b0;
end

F2 portas (z,z1,x,y,0);

initial begin

$display("Exercicio0033 - Ítalo Guimarães Otoni - 451581");

$monitor("x | y = %b     x & y = %b",z1,z);

#1 y = 'b1;
#1 x = 'b1;
#1 y = 'b0;
end
endmodule