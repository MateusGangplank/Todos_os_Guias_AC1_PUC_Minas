// -------------------------
// Exemplo0034 - F4
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------

module F4 (output s, input a, input b, input chave0, input chave1);

wire s0,s1,s2,s3,s4,s5,s6,s7,c0,c1,c2,c3;

or or0 (s0,a,b);
nor nor0 (s1,a,b);
xor xor0 (s2,a,b);
xnor xnor0 (s3,a,b);

buf buf0 (c0,chave0);
not not0 (c1,chave0);

buf buf1 (c2,chave1);
not not1 (c3,chave1);

and and0 (s4,c1,c3,s0);
and and1 (s5,c1,c2,s1);
and and2 (s6,c0,c3,s2);
and and3 (s7,c0,c2,s3);

or or1 (s,s4,s5,s6,s7);

endmodule

module TESTE;

reg x,y,chave0,chave1;
wire z;

initial begin
x='b0;
y='b0;
end

F4 portas (z,x,y,0,0);

initial begin

$display("Exercicio0034 - Rafael Guimarães de Sousa - 451607");


$monitor("X %b | Y %b = %b",x,y,z);

#1 y = 'b0;x='b1;
#1 y='b1; x='b0;
#1 x='b1;y='b1;


end
endmodule