// ---------------------
// Exercicio 03 - Operador Produto (3 bits)
// Nome: Jéssica Daniela
// Matricula: 407450
// ---------------------

module meiasoma (s0,s1,a,b);
input a,b;
output s0,s1;
xor XOR1(s0,a,b);
and AND1(s1,a,b);
endmodule  // meiasoma

module produto (s0,s1,s2,s3,a0,a1,b0,b1);
input a0,a1,b0,b1;
output s0,s1,s2,s3;
wire  q0,q1,q2,q3;
and AND1(s0,a0,b0);
and AND2(q0,a1,b0);
and AND3(q1,a0,b1);
and AND4(q2,a1,b1);
meiasoma MS1(s1,q3,q0,q1);
meiasoma MS2(s2,s3,q3,q2);
endmodule  //produto

module testeproduto;
reg a0,a1,b0,b1;
wire s0,s1,s2,s3;
produto PRO(s0,s1,s2,s3,a0,a1,b0,b1);
initial begin: start
a1=0; a0=0; b1=0; b0=0;
end
initial begin: main
$display("Jessica Daniela - 407450");
$display("Exercicio 03 - Operador produto 3 bits");
$display("\n | a1 | a0 | * | b1 | b0 | = | s3 | s2 | s1 | s0 |\n");
$monitor("   | %b | %b | * | %b | %b | = | %b | %b | %b | %b |",a1,a0,b1,b0,s3,s2,s1,s0);
#1 a1 = 0; a1 = 0; b0 = 0; b1 = 1;

#1 a1 = 0; a0 = 0; b1 = 1; b0 = 0;
#1 a1 = 0; a0 = 0; b1 = 1; b0 = 1;

#1 a1 = 0; a0 = 1; b1 = 0; b0 = 0;
#1 a1 = 0; a0 = 1; b1 = 0; b0 = 1;

#1 a1 = 0; a0 = 1; b1 = 1; b0 = 0;
#1 a1 = 0; a0 = 1; b1 = 1; b0 = 1;

#1 a1 = 1; a0 = 0; b1 = 0; b0 = 0;
#1 a1 = 1; a0 = 0; b1 = 0; b0 = 1;

#1 a1 = 1; a0 = 0; b1 = 1; b0 = 0;
#1 a1 = 1; a0 = 0; b1 = 1; b0 = 1;

#1 a1 = 1; a0 = 1; b1 = 0; b0 = 0;
#1 a1 = 1; a0 = 1; b1 = 0; b0 = 1;

#1 a1 = 1; a0 = 1; b1 = 1; b0 = 0;
#1 a1 = 1; a0 = 1; b1 = 1; b0 = 1;


end
endmodule //testediferenca3bits