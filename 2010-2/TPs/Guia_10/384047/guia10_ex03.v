// ------------------------------------------------
// Guia 10 - Exericio 03 - latch D com portas NAND
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// ------------------------------------------------

// ----------------------------
// -- latch D com portas NAND
// ----------------------------

module latchD(q, qnot, d, c);
output q, qnot;
input d, c;
wire s1, s2, s3, s4, s5;

nand NAND1(s1, c, d);
nand NAND2(s3, s2, c);
nand NAND3(s4,s1, s5);
nand NAND4(s5, s3, s4);
not NOT1(s2, d);

assign q = s4;
assign qnot = s5;

endmodule //--fim module latch D

// ----------------
// -- test LatchD
// ----------------

module testeLatchD;
reg d, c;
wire q, qnot;
//--instancia
latchD latch1(q, qnot, d, c);

initial begin:start
c=0; d=0;
end
//-- parte principal
initial begin:main
$display("Guia 10- Exercicio 03 - Eduardo de Abreu Fortes - 384047");
$display("Latch D com portas NAND");
$display("\nC   D   Q QNot\n");
$monitor("%b   %b   %b %b", c, d, q, qnot);
#1  c=0; d=1;
#1  c=1; d=0;
#1  c=1; d=1;
end

endmodule //-- fim teste latchsr