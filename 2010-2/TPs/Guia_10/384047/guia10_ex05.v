// ------------------------------------------------
// Guia 10 - Exericio 05 - latch D feito de latchSR
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// ------------------------------------------------

// ----------------------------
// -- latch SR com portas NOR
// ----------------------------

module latchSR (q, qnot, s, r);
output q, qnot;
input s, r;
wire s1, s2;

nor NOR1 (s1, s, s2);
nor NOR2 (s2, r, s1);

assign q = s2;
assign qnot = s1;

endmodule //--fim module latch SR

// -----------
// -- latch D
// -----------

module latchD(q, qnot, d);
output q, qnot;
input d;

wire s0;

latchSR latch1(q, qnot, d, s0);

endmodule //--fim module latch D

// ----------------
// -- test LatchD
// ----------------

module testeLatchD;
reg d;
wire q, qnot;
//--instancia
latchD latch1(q, qnot, d);

initial begin:start
d=0;
end
//-- parte principal
initial begin:main
$display("Guia 10- Exercicio 03 - Eduardo de Abreu Fortes - 384047");
$display("Latch D com portas NAND");
$display("\nD   Q QNot\n");
$monitor("%b   %b %b", d, q, qnot);
#1   d=1;
end

endmodule //-- fim teste latchsr