// ------------------------------------------------
// Guia 10 - Exericio 01 - latch SR com portas NOR
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

endmodule

// ----------------
// -- test LatchSR
// ----------------

module testeLatchSR;
reg s, r;
wire q, qnot;
//--instancia
latchSR latch1(q, qnot, s, r);

initial begin:start
s=0; r=0;
end
//-- parte principal
initial begin:main
$display("Guia 10- Exercicio 01 - Eduardo de Abreu Fortes - 384047");
$display("Latch SR com portas NOR");
$display("\nS   R   Q QNot\n");
$monitor("%b   %b   %b %b", s, r, q, qnot);
#1  s=0; r=1;
#1  s=1; r=0;
#1  s=1; r=1;
end

endmodule //-- fim teste latchsr
