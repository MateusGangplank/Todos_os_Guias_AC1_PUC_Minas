// -------------------------------------------------
// Guia 10 - Exericio 02 - latch SR com portas NAND
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -------------------------------------------------

// ----------------------------
// -- latch SR com portas NAND
// ----------------------------

module latchSR (q, qnot, s, r, c, cl, pr);
output q, qnot;
input s, r, c, cl, pr;
wire s0, s1, s2, s3;

nand NAND1(s0, s, c);
nand NAND2(s2, s0, s3);
nand NAND3(s3, s1, s2);
nand NAND3(s1, r,c);

assign q = s2;
assign qnot = s3;

endmodule //--fim module latchSR

// ----------------
// -- test LatchSR
// ----------------

module testeLatchSR;
reg s, r, c, cl, pr;
wire q, qnot;
//--instancia
latchSR latch1(q, qnot, s, r, c, cl, pr);

initial begin:start
pr=0; cl=0; c=0; s=0; r=0;
end
//-- parte principal
initial begin:main
$display("Guia 10- Exercicio 02 - Eduardo de Abreu Fortes - 384047");
$display("Latch SR, clear e preset com portas NAND");
$display("\nPR   CL   C    S    R    Q    QNot\n");
$monitor("%b     %b   %b    %b    %b    %b     %b", pr, cl, c, s, r, q, qnot);
#1 pr=0; cl=1; c=0; s=0; r=0;
#1 pr=1; cl=0; c=0; s=0; r=0;
#1 pr=1; cl=1; c=0; s=0; r=0;
#1 pr=0; cl=1; c=1; s=0; r=1;
#1 pr=1; cl=0; c=1; s=1; r=0;
#1 pr=1; cl=1; c=1; s=0; r=1;
#1 pr=1; cl=1; c=1; s=1; r=0;
#1 pr=1; cl=1; c=1; s=1; r=1;

end

endmodule //-- fim teste latchsr