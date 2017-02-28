// ---------------------
// Guia 02
// Nome: Felipe Barros
// Matricula: 376508
// ---------------------


module egate (s, p, q);
output s;
input p, q;
assign s= p & q;

endmodule


module testegate;
reg a, b;
wire s;

egate AND1 (s, a, b);
initial begin: start
a=0; b=0;
end

initial begin: main
$display ("Guia02 exercicio 02");
$display ("tabela-verdade para porta AND\n");
$display ("a & b = s");
$monitor ("%b & %b = %b", a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end

endmodule




// ---------------------
//	Porta nor
// ---------------------

module norgate (s1, p1, q1, r1);
output s1;
input p1, q1, r1;
assign s1= ~(p1 | q1 | r1);
endmodule

module testnorgate;
reg a, b, c;
wire s;
nor (s, a, b, c);

endmodule
