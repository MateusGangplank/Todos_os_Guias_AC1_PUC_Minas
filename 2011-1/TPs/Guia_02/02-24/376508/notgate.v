// ---------------------
// Guia 02 exercicio03
// Nome: Felipe Barros
// Matricula: 376508
// ---------------------

module notgate (s, p);
output s;
input p;
assign s=~p;

endmodule

module testnotgate;
reg a;
wire s;

notgate NOT1 (s,a);

initial begin: start
a=0;
end

initial begin: main
$display ("Guia02 exercicio03");
$display ("tabela-verdade para porta not\n");
$display ("~a = s");
$monitor ("%b = %b", a, s);
#1 a=1;
end

endmodule

//---------------------
// Porta nand
//---------------------

module nandgate (s1, p1, q1, r1);
output s1;
input p1, q1, r1;
assign s= ~(p1 & q1 & r1);
endmodule

module testnandgate;
reg a, b, c;
wire s;
nand (s, a, b, c);

endmodule