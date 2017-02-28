// -------------------------
// Exercicio0010 - OR (4 entradas)
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- or gate
// -------------------------
module orgate1 (output t, input p, input q);
assign t = p | q;
endmodule // orgate1

module orgate2 (output t, input p, input q);
assign t = p | q;
endmodule // orgate2

module orgate (output t, input p, input q);
assign t = p | q;
endmodule // orgate

// -------------------------
// -- test or gate
// -------------------------
module testorgate;
// ------------------------- dados locais
reg a, b, c, d;
wire s, t, u;
// ------------------------- instâncias
orgate1 OR1 (s, a, b);
orgate2 OR2 (t, c, d);
orgate OR3 (u, s, t);

// ------------------------- preparação
initial begin:start
a=0; 
b=0;
c=0;
d=0;
end

// ------------------------- parte principal
initial begin:main
     $display("Exercício 0010 - Breno Macena - 462017");
     $display("Test OR gate:");
     $display("\na & b & c & d = u\n");
	  $monitor("%b & %b & %b & %b = %b", a, b, c, d, u);
#1   a=0; b=0; c=0; d=0;
#1   a=0; b=0; c=0; d=1;
#1   a=0; b=0; c=1; d=0;
#1   a=0; b=0; c=1; d=1;
#1   a=0; b=1; c=0; d=0;
#1   a=0; b=1; c=0; d=1;
#1   a=0; b=1; c=1; d=0;
#1   a=0; b=1; c=1; d=1;
#1   a=1; b=0; c=0; d=0;
#1   a=1; b=0; c=0; d=1;
#1   a=1; b=0; c=1; d=0;
#1   a=1; b=0; c=1; d=1;
#1   a=1; b=1; c=0; d=0;
#1   a=1; b=1; c=0; d=1;
#1   a=1; b=1; c=1; d=0;
#1   a=1; b=1; c=1; d=1;
end
endmodule // testorgate












