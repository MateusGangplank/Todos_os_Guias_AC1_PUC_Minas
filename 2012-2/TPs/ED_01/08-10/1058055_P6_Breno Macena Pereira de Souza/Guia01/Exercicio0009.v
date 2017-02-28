// -------------------------
// Exercicio0009 - AND (4 entradas)
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate1 (output t, input p, input q);
assign t = p & q;
endmodule // andgate1

module andgate2 (output t, input p, input q);
assign t = p & q;
endmodule // andgate2

module andgate (output t, input p, input q);
assign t = p & q;
endmodule // andgate

// -------------------------
// -- test and gate
// -------------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d;
wire s, t, u;
// ------------------------- instâncias
andgate1 AND1 (s, a, b);
andgate2 AND2 (t, c, d);
andgate AND3 (u, s, t);

// ------------------------- preparação
initial begin:start
a=0; 
b=0;
c=0;
d=0;
end

// ------------------------- parte principal
initial begin:main
     $display("Exercício 0009 - Breno Macena - 462017");
     $display("Test AND gate:");
     $display("\na & b & c & d = u\n");
	  $monitor("%b & %b & %b & %b = %b",a, b, c, d, u);
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
endmodule // testandgate












