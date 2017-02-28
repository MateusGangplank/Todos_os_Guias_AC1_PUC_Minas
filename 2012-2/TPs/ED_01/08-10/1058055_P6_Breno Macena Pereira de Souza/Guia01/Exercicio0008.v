// -------------------------
// Exercicio0008 - AND (4 entradas)
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate (output t, input p, input q, 
                          input r, input s);
assign t = p & q & r & s;
endmodule // andgate

// -------------------------
// -- test xnor gate
// -------------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d;
wire s;
// ------------------------- instância
andgate AND1 (s, a, b, c, d);
// ------------------------- preparação
initial begin:start
a=0; 
b=0;
c=0;
d=0;
end

// ------------------------- parte principal
initial begin:main
     $display("Exercício 0008 - Breno Macena - 462017");
     $display("Test AND gate:");
     $display("\na & b & c & d = s\n");
     $monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
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
endmodule // tesandgate












