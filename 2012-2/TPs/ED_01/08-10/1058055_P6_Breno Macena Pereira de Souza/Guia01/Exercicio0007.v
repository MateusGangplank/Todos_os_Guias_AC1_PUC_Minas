// -------------------------
// Exercicio0007 - XNOR
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- xor gate
// -------------------------
module xnorgate (output s, input p, input q);
assign s = p & q | ~q & ~p;
endmodule // xnorgate

// -------------------------
// -- test xnor gate
// -------------------------
module testxnorgate;
// ------------------------- dados locais
reg a, b;
wire s;
// ------------------------- inst�ncia
xnorgate XNOR1 (s, a, b);
// ------------------------- prepara��o
initial begin:start
a=0; 
b=0; 
end

// ------------------------- parte principal
initial begin:main
     $display("Exerc�cio 0007 - Breno Macena - 462017");
     $display("Test XOR gate:");
     $display("\n~a & b | ~b & a = s\n");
     $monitor("%b & %b | ~%b & ~%b = %b", a, b, b, a, s);
#1   a=0; b=0;
#1   a=0; b=1;
#1   a=1; b=0;
#1   a=1; b=1;

end
endmodule // testxorgate












