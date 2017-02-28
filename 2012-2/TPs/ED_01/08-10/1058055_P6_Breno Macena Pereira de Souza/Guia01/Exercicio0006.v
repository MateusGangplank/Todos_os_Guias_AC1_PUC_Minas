// -------------------------
// Exercicio0006 - XOR
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- xor gate
// -------------------------
module xorgate (output s, input p, input q);
assign s = ~p & q | ~q & p;
endmodule // norgate

// -------------------------
// -- test xor gate
// -------------------------
module testxorgate;
// ------------------------- dados locais
reg a, b;
wire s;
// ------------------------- inst�ncia
xorgate XOR1 (s, a, b);
// ------------------------- prepara��o
initial begin:start
a=0; 
b=0; 
end

// ------------------------- parte principal
initial begin:main
     $display("Exerc�cio 0006 - Breno Macena - 462017");
     $display("Test XOR gate:");
     $display("\n~a & b | ~b & a = s\n");
     a=0; b=0;
#1   $display("~%b & %b | ~%b & %b = %b", a, b, b, a, s);
     a=0; b=1;
#1   $display("~%b & %b | ~%b & %b = %b", a, b, b, a, s);		
     a=1; b=0;
#1   $display("~%b & %b | ~%b & %b = %b", a, b, b, a, s);		
     a=1; b=1;
#1   $display("~%b & %b | ~%b & %b = %b", a, b, b, a, s);		

end
endmodule // testxorgate












