// -------------------------
// Exercicio0003 - XNOR
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- xnor gate
// -------------------------
module xnorgate (output s, input p, input q);
assign s = (~(p ^ q));
endmodule // xnorgate

// -------------------------
// -- test xnor gate
// -------------------------
module testxnorgate;
// ------------------------- dados locais
reg a, b;
wire s;
// ------------------------- instância
xnorgate XNOR1 (s, a, b);
// ------------------------- preparação
initial begin:start
a=0; 
b=0; 
end

// ------------------------- parte principal
initial begin:main
     $display("Exercício 0003 - Breno Macena - 462017");
     $display("Test XNOR gate:");
     $display("\n~(a ^ b) = s\n");
     a=0; b=0;
#1   $display("~(%b ^ %b) = %b", a, b, s);
     a=0; b=1;
#1   $display("~(%b ^ %b) = %b", a, b, s);		
     a=1; b=0;
#1   $display("~(%b ^ %b) = %b", a, b, s);		
     a=1; b=1;
#1   $display("~(%b ^ %b) = %b", a, b, s);		

end
endmodule // testxnorgate












