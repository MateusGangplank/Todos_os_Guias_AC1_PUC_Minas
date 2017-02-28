// -------------------------
// Exercicio0004 - NAND (De Morgan)
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- nand gate
// -------------------------
module nandgate (output s, input p, input q);
assign s = ~p | ~q;
endmodule // nandgate

// -------------------------
// -- test nand gate
// -------------------------
module testnandgate;
// ------------------------- dados locais
reg a, b;
wire s;
// ------------------------- instância
nandgate NAND1 (s, a, b);
// ------------------------- preparação
initial begin:start
a=0; 
b=0; 
end

// ------------------------- parte principal
initial begin:main
     $display("Exercício 0004 - Breno Macena - 462017");
     $display("Test NAND gate:");
     $display("\n~a | ~b = s\n");
     a=0; b=0;
#1   $display("~%b | ~%b = %b", a, b, s);
     a=0; b=1;
#1   $display("~%b | ~%b = %b", a, b, s);		
     a=1; b=0;
#1   $display("~%b | ~%b = %b", a, b, s);		
     a=1; b=1;
#1   $display("~%b | ~%b = %b", a, b, s);		

end
endmodule // testnandgate












