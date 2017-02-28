// -------------------------
// Exercicio0005 - NOR (De Morgan)
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- nor gate
// -------------------------
module norgate (output s, input p, input q);
assign s = ~p & ~q;
endmodule // norgate

// -------------------------
// -- test nor gate
// -------------------------
module testnorgate;
// ------------------------- dados locais
reg a, b;
wire s;
// ------------------------- instância
norgate NOR1 (s, a, b);
// ------------------------- preparação
initial begin:start
a=0; 
b=0; 
end

// ------------------------- parte principal
initial begin:main
     $display("Exercício 0005 - Breno Macena - 462017");
     $display("Test NOR gate:");
     $display("\n~a & ~b = s\n");
     a=0; b=0;
#1   $display("~%b & ~%b = %b", a, b, s);
     a=0; b=1;
#1   $display("~%b & ~%b = %b", a, b, s);		
     a=1; b=0;
#1   $display("~%b & ~%b = %b", a, b, s);		
     a=1; b=1;
#1   $display("~%b & ~%b = %b", a, b, s);		

end
endmodule // testnorgate












