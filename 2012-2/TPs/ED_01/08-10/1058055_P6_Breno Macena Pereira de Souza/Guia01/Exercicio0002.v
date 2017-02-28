// -------------------------
// Exercicio0002 - NOR
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- nand gate
// -------------------------
module norgate (output s, input p, input q);
assign s = (~(p | q));
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
     $display("Exercício 0001 - Breno Macena - 462017");
     $display("Test NOR gate:");
     $display("\n~(a & b) = s\n");
	  $monitor("~(%b | %b) = %b", a, b, s);
#1   a=0; b=0;
#1   a=0; b=1;		
#1   a=1; b=0;		
#1   a=1; b=1;		

end
endmodule // testnorgate












