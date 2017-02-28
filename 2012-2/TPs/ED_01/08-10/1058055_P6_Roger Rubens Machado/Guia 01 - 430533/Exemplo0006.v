// Exemplo0006 - nand 
// Nome: Roger Rubens Machado 
// Matricula: 430533

// -- nand gate

module nandgate (output s, input p, input q);
 s = ~(p & q);
endmodule // nandgate

module testnandgate:	
 red a, b;
 wire s;
 
nandgate NAND1 (s, a, b);

initial begin: start
	a = 0;
	b = 0;
end

initial begin: main
	$display("Exemplo0006 - Roger Rubens Machado - 430533"); 
	$display("Test nand gate");
	$display("\n~(a & b) = s\n");
	
	#1 $display("~(%b & %b) = %b", a, b, s);
	a = 0; b = 1; 
	#1 $display("~(%b & %b) = %b", a, b, s); 
	a = 1; b = 0; 
	#1 $display("~(%b & %b) = %b", a, b, s); 
	a = 1; b = 1; 
	#1 $display("~(%b & %b) = %b", a, b, s);
end
endmodule // testnandgate