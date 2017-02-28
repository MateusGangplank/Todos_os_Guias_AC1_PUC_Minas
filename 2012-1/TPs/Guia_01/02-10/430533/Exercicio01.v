// Exercicio01 - NAND 
// Nome: Roger Rubens Machado 
// Matricula: 430533

// -- nand gate

module nandgate (output s, input p, input q);
 assign s = (~(p & q));
endmodule // nandgate

module testnandgate;
 reg a, b;
 wire s;
 
nandgate NAND1 (s, a, b);

initial begin: start
	a = 0;
	b = 0;
end

initial begin: main
	$display("Exercicio01 - Roger Rubens Machado - 430533"); 
	$display("Test nand gate");
	$display("\n(~(a & b)) = s\n");
	a = 0; b = 0;
	#1 $display("(~(%b & %b)) = %b", a, b, s);
	a = 0; b = 1; 
	#1 $display("(~(%b & %b)) = %b", a, b, s); 
	a = 1; b = 0; 
	#1 $display("(~(%b & %b)) = %b", a, b, s); 
	a = 1; b = 1; 
	#1 $display("(~(%b & %b)) = %b", a, b, s);
end
endmodule // testnandgate

 
 
