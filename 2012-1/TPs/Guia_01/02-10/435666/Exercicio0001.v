// Exercicio01 - NAND 
// Nome: Julio Miranda Machado 
// Matricula: 435666

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
	$display("Exercicio01 - Julio miranda machado - 435666"); 
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

 
 
