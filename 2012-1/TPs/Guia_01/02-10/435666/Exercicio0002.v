// Exercicio02 - NOR 
// Nome: Julio Miranda Machado 
// Matricula: 435666

// -- nor gate

module norgate (output s, input p, input q);
 assign s = (~(p | q));
endmodule // norgate

module testnorgate;
 reg a, b;
 wire s;
 
norgate NOR1 (s, a, b);

initial begin: start
	a = 0;
	b = 0;
end

initial begin: main
	$display("Exercicio02 - Julio Miranda Machado - 435666"); 
	$display("Test nor gate");
	$display("\n\t\t\t(~(a | b)) = s\n");
	#1 a = 0; b = 0;
	$monitor("%d\t(~(%b | %b) = %b", $time,a, b, s);
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
end
endmodule // testnorgate