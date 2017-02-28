// Exercicio07 - XNOR  
// Nome: Julio Miranda Machado 
// Matricula: 435666

// -- xor gate

module xnorgate(output s, input p, input q);
 assign s = ((p&q)|(~p&~q));
endmodule // xnorgate

module testxnorgate;
 reg a, b;
 wire s;
 
xnorgate XNOR1 (s, a, b);
 
initial begin: start
	a = 0;
	b = 0;
end

initial begin: main
	$display("Exercicio07 - Julio Miranda Machado - 435666"); 
	$display("Test xnor gate");
	$display("\n\t\t\t((a&b)|(~a&~b)) = s\n");
	$monitor("%d\t((%b&%b)|(~%b&~%b)) = %b", $time,a, b, a, b, s);
	#1 a = 0; b = 0;
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
end
endmodule // testxnorgate
