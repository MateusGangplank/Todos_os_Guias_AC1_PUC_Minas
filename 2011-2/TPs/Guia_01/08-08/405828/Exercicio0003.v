// -------------------------
// Exercicio0003 - XNOR
// Nome: Paulo Ricardo B. Souza
// Matricula: 405828
// -------------------------

// -------------------------
// -- xnor gate
// -------------------------
module xnorgate ( output s,
					  input p, q);
	assign s = ~(p ^ q);
endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------
module testxnorgate;

// ------------------------- dados locais
	reg a, b; // definir registradores
	wire s; // definir conexao (fio)

// ------------------------- instancia
xnorgate XNOR1 (s, a, b);

// ------------------------- preparacao
initial begin:start
	a=0; b=0;
end

// ------------------------- parte principal
initial begin
	$display("Exercicio0003 - Paulo Ricardo B. Souza - 405828");
	$display("Test XNOR gate");
	$display("\n~(a ^ b) = s\n");
	a=0; b=0;
	#1 $display("~(%b ^ %b) = %b", a, b, s);
	a=0; b=1;
	#1 $display("~(%b ^ %b) = %b", a, b, s);
	a=1; b=0;
	#1 $display("~(%b ^ %b) = %b", a, b, s);
	a=1; b=1;
	#1 $display("~(%b ^ %b) = %b", a, b, s);
	end
endmodule // testxnorgate

