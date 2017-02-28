// ---------------------------------
// ------- Exemplo0004 - or -------
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Or gate --------------
// ---------------------------------

module orgate(output s, input p, input q);
assign s = p | q;
endmodule // orgate

// --------------------------------
// -------- Test or gate ---------
// --------------------------------

module testorgate;
// -------------- dados locais
reg a,b ; // definir registrador
			// (variavel independente)
wire s; // definir conexao (fio)
			// (variavel dependente)

// ----------------------- instancia
orgate OR1(s,a,b);
// -------------------- preparação
initial begin:start
a = 0; b = 0; // atribuição simultanea
end

//----------- parte principal
initial begin:main
	$display("Exemplo0003 - Ana Carolina - 449517");
	$display("Test OR gate");
	$display("\n a | b = s\n");
		a = 0; b = 0;

#1 $display("%b | %b = %b",a,b,s);
		a = 0; b = 1;
#1 $display("%b | %b = %b",a,b,s);
		a = 1; b = 0;
#1 $display("%b | %b = %b",a,b,s);
		a = 1; b = 1;
#1 $display("%b | %b = %b",a,b,s);

end

endmodule // testorgate
