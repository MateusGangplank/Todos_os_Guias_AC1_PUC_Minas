// ---------------------------------
// ------- Exemplo0002 - NOT -------
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Not gate --------------
// ---------------------------------

module notgate(output s, input p);
assign s = ~p;
endmodule // notgate

// --------------------------------
// -------- Test not gate ---------
// --------------------------------

module testnotgate;
// -------------- dados locais
reg a ; // definir registrador
			// (variavel independente)
wire s; // definir conexao (fio)
			// (variavel dependente)

// ----------------------- instancia
notgate NOT1(s,a);
// -------------------- preparação
initial begin:start
a = 0; // valor inicial
end

//----------- parte principal
initial begin:main
	$display("Exemplo0002 - Ana Carolina - 449517");
	$display("Test NOT gate");
	$display("\n~a = s\n");
		a = 0;

#1 $display("~%b = %b",a,s);
		a = 1;
#1 $display("~%b = %b",a,s);

end

endmodule // testnotgate
