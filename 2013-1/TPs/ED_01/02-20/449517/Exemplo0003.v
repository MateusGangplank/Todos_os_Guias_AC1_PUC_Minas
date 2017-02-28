// ---------------------------------
// ------- Exemplo0003 - AND -------
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- And gate --------------
// ---------------------------------

module andgate(output s, input p, input q);
assign s = p & q;
endmodule // andtgate

// --------------------------------
// -------- Test and gate ---------
// --------------------------------

module testandgate;
// -------------- dados locais
reg a,b ; // definir registrador
			// (variavel independente)
wire s; // definir conexao (fio)
			// (variavel dependente)

// ----------------------- instancia
andgate AND1(s,a,b);
// -------------------- preparação
initial begin:start
a = 0; b = 0; // atribuição simultanea
end

//----------- parte principal
initial begin:main
	$display("Exemplo0003 - Ana Carolina - 449517");
	$display("Test AND gate");
	$display("\n a & b = s\n");
		a = 0; b = 0;

#1 $display("%b & %b = %b",a,b,s);
		a = 0; b = 1;
#1 $display("%b & %b = %b",a,b,s);
		a = 1; b = 0;
#1 $display("%b & %b = %b",a,b,s);
		a = 1; b = 1;
#1 $display("%b & %b = %b",a,b,s);

end

endmodule // testandgate
