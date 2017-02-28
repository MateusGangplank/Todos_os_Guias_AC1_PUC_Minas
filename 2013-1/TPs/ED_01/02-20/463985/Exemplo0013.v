//-------------------------
//	Exemplo0013-AND
// Nome: Miguel Sousa
// Matricula: 463985
//-------------------------

//-------------------------
//--and gate
//-------------------------

module andgate ( output s,
						input a,
						input b,
						input c);
 assign s = a & b & c;
endmodule // andgate

//---------------------
//--test and gate
//---------------------
module testandgate;
//-------------------------dados locais
reg a, b, c; // definir registradores
wire s;
			// definir conexao (fio)
//-------------------------instancia
andgate AND1 (s, a, b, c);
//-------------------------preparacao
initial begin:start
				// atribuicao simultanea
				// dos valores iniciais
 a=0; b=0; c=0;
end
//-------------------------parte principal

initial begin
	$display("Exemplo0013 - Miguel Sousa - 463985");
	$display("Test AND gate");
	$display("\na & b & c = s\n");
	a=0; b=0; c=0;
#1	$display("%b & %b & %b = %b", a, b, c, s);
	a=0; b=0; c=1;
#1	$display("%b & %b & %b = %b", a, b, c, s);
	a=0; b=1; c=0;
#1	$display("%b & %b & %b = %b", a, b, c, s);
	a=0; b=1; c=1;
#1	$display("%b & %b & %b = %b", a, b, c, s);
	a=1; b=0; c=0;
#1	$display("%b & %b & %b = %b", a, b, c, s);
	a=1; b=0; c=1;
#1	$display("%b & %b & %b = %b", a, b, c, s);
	a=1; b=1; c=0;
#1	$display("%b & %b & %b = %b", a, b, c, s);
	a=1; b=1; c=1;
#1	$display("%b & %b & %b = %b", a, b, c, s);

end

endmodule // testandgate