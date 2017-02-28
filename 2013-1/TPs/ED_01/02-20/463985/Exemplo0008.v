//---------------------
// Exemplo0008 - XNOR
// Nome: Miguel Sousa
// Matricula: 463985
//---------------------

//---------------------
//--xnor gate
//---------------------
module xnorgate (output s,
					  input  a,
					  input  b);
  assign s = ( ~( a ^ b ));
endmodule // xnor

//---------------------
//--test xnor gate
//---------------------
module testxnorgate;
//-------------------------dados locais
reg a, b; // definir registradores
wire s;
			// definir conexao (fio)
//-------------------------instancia
xnorgate XNOR1 (s, a, b);
//-------------------------preparacao
initial begin:start
				// atribuicao simultanea
				// dos valores iniciais
 a=0; b=0;
end
//-------------------------parte principal

initial begin
	$display("Exemplo0008 - Miguel Sousa - 463985");
	$display("Test XNOR gate");
	$display("\n~(a ^ b) = s\n");
	a=0; b=0;
#1	$display("~(%b ^ %b) = %b", a, b, s);
	a=0; b=1;
#1	$display("~(%b ^ %b) = %b", a, b, s);
	a=1; b=0;
#1	$display("~(%b ^ %b) = %b", a, b, s);
	a=1; b=1;
#1	$display("~(%b ^ %b) = %b", a, b, s);
end

endmodule // testxnorgate