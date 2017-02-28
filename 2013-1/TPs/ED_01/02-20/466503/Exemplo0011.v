//---------------------
// Exemplo0011 - XOR
// Nome: Douglas Henrique Silva Correa
// Matricula: 466503
//---------------------

//---------------------
//--xor gate
//---------------------
module xorgate (output s,
					  input  a,
					  input  b);
  assign s = ( (~a & b)|(a & ~b) );
endmodule // xor

//---------------------
//--test xor gate
//---------------------
module testxorgate;
//-------------------------dados locais
reg a, b; // definir registradores
wire s;
			// definir conexao (fio)
//-------------------------instancia
xorgate XOR1 (s, a, b);
//-------------------------preparacao
initial begin:start
				// atribuicao simultanea
				// dos valores iniciais
 a=0; b=0; a=0; b=0;
end
//-------------------------parte principal

initial begin
	$display("Exemplo0011 - Douglas Henrique Silva Correa - 466503");
	$display("Test XOR gate");
	$display("\n(a & b)|(~a & ~b) = s\n");
	a=0; b=0; a=0; b=0;
#1	$display("(%b & %b)|(~%b & ~%b) = %b", a, b, a, b, s);
	a=0; b=1; a=0; b=1;
#1	$display("(%b & %b)|(~%b & ~%b) = %b", a, b, a, b, s);
	a=1; b=0; a=1; b=0;
#1	$display("(%b & %b)|(~%b & ~%b) = %b", a, b, a, b, s);
	a=1; b=1; a=1; b=1;
#1	$display("(%b & %b)|(~%b & ~%b) = %b", a, b, a, b, s);
end

endmodule // testxorgate