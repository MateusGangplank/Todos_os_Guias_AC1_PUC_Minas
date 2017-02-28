//-------------------------
//	Exemplo0015-OR
// Nome: Wellington Santos Corrêa
// Matricula: 472047
//-------------------------

//-------------------------
//--or gate
//-------------------------

module orgate ( output s,
						input a,
						input b,
						input c); 
 wire   temp1;

 or OR1 ( temp1, a ,  b );
 or OR2 ( s,  temp1 , c );
endmodule // orgate

//---------------------
//--test or gate
//---------------------
module testorgate;
//-------------------------dados locais
reg a, b, c; // definir registradores
wire s;
			// definir conexao (fio)
//-------------------------instancia
orgate OR1 (s, a, b, c);
//-------------------------preparacao
initial begin:start
				// atribuicao simultanea
				// dos valores iniciais
 a=0; b=0; c=0;
end
//-------------------------parte principal

initial begin
	$display("Exemplo0014 - Wellington Santos Corrêa - 472047");
	$display("Test OR gate");
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

endmodule // testorgate