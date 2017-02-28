// Exemplo 0013 - AND (4 entradas)
// Nome : Ana Carolina Conceição de Jesus
// Matricula : 449517
//---------------------------------
//---------------------------------
//---- and gate ------------------
//---------------------------------
//---------------------------------

module andgate (output s,
input a, input b, input c, input d);

assign s = ((a & b) & (c & d)) ;

endmodule // andgate

// ------------------------
// -- test and gate
// -------------------------

module testandgate;
//------------ dados locais
reg a,b,c,d;  // definir registradores
wire s;   // definir conexao (fio)

//----------- instancia
andgate AND1 (s, a,b,c,d);

//--------- preparacao
initial begin:start
// atribuicao simultanea dos valores iniciais

a = 0; b = 0; c = 0; d = 0;
end

 //--------- parte principal
initial begin
$display ("Exemplo0013 - Ana Carolina - 449517 ");
$display ("Test AND gate com 4 entradas");
$display ("\n a & b = s\n");
$monitor(" ((%b & %b) & (%b & %b)) = %b", a,b,c,d, s);

#1 a = 0; b = 0; c = 0; d = 0;

#1 a = 0; b = 0; c = 0; d = 1;

#1 a = 0; b = 0; c = 1; d = 0;

#1 a = 0; b = 0; c = 1; d = 1;

#1 a = 0; b = 1; c = 0; d = 0;

#1 a = 0; b = 1; c = 0; d = 1;

#1 a = 0; b = 1; c = 1; d = 0;

#1 a = 0; b = 1; c = 1; d = 1;

#1 a = 1; b = 0; c = 0; d = 0;

#1 a = 1; b = 0; c = 0; d = 1;

#1 a = 1; b = 0; c = 1; d = 0;

#1 a = 1; b = 0; c = 1; d = 1;

#1 a = 1; b = 1; c = 0; d = 0;

#1 a = 1; b = 1; c = 0; d = 1;

#1 a = 1; b = 1; c = 1; d = 0;

#1 a = 1; b = 1; c = 1; d = 1;

end
endmodule // test norgateDeMorgan

