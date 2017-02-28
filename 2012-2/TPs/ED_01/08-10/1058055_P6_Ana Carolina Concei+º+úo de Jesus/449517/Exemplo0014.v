// Exemplo 0014 - AND (usando modulos de duas entradas)
// Nome : Ana Carolina Conceição de Jesus
// Matricula : 449517
//---------------------------------
//---------------------------------
//---- and gate ------------------
//---------------------------------
//---------------------------------

module andgate (output s,
input a, input b);

assign s = a & b ;

endmodule // andgate

// ------------------------
// -- test and gate
// -------------------------

module testandgate;
//------------ dados locais
reg a,b,c,d;  // definir registradores
wire s, s1, s2;   // definir conexao (fio)

//----------- instancia
andgate AND1 (s, a, b);
andgate AND2 (s1,c, d);
andgate AND3 (s2, s, s1);

//--------- preparacao
initial begin:start
// atribuicao simultanea dos valores iniciais

a = 0; b = 0; c = 0; d = 0;
end

 //--------- parte principal
initial begin
$display ("Exemplo0014 - Ana Carolina - 449517 ");
$display ("Test AND gate com 4 entradas");
$display ("\n a & b =  s \n");
$monitor(" ((%b & %b) & (%b & %b)) = %b", a,b,c,d, s2);

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
endmodule // test andgate

