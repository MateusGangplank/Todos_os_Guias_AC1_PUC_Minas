// Exemplo 0011 - XOR
// Nome : Ana Carolina Concei��o de Jesus
// Matricula : 449517
//---------------------------------
//---------------------------------
//---- xor gate ------------------
//---------------------------------
//---------------------------------

module xnorgate (output s,
input a, input b);

assign s = (((~(a)) & (b)) | ((a) & (~b)));

endmodule // xnorgate

// ------------------------
// -- test xnor gate
// -------------------------

module testxnorgate;
//------------ dados locais
reg a,b;  // definir registradores
wire s;   // definir conexao (fio)

//----------- instancia
xnorgate XNOR1 (s, a, b);

//--------- preparacao
initial begin:start
// atribuicao simultanea dos valores iniciais

a = 0; b = 0;
end

 //--------- parte principal
initial begin
$display ("Exemplo0011 - Ana Carolina - 449517 ");
$display ("Test XNOR gate");
$display ("\n ~(a|b) = s \n");
$monitor(" ~(%b | %b) = %b", a, b, s);

#1 a = 0; b = 0;

#1 a = 0; b = 1;

#1 a = 1; b = 0;

#1 a = 1; b = 1;

end
endmodule // test norgateDeMorgan

