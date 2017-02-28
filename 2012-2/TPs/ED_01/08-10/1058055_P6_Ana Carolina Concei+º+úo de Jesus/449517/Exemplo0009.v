//Exemplo009 -  NAND (De Morgan)
// Nome : Ana Carolina Conceiçao de Jesus
// Matricula : 449517
//---------------------------------
//---------------------------------
//---- nand gate (De Morgan)-------
//---------------------------------
//---------------------------------

module nandgateDeMorgan (output s,
 input a, input b);
 
 assign s = ((~a) | (~b));

 endmodule // nandDeMorgan

 // ------------------------
// -- test nandDeMorgan gate
// -------------------------

module testnandDeMorgan;
//------------ dados locais
reg a,b;  // definir registradores
wire s;   // definir conexao (fio)

//----------- instancia
nandgateDeMorgan NAND1 (s, a, b);
//--------- preparacao
initial begin:start
// atribuicao simultanea dos valores iniciais

a = 0; b = 0;
end

//--------- parte principal
initial begin
$display ("Exemplo0009 - Ana Carolina - 449517 ");
$display ("Test NandDeMorgan gate");
$display ("\n ~(a|b) = s \n");
$monitor(" ~(%b | %b) = %b", a, b, s);

#1 a = 0; b = 0;

#1 a = 0; b = 1;

#1 a = 1; b = 0;

#1 a = 1; b = 1;

end
endmodule // test xnorgate







