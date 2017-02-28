// ---------------------------------
// ------- Exercicio 04 - NAND -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Nand gate -------------
// ---------------------------------

module nandgateDeMorgan (output s, input a, input b);
 assign s = ((~a) | (~b));
 endmodule 
 
// ------------------------
// -- test nandDeMorgan gate
// -------------------------

module testnandDeMorgan;
//------------ dados locais
reg a,b;  
wire s;  

//----------- instancia
nandgateDeMorgan NAND1 (s, a, b);
//--------- preparacao
initial begin:start
a = 0; b = 0;
end

//--------- parte principal
initial begin
	$display ("Exercicio04 - Ana Carolina - 449517 ");
	$display ("Test NandDeMorgan gate");
	$display ("\n ~(a|b) = s \n");
	
	$monitor(" ~(%b | %b) = %b", a, b, s);

#1 a = 0; b = 0;
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;

end
endmodule