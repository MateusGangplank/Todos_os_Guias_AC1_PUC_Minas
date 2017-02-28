// ---------------------------------
// ------- Exercicio 05 - NOR -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Nor gate -------------
// ---------------------------------

module norgateDeMorgan (output s, input a, input b);
 assign s = ((~a) & (~b));
endmodule 
 
// ------------------------
// -- test norDeMorgan gate
// -------------------------

module testnorDeMorgan;
//------------ dados locais
reg a,b;  
wire s;  

//----------- instancia
norgateDeMorgan NOR1 (s, a, b);
//--------- preparacao
initial begin:start
a = 0; b = 0;
end

//--------- parte principal
initial begin
	$display ("Exercicio05 - Ana Carolina - 449517 ");
	$display ("Test NorDeMorgan gate");
	$display ("\n (~(a)) & (~(b)) = s \n");
	
	$monitor(" (~(%b)) & (~(%b)) = %b", a, b, s);

#1 a = 0; b = 0;
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;

end
endmodule