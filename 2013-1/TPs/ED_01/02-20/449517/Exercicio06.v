// ---------------------------------
// ------- Exercicio 06 - XOR -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Xor gate -----------

module xnorgate (output s,
input a, input b);

assign s = (((~(a)) & (b)) | ((a) & (~b)));

endmodule // xorgate

// ------------------------
// -- test xor gate
// -------------------------

module testxnorgate;
//------------ dados locais
reg a,b;  
wire s;   

//----------- instancia
xnorgate XOR1 (s, a, b);

//--------- preparacao
initial begin:start
a = 0; b = 0;
end

 //--------- parte principal
initial begin
	$display ("Exemplo06 - Ana Carolina - 449517 ");
	$display ("Test XOR gate");
	$display ("\n (((~(a)) & (b)) | ((a) & (~b))) = s \n");
	
	$monitor(" ~(%b | %b) = %b", a, b, s);
#1 a = 0; b = 0;
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;

end

endmodule