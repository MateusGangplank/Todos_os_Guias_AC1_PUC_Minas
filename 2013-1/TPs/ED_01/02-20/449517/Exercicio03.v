// ---------------------------------
// ------- Exercicio 03 - XNOR -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- XNor gate -------------
// ---------------------------------

module xnorgate(output s, input p, input q);
assign s = ~(p^q);
endmodule

//----------------------------------
//---------- Test xnor gate --------
//----------------------------------

module testxnorgate;
//------------------ dados locais
reg a,b;

wire s;

//------------ instancia
xnorgate XNOR1(s,a,b);

initial begin:start
	a = 0; b = 0;
end

//------- parte principal
initial begin: main
	$display("Exercicio 03 - Ana Carolina - 449517");
	$display("Test XNOR gate");
	$display("\n ~(a ^ b) = s\n");
	
	$monitor("~(%b ^ %b) = %b",a,b,s);
#1		a = 0; b = 0;
#1		a = 0; b = 1;
#1		a = 1; b = 0;
#1		a = 1; b = 1;

end 

endmodule		


