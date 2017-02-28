// ---------------------------------
// ------- Exercicio 01 - NAND -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Nand gate -------------
// ---------------------------------

module nandgate(output s, input p, input q);
assign s = ~(p & q);
endmodule

//----------------------------------
//---------- Test nand gate --------
//----------------------------------

module testnandgate;
//------------------ dados locais
reg a,b;

wire s;

//------------ instancia
nandgate NAND1(s,a,b);

initial begin:start
	a = 0; b = 0;
end

//------- parte principal
initial begin: main
	$display("Exercicio 01 - Ana Carolina - 449517");
	$display("Test NAND gate");
	$display("\n ~(a & b) = s\n");
	
	a = 0; b = 0;
#1	$display("~(%b & %b) = %b",a,b,s);
		a = 0; b = 1;
#1	$display("~(%b & %b) = %b",a,b,s);
		a = 1; b = 0;
#1	$display("~(%b & %b) = %b",a,b,s);
		a = 1; b = 1;
#1	$display("~(%b & %b) = %b",a,b,s);

end 

endmodule		


