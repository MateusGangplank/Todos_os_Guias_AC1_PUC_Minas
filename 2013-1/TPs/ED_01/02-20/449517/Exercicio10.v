// ---------------------------------
// ------- Exercicio 10 - OR -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- or gate -------------
// ---------------------------------

module orgate(output s, input p, input q);
assign s = p | q;
endmodule

//----------------------------------
//---------- Test and gate --------
//----------------------------------

module testorgate;
//------------------ dados locais
reg a,b,c;

wire s1,s2;

//------------ instancia
orgate OR1(s1,a,b);
orgate OR2(s2,s1,c);

initial begin:start
	a = 0; b = 0; c = 0;
end

//------- parte principal
initial begin: main
	$display("Exercicio 10 - Ana Carolina - 449517");
	$display("Test OR gate");
	$display("\n ((a | b) | c) = s\n");
	
	$monitor("((%b | %b)| %b) = %b",a,b,c,s2);
	
#1		a = 0; b = 0; c = 0;
#1		a = 0; b = 0; c = 1;
#1		a = 0; b = 1; c = 0;
#1		a = 0; b = 1; c = 1;
#1		a = 1; b = 0; c = 0;
#1		a = 1; b = 0; c = 1;
#1		a = 1; b = 1; c = 0;
#1		a = 1; b = 1; c = 1;

end 

endmodule		


