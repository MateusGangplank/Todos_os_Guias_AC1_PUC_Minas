// ---------------------------------
// ------- Exercicio 02 - NOR -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Nor gate -------------
// ---------------------------------

module norgate(output s, input p, input q);
assign s = ~(p | q);
endmodule

//----------------------------------
//---------- Test nor gate --------
//----------------------------------

module testnorgate;
//------------------ dados locais
reg a,b;

wire s;

//------------ instancia
norgate NOR1(s,a,b);

initial begin:start
	a = 0; b = 0;
end

//------- parte principal
initial begin: main
	$display("Exercicio 02 - Ana Carolina - 449517");
	$display("Test NOR gate");
	$display("\n ~(a | b) = s\n");
	
	a = 0; b = 0;
#1	$monitor("~(%b | %b) = %b",a,b,s);
#1		a = 0; b = 1;
#1		a = 1; b = 0;
#1		a = 1; b = 1;

end 

endmodule		


