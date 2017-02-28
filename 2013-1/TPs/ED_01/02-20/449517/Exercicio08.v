// ---------------------------------
// ------- Exercicio 08 - AND -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- and gate -------------
// ---------------------------------

module andgate(output s, input p, input q, input z);
assign s = ((p & q) & z);
endmodule

//----------------------------------
//---------- Test and gate --------
//----------------------------------

module testandgate;
//------------------ dados locais
reg a,b,c;

wire s;

//------------ instancia
andgate AND1(s,a,b,c);

initial begin:start
	a = 0; b = 0; c = 0;
end

//------- parte principal
initial begin: main
	$display("Exercicio 08 - Ana Carolina - 449517");
	$display("Test AND gate");
	$display("\n ((a & b) & c) = s\n");
	
	$monitor("((%b & %b)& %b) = %b",a,b,c,s);
	
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


