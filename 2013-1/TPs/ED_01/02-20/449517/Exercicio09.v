// ---------------------------------
// ------- Exercicio 09 - AND -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- and gate -------------
// ---------------------------------

module andgate(output s, input p, input q);
assign s = p & q;
endmodule

//----------------------------------
//---------- Test and gate --------
//----------------------------------

module testandgate;
//------------------ dados locais
reg a,b,c;

wire s1,s2;

//------------ instancia
andgate AND1(s1,a,b);
andgate AND2(s2,s1,c);

initial begin:start
	a = 0; b = 0; c = 0;
end

//------- parte principal
initial begin: main
	$display("Exercicio 09 - Ana Carolina - 449517");
	$display("Test AND gate");
	$display("\n ((a & b) & c) = s\n");
	
	$monitor("((%b & %b)& %b) = %b",a,b,c,s2);
	
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


