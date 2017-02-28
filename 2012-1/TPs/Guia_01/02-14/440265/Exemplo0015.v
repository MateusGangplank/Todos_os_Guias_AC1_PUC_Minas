// ---------------------------------------------------------------
// -- Exemplo0015 - 	OR com 3 entradas usando outro de 2
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// -- orGate21
// ---------------------------------------------------------------

module orGate21(output s, input p, input q);
	assign s = p | q;
endmodule

// ---------------------------------------------------------------
// -- orGate31
// ---------------------------------------------------------------

module orGate31(output s, input a, input b, input c);
	wire s1;
	
	orGate21 M21(s1, a, b);
	orGate21 M22(s, s1, c);
	
endmodule


// ---------------------------------------------------------------
// -- Teste orGate31
// ---------------------------------------------------------------

module testOrGate31;
// -------------------------------------------------- dados locais
	reg a, b, c;
	wire s;

// ----------------------------------------------------- instancia
	orGate31 M31(s, a , b, c);
	
// ---------------------------------------------------- preparacao
	initial begin: start
		a = 0;
		b = 0;
		c = 0;
	end
// ----------------------------------------------- parte principal
	initial begin
		$display("Exemplo0015 - Sad - 440265");
		$display("Teste OR gate com 3 entradas");
		$display("\na | b | c = s\n");
		$monitor("%b | %b | %b = %b", a , b, c, s);
		
		#1
		a = 0; b = 0; c = 0;
		#1
		a = 0; b = 0; c = 1;
		#1
		a = 0; b = 1; c = 0;
		#1
		a = 0; b = 1; c = 1;
		#1
		a = 1; b = 0; c = 0;
		#1
		a = 1; b = 0; c = 1;
		#1
		a = 1; b = 1; c = 0;
		#1
		a = 1; b = 1; c = 1;				
	end		
endmodule // -- testOrGateModule31