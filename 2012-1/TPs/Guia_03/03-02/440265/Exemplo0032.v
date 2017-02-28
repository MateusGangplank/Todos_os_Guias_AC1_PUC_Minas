// ---------------------------------
// -- Exemplo0032 - circEx32 
// -- Nome: Alexnadre Plamieir Sad 
// -- Matricula: 440265 
// ---------------------------------

// ---------------------------------
// -- Modulo principal
// ---------------------------------
module circEx32(output ac, output bd, input a, input b, input c, input d, input SW);
	wire saac, soac, sabd, sobd, n0, n1, s0, s1, s2, s3;
	and AAC(saac, a, c);
	or  OAC(soac, a, c);
	and ABD(sabd, b, d);
	or  OBD(sobd, b, d);
	not N1(n0, SW);
	not N2(n1, SW);
	and A1(s0, saac, SW);
	and A2(s1, soac, n0);
	and A3(s2, sabd, SW);
	and A4(s3, sobd, n1);
	or  O1(ac, s0, s1);
	or  O2(bd, s2, s3);
endmodule

// ---------------------------------
// -- Modulo testador
// ---------------------------------
module testMain; 
// --------------------------------- definir dados 
	reg 	a, b, c, d;
	reg 	switch;
	wire 	s0, s1;
	
// --------------------------------- instanciando
	circEx32 C1(s0, s1, a, b, c, d, switch);
	
// --------------------------------- inicializacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		switch = 0;  
	end 
// --------------------------------- parte principal 
	initial begin 
		$display("Exemplo0032 - Sad - 440265"); 
		$display("Test LU's module");
		$display("Switch = 0 -> OR");
		$monitor(" %b%b | %b%b = %b%b", a, b, c, d, s0, s1); 
		
	// --------------------------------- projetar testes do modulo 
		#1
		a = 0; b = 0; c = 0; d = 0; switch = 0;
		#1
		a = 0; b = 0; c = 0; d = 1; switch = 0;
		#1
		a = 0; b = 0; c = 1; d = 0; switch = 0;
		#1
		a = 0; b = 0; c = 1; d = 1; switch = 0;
		#1
		a = 0; b = 1; c = 0; d = 0; switch = 0;
		#1
		a = 0; b = 1; c = 0; d = 1; switch = 0;
		#1
		a = 0; b = 1; c = 1; d = 0; switch = 0;		
		#1
		a = 0; b = 1; c = 1; d = 1; switch = 0;
		#1
		a = 1; b = 0; c = 0; d = 0; switch = 0;
		#1
		a = 1; b = 0; c = 0; d = 1; switch = 0;
		#1
		a = 1; b = 0; c = 1; d = 0; switch = 0;
		#1
		a = 1; b = 0; c = 1; d = 1; switch = 0;
		#1
		a = 1; b = 1; c = 0; d = 0; switch = 0;
		#1
		a = 1; b = 1; c = 0; d = 1; switch = 0;
		#1
		a = 1; b = 1; c = 1; d = 0; switch = 0;
		#1
		a = 1; b = 1; c = 1; d = 1; switch = 0;
		#1
		a = 0; b = 0; c = 0; d = 0; switch = 1;
		$display("-----------------------");
		$display("Switch = 1 -> AND");
		$monitor(" %b%b & %b%b = %b%b", a, b, c, d, s0, s1);
		#1
		a = 0; b = 0; c = 0; d = 1; switch = 1;
		#1
		a = 0; b = 0; c = 1; d = 0; switch = 1;
		#1
		a = 0; b = 0; c = 1; d = 1; switch = 1;
		#1
		a = 0; b = 1; c = 0; d = 0; switch = 1;
		#1
		a = 0; b = 1; c = 0; d = 1; switch = 1;
		#1
		a = 0; b = 1; c = 1; d = 0; switch = 1;		
		#1
		a = 0; b = 1; c = 1; d = 1; switch = 1;
		#1
		a = 1; b = 0; c = 0; d = 0; switch = 1;
		#1
		a = 1; b = 0; c = 0; d = 1; switch = 1;
		#1
		a = 1; b = 0; c = 1; d = 0; switch = 1;
		#1
		a = 1; b = 0; c = 1; d = 1; switch = 1;
		#1
		a = 1; b = 1; c = 0; d = 0; switch = 1;
		#1
		a = 1; b = 1; c = 0; d = 1; switch = 1;
		#1
		a = 1; b = 1; c = 1; d = 0; switch = 1;
		#1
		a = 1; b = 1; c = 1; d = 1; switch = 1;
	end 
endmodule // -- test_f4 