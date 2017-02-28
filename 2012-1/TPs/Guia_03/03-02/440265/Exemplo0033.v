// ---------------------------------
// -- Exemplo0033 - circEx33 
// -- Nome: Alexnadre Plamieir Sad 
// -- Matricula: 440265 
// ---------------------------------

// ---------------------------------
// -- Modulo principal
// ---------------------------------
module circEx33(output Oac, output Obd, output Nac, output Nbd, input a, input b, input c, input d, input SW);
	
	wire so1ac, sno1ac, so2bd, sno2bd, sa1ac, sna1ac, sa2bd, sna2bd; 
	wire n1, n2, n3, n4; 
	wire s0, s1, s2, s3, s4, s5, s6, s7; 
	
	or	   O1 (so1ac, a, c);	
	nor   NO1(sno1ac, a, c);
	or	   O2 (so2bd, b, d);
	nor   NO2(sno2bd, b, d);
	
	and	A1 (sa1ac, a , c);
	nand	NA1(sna1ac, a, c);
	and	A2 (sa2bd, b, d);
	nand	NA2(sna2bd, b, d);
	
	not 	N1(n1, SW);
	not 	N2(n2, SW);
	not 	N3(n3, SW);
	not 	N4(n4, SW);
	
	and 	A3(s0, so1ac, n1);
	and 	A4(s1, sno1ac, SW);
	and 	A5(s2, so2bd, n2);
	and 	A6(s3, sno2bd, SW);
	and 	A7(s4, sa1ac, n3);
	and 	A8(s5, sna1ac, SW);
	and 	A9(s6, sa2bd, n4);
	and  A10(s7, sna2bd, SW);
	
	or		O3(Oac, s0, s1);
	or		O4(Obd, s2, s3);
	or		O5(Nac, s4, s5);
	or		O6(Nbd, s6, s7);
	
endmodule

// ---------------------------------
// -- Modulo testador
// ---------------------------------
module testMain; 
// --------------------------------- definir dados 
	reg 	a, b, c, d;
	reg 	switch;
	wire 	s0, s1, s2, s3;
	
// --------------------------------- instanciando
	circEx33 C1(s0, s1, s2, s3, a, b, c, d, switch);
	
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
		$display("Exemplo0033 - Sad - 440265"); 
		$display("Test LU's module");
		$display("Switch = 0 -> OR/AND");
		$monitor(" %b%b   %b%b = OR -> %b%b  AND -> %b%b", a, b, c, d, s0, s1, s2, s3); 
		
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
		$display("Switch = 1 -> NOR/NAND");
		$monitor(" %b%b   %b%b = NOR -> %b%b NAND -> %b%b", a, b, c, d, s0, s1, s2, s3);
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