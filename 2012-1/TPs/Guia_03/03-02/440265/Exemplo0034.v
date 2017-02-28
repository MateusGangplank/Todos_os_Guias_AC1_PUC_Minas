// ---------------------------------
// -- Exemplo0034 - circEx34 
// -- Nome: Alexnadre Plamieir Sad 
// -- Matricula: 440265 
// ---------------------------------

// ---------------------------------
// -- Modulo principal
// ---------------------------------
module circEx34(output ac, output bd, input a, input b, input c, input d, input C1, input C2);
	
	wire o1, no1, x1, xo1, o2, no2, x2, xo2; 
	wire n1, n2, n3, n4, n5, n6, n7, n8; 
	wire s0, s1, s2, s3, s4, s5, s6, s7; 
	
	or	   O1  (o1, a, c);	
	nor   NO1 (no1, a, c);
	xor	XO1 (x1, a, c);
	xnor  XNO1(xo1, a, c);
	
	or	   O2  (o2, b, d);	
	nor   NO2 (no2, b, d);
	xor	XO2 (x2, b, d);
	xnor  XNO2(xo2, b, d);
	
	not 	N1(n1, C1);
	not 	N2(n2, C2);
	not 	N3(n3, C1);
	not 	N4(n4, C2);
	not 	N5(n5, C1);
	not 	N6(n6, C2);
	not 	N7(n7, C1);
	not 	N8(n8, C2);
	
	and 	A1(s0, o1, n1, n2);
	and 	A2(s1, no1, n3, C2);	
	and 	A3(s2, x1, C1, n4);
	and 	A4(s3, xo1, C1, C2);
	and 	A5(s4, o2, n5, n6);
	and 	A6(s5, no2, n7, C2);	
	and 	A7(s6, x2, C1, n8);
	and 	A8(s7, xo2, C1, C2);
	
	or		OR1(ac, s0, s1, s2, s3);
	or		OR2(bd, s4, s5, s6, s7);
	
endmodule

// ---------------------------------
// -- Modulo testador
// ---------------------------------
module testMain; 
// --------------------------------- definir dados 
	reg 	a, b, c, d;
	reg 	c1, c2;
	wire 	s0, s1;
	
// --------------------------------- instanciando
	circEx34 C1(s0, s1, a, b, c, d, c1, c2);
	
// --------------------------------- inicializacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		c1 = 0;
		c2 = 0;  
	end 
// --------------------------------- parte principal 
	initial begin 
		$display("Exemplo0034 - Sad - 440265"); 
		$display("Test LU's module");
		$display("Switch = 00 -> OR");
		$monitor(" %b%b   %b%b = OR -> %b%b", a, b, c, d, s0, s1); 
		
	// --------------------------------- projetar testes do modulo 
		#1
		a = 0; b = 0; c = 0; d = 0; c1 = 0; c2 = 0;
		#1
		a = 0; b = 0; c = 0; d = 1; c1 = 0; c2 = 0;
		#1
		a = 0; b = 0; c = 1; d = 0; c1 = 0; c2 = 0;
		#1
		a = 0; b = 0; c = 1; d = 1; c1 = 0; c2 = 0;
		#1
		a = 0; b = 1; c = 0; d = 0; c1 = 0; c2 = 0;
		#1
		a = 0; b = 1; c = 0; d = 1; c1 = 0; c2 = 0;
		#1
		a = 0; b = 1; c = 1; d = 0; c1 = 0; c2 = 0;
		#1
		a = 0; b = 1; c = 1; d = 1; c1 = 0; c2 = 0;
		#1
		a = 1; b = 0; c = 0; d = 0; c1 = 0; c2 = 0;
		#1
		a = 1; b = 0; c = 0; d = 1; c1 = 0; c2 = 0;
		#1
		a = 1; b = 0; c = 1; d = 0; c1 = 0; c2 = 0;
		#1
		a = 1; b = 0; c = 1; d = 1; c1 = 0; c2 = 0;
		#1
		a = 1; b = 1; c = 0; d = 0; c1 = 0; c2 = 0;
		#1
		a = 1; b = 1; c = 0; d = 1; c1 = 0; c2 = 0;
		#1
		a = 1; b = 1; c = 1; d = 0; c1 = 0; c2 = 0;
		#1
		a = 1; b = 1; c = 1; d = 1; c1 = 0; c2 = 0;
		#1
		a = 0; b = 0; c = 0; d = 0; c1 = 0; c2 = 1;
		
		$display("-----------------------");
		$display("Switch = 01 -> NOR");
		$monitor(" %b%b   %b%b = NOR -> %b%b ", a, b, c, d, s0, s1);
		#1
		a = 0; b = 0; c = 0; d = 1; c1 = 0; c2 = 1;
		#1
		a = 0; b = 0; c = 1; d = 0; c1 = 0; c2 = 1;
		#1
		a = 0; b = 0; c = 1; d = 1; c1 = 0; c2 = 1;
		#1
		a = 0; b = 1; c = 0; d = 0; c1 = 0; c2 = 1;
		#1
		a = 0; b = 1; c = 0; d = 1; c1 = 0; c2 = 1;
		#1
		a = 0; b = 1; c = 1; d = 0; c1 = 0; c2 = 1;		
		#1
		a = 0; b = 1; c = 1; d = 1; c1 = 0; c2 = 1;
		#1
		a = 1; b = 0; c = 0; d = 0; c1 = 0; c2 = 1;
		#1
		a = 1; b = 0; c = 0; d = 1; c1 = 0; c2 = 1;
		#1
		a = 1; b = 0; c = 1; d = 0; c1 = 0; c2 = 1;
		#1
		a = 1; b = 0; c = 1; d = 1; c1 = 0; c2 = 1;
		#1
		a = 1; b = 1; c = 0; d = 0; c1 = 0; c2 = 1;
		#1
		a = 1; b = 1; c = 0; d = 1; c1 = 0; c2 = 1;
		#1
		a = 1; b = 1; c = 1; d = 0; c1 = 0; c2 = 1;
		#1
		a = 1; b = 1; c = 1; d = 1; c1 = 0; c2 = 1;
		#1
		a = 0; b = 0; c = 0; d = 0; c1 = 1; c2 = 0;
		
		$display("-----------------------");
		$display("Switch = 10 -> XOR");
		$monitor(" %b%b   %b%b = XOR -> %b%b ", a, b, c, d, s0, s1);
		#1
		a = 0; b = 0; c = 0; d = 1; c1 = 1; c2 = 0;
		#1
		a = 0; b = 0; c = 1; d = 0; c1 = 1; c2 = 0;
		#1
		a = 0; b = 0; c = 1; d = 1; c1 = 1; c2 = 0;
		#1
		a = 0; b = 1; c = 0; d = 0; c1 = 1; c2 = 0;
		#1
		a = 0; b = 1; c = 0; d = 1; c1 = 1; c2 = 0;
		#1
		a = 0; b = 1; c = 1; d = 0; c1 = 1; c2 = 0;		
		#1
		a = 0; b = 1; c = 1; d = 1; c1 = 1; c2 = 0;
		#1
		a = 1; b = 0; c = 0; d = 0; c1 = 1; c2 = 0;
		#1
		a = 1; b = 0; c = 0; d = 1; c1 = 1; c2 = 0;
		#1
		a = 1; b = 0; c = 1; d = 0; c1 = 1; c2 = 0;
		#1
		a = 1; b = 0; c = 1; d = 1; c1 = 1; c2 = 0;
		#1
		a = 1; b = 1; c = 0; d = 0; c1 = 1; c2 = 0;
		#1
		a = 1; b = 1; c = 0; d = 1; c1 = 1; c2 = 0;
		#1
		a = 1; b = 1; c = 1; d = 0; c1 = 1; c2 = 0;
		#1
		a = 1; b = 1; c = 1; d = 1; c1 = 1; c2 = 0;
		#1
		a = 0; b = 0; c = 0; d = 0; c1 = 1; c2 = 1;
		
		$display("-----------------------");
		$display("Switch = 11 -> XNOR");
		$monitor(" %b%b   %b%b = XNOR -> %b%b ", a, b, c, d, s0, s1);
		#1
		a = 0; b = 0; c = 0; d = 1; c1 = 1; c2 = 1;
		#1
		a = 0; b = 0; c = 1; d = 0; c1 = 1; c2 = 1;
		#1
		a = 0; b = 0; c = 1; d = 1; c1 = 1; c2 = 1;
		#1
		a = 0; b = 1; c = 0; d = 0; c1 = 1; c2 = 1;
		#1
		a = 0; b = 1; c = 0; d = 1; c1 = 1; c2 = 1;
		#1
		a = 0; b = 1; c = 1; d = 0; c1 = 1; c2 = 1;		
		#1
		a = 0; b = 1; c = 1; d = 1; c1 = 1; c2 = 1;
		#1
		a = 1; b = 0; c = 0; d = 0; c1 = 1; c2 = 1;
		#1
		a = 1; b = 0; c = 0; d = 1; c1 = 1; c2 = 1;
		#1
		a = 1; b = 0; c = 1; d = 0; c1 = 1; c2 = 1;
		#1
		a = 1; b = 0; c = 1; d = 1; c1 = 1; c2 = 1;
		#1
		a = 1; b = 1; c = 0; d = 0; c1 = 1; c2 = 1;
		#1
		a = 1; b = 1; c = 0; d = 1; c1 = 1; c2 = 1;
		#1
		a = 1; b = 1; c = 1; d = 0; c1 = 1; c2 = 1;
		#1
		a = 1; b = 1; c = 1; d = 1; c1 = 1; c2 = 1;
	end 
endmodule // -- test_f4 