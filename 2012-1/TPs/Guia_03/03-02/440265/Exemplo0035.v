// ---------------------------------
// -- Exemplo0035 - circEx35 
// -- Nome: Alexnadre Plamieir Sad 
// -- Matricula: 440265 
// ---------------------------------

// ---------------------------------
// -- Modulo principal
// ---------------------------------
module circEx35(output S, input a, input b, input c, input c1, input c2, input c3);
	
	wire e0, e1, e2, e3, e4, e5, e6;
	wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
	wire s0, s1, s2, s3, s4, s5, s6;
	
	not 	E0(e0, c);
	or  	E1(e1, a, b);
	nor 	E2(e2, a, b);
	and 	E3(e3, a, b);
	nand	E4(e4, a, b);
	xor 	E5(e5, a, b);
	xnor  E6(e6, a, b);
	
	not 	N1(n1, c1);
	not 	N2(n2, c2);
	not 	N3(n3, c3);
	not 	N4(n4, c1);
	not 	N5(n5, c2);
	not 	N6(n6, c1);
	not 	N7(n7, c3);
	not 	N8(n8, c1);
	not 	N9(n9, c2);
	not 	N10(n10, c3);
	not 	N11(n11, c2);
	not 	N12(n12, c3);
	
	and 	A0(s0, e0, n1, n2, n3);
	and 	A1(s1, e1, n4, n5, c3);
	and 	A2(s2, e2, n6, c2, n7);
	and 	A3(s3, e3, n8, c2, c3);
	and 	A4(s4, e4, c1, n9, n10);
	and 	A5(s5, e5, c1, n11, c3);
	and 	A6(s6, e6, c1, c2, n12);
	
	or		O1(S, s0, s1, s2, s3, s4, s5, s6);
	
		
endmodule

// ---------------------------------
// -- Modulo testador
// ---------------------------------
module testMain; 
// --------------------------------- definir dados 
	reg 	a, b, c;
	reg 	c1, c2, c3;
	wire 	s;
	
// --------------------------------- instanciando
	circEx35 C1(s, a, b, c, c1, c2, c3);
	
// --------------------------------- inicializacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
		c1 = 0;
		c2 = 0; 
		c3 = 0; 
	end 
// --------------------------------- parte principal 
	initial begin 
		$display("Exemplo0034 - Sad - 440265"); 
		$display("Test LU's module");
		$display("Switch = 000 -> NOT");
		$monitor(" %b = NOT -> %b", c, s); 
		
	// --------------------------------- projetar testes do modulo 
		#1
		a = 0; b = 0; c = 0; c1 = 0; c2 = 0; c3 = 0;
		#1
		a = 0; b = 0; c = 1; c1 = 0; c2 = 0; c3 = 0;
		
		#1
		a = 0; b = 0; c = 0; c1 = 0; c2 = 0; c3 = 1;
		$display("Switch = 001 -> OR");
		$monitor(" %b OR %b -> %b", a, b, s);
		#1
		a = 0; b = 1; c = 0; c1 = 0; c2 = 0; c3 = 1;
		#1
		a = 1; b = 0; c = 0; c1 = 0; c2 = 0; c3 = 1;
		#1
		a = 1; b = 1; c = 0; c1 = 0; c2 = 0; c3 = 1;
		
		#1
		a = 0; b = 0; c = 0; c1 = 0; c2 = 1; c3 = 0;
		$display("Switch = 010 -> NOR");
		$monitor(" %b NOR %b -> %b", a, b, s);
		#1
		a = 0; b = 1; c = 0; c1 = 0; c2 = 1; c3 = 0;
		#1
		a = 1; b = 0; c = 0; c1 = 0; c2 = 1; c3 = 0;
		#1
		a = 1; b = 1; c = 0; c1 = 0; c2 = 1; c3 = 0;
		
		#1
		a = 0; b = 0; c = 0; c1 = 0; c2 = 1; c3 = 1;
		$display("Switch = 011 -> AND");
		$monitor(" %b AND %b -> %b", a, b, s);
		#1
		a = 0; b = 1; c = 0; c1 = 0; c2 = 1; c3 = 1;
		#1
		a = 1; b = 0; c = 0; c1 = 0; c2 = 1; c3 = 1;
		#1
		a = 1; b = 1; c = 0; c1 = 0; c2 = 1; c3 = 1;
		
		#1
		a = 0; b = 0; c = 0; c1 = 1; c2 = 0; c3 = 0;
		$display("Switch = 100 -> NAND");
		$monitor(" %b NAND %b -> %b", a, b, s);
		#1
		a = 0; b = 1; c = 0; c1 = 1; c2 = 0; c3 = 0;
		#1
		a = 1; b = 0; c = 0; c1 = 1; c2 = 0; c3 = 0;
		#1
		a = 1; b = 1; c = 0; c1 = 1; c2 = 0; c3 = 0;
		
		#1
		a = 0; b = 0; c = 0; c1 = 1; c2 = 0; c3 = 1;
		$display("Switch = 101 -> XOR");
		$monitor(" %b XOR %b -> %b", a, b, s);
		#1
		a = 0; b = 1; c = 0; c1 = 1; c2 = 0; c3 = 1;
		#1
		a = 1; b = 0; c = 0; c1 = 1; c2 = 0; c3 = 1;
		#1
		a = 1; b = 1; c = 0; c1 = 1; c2 = 0; c3 = 1;
		
		#1
		a = 0; b = 0; c = 0; c1 = 1; c2 = 1; c3 = 0;
		$display("Switch = 110 -> XNOR");
		$monitor(" %b XNOR %b -> %b", a, b, s);
		#1
		a = 0; b = 1; c = 0; c1 = 1; c2 = 1; c3 = 0;
		#1
		a = 1; b = 0; c = 0; c1 = 1; c2 = 1; c3 = 0;
		#1
		a = 1; b = 1; c = 0; c1 = 1; c2 = 1; c3 = 0;
	end 
endmodule // -- test_f4 