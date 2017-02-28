// -------------------------
// HALF ADDER / FULL ADDER / HALF SUBTRACTOR / FULL SUBTRACTOR
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// half adder
// -------------------------
module halfAdder(output s, output cout, input a, input b);
	xor XOR1(s, a, b);
	and AND1(cout, a, b);
endmodule // halfAdder

// -------------------------
// full adder
// -------------------------
module fullAdder(output s, output cout, input a, input b, input cin);
	wire s1, s2, s3;
	
	halfAdder HA1(s1, s2, a, b);
	halfAdder HA2(s, s3, s1, cin);
	
	or OR1(cout, s2, s3);
endmodule //fullAdder

// -------------------------
// half subtractor
// -------------------------
module halfSubtractor(output d, output bout, input a, input b);
	xor XOR1(d, a, b);
	and AND1(bout, ~a, b);
endmodule // halfSubtractor

// -------------------------
// full subtractor
// -------------------------
module fullSubtractor(output d, output bout, input a, input b, input bin);
	wire d1, d2, d3;
	
	halfSubtractor HS1(d1, d2, a, b);
	halfSubtractor HS2(d, d3, d1, bin);
	
	or OR1(bout, d2, d3);
endmodule // fullSubtractor

// -------------------------
// comparador igualdade
// -------------------------
module compareIgualdade(output s, input [2:0]a, input [2:0]b);
	wire s1, s2, s3;
	xnor XNOR1(s1, a[0], b[0]);
	xnor XNOR2(s2, a[1], b[1]);
	xnor XNOR3(s3, a[2], b[2]);
	
	and AND1(s, s1, s2, s3);
endmodule // compareIgualdade

// -------------------------
// comparador diferenca
// -------------------------
module compareDiferenca(output s, input [2:0]a, input [2:0]b);
	wire s1, s2, s3;
	
	xor XOR1(s1, a[0], b[0]);
	xor XOR2(s2, a[1], b[1]);
	xor XOR3(s3, a[2], b[2]);
	
	or OR1(s, s1, s2, s3);
endmodule // compareDiferenca

// -------------------------
// complemento de um
// -------------------------
module complementoUm(output [2:0]s, input [2:0]a);
	not NOT1(s[0], a[0]);
	not NOT2(s[1], a[1]);
	not NOT3(s[2], a[2]);
endmodule // complementoUm

// -------------------------
// complemento de dois
// -------------------------
module complementoDois(output [2:0]s, input [2:0]x);
	wire [2:0]y;
	wire [2:0]cout;
	
	complementoUm CM1(y, x);
		
	fullAdder FA1(s[0],cout[0],y[0],1,0);
	fullAdder FA2(s[1],cout[1],y[1],0,cout[0]);
	fullAdder FA3(s[2],cout[2],y[2],0,cout[1]);
endmodule // complementoDois

// -------------------------
// switch
// -------------------------
module switch(output [2:0]s, input [2:0]a, input [2:0]b, input c);
	wire s1, s2, s3, s4, s5, s6;
	
	and AND1(s1, b[0], c);
	and AND2(s2, a[0], ~c);
	and AND3(s3, b[1], c);
	and AND4(s4, a[1], ~c);
	and AND5(s5, b[2], c);
	and AND6(s6, a[2], ~c);
	
	or OR1(s[0], s1, s2);
	or OR2(s[1], s3, s4);
	or OR3(s[2], s5, s6);
endmodule // switch

// -------------------------
// zerador
// -------------------------
module zerador(output s, input a);
	and AND1(s, a, ~a);
endmodule // zerador

// -------------------------
// comparador
// -------------------------
module comparador(output s, input [2:0]a, input [2:0]b, input chave);
	wire s1, s2, s3, s4;
	
	compareIgualdade CI1(s1, a, b);
	compareDiferenca CD1(s2, a, b);
	
	and AND1(s3, s1, chave);
	and AND2(s4, s2, ~chave);

	or OR1(s, s3, s4);
	

endmodule // comparador