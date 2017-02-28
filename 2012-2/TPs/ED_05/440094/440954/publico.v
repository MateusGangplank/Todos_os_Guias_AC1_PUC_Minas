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
endmodule // full adder

// -------------------------
// entrada B
// -------------------------
module entradaB(output s, input b, input cin);
	xor XOR1(s, b, cin);
endmodule // entrada B

// -------------------------
// incremento
// -------------------------
module incremento(output [2:0]s, input [2:0]a);
	wire [2:0]cout;
	fullAdder FA1(s[0], cout[0], a[0], 1, 0);
	fullAdder FA2(s[1], cout[1], a[1], 0, cout[0]);
	fullAdder FA3(s[2], cout[2], a[2], 0, cout[1]);
endmodule // incremento