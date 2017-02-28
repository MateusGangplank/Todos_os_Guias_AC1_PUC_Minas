module halfAdder(output s0,output s1,
					input a,input b);
	xor xor1(s0,a,b);
	and and1(s1,a,b);
endmodule //halfadder

module fullAdder(output s,output carryOut,
input a,input b,input carryIn);
	wire w0,w1,w2;
	halfAdder hf1(w0,w1,a,b);
	halfAdder hf2(s,w2,w0,carryIn);
	or or1(carryOut,w2,w1);
endmodule //fullAdder

module fullAdder4bits(output [3:0]s,
		input [3:0]a, input[3:0]b, input carryIn);
	wire [3:0]carryOut;
	fullAdder fa1(s[0],carryOut[0],a[0],b[0],carryIn);
	fullAdder fa2(s[1],carryOut[1],a[1],b[1],carryOut[0]);
	fullAdder fa3(s[2],carryOut[2],a[2],b[2],carryOut[1]);
	fullAdder fa4(s[3],carryOut[3],a[3],b[3],carryOut[2]);
endmodule //fullAdder4bits