// ------------------------------------
// Exemplo0026 - FULL ADDER/SUBRACTOR
// Nome:Guilherme Diniz de Assumpção
// Matricula: 462269
// ------------------------------------

//-------------
//half adder
//------------

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

module fullAdder2(output[3:0]s,input[2:0]a,
							input[2:0]b,input carryIn);
 wire aux[2:0]; //complemento de 1
 wire carryOut[2:0];
 xor xor1(aux[0],b[0],carryIn);
 xor xor2(aux[1],b[1],carryIn);
 xor xor3(aux[2],b[2],carryIn);
 
 fullAdder fa1(s[0],carryOut[0],a[0],aux[0],carryIn);
 fullAdder fa2(s[1],carryOut[1],a[1],aux[1],carryOut[0]);
 fullAdder fa3(s[2],carryOut[2],a[2],aux[2],carryOut[1]);
 xor xor4(s[3],carryOut[2],carryIn);
 
endmodule //fullAdder2

module principal;
	reg [2:0]a,b;
	reg carryIn;
	wire [3:0]s;
	fullAdder2 fa2(s,a,b,carryIn);
	initial begin
		carryIn = 0;
		a = 0; b = 0;
		$display("Exemplo0026 - Guilherme Diniz de Assumpção - 462269"); 
		$display("Test ALU's full adder/subtractor");
		$display("CarryIn = 0 (adder), carryIn = 1 (subtractor)");
		$display("cIn a - b = s");
		$monitor("%b %3b +/- %3b = %4b",carryIn,a,b,s);
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 1; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 2; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 3; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 4; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 5; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 6; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 7; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		carryIn = 1;
		a = 0; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 1; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 2; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 3; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 4; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 5; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 6; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;
		
		#1 a = 7; b = 0;
		#1 b = 1;
		#1 b = 2;
		#1 b = 3;
		#1 b = 4;
		#1 b = 5;
		#1 b = 6;
		#1 b = 7;

	end
endmodule //principal
