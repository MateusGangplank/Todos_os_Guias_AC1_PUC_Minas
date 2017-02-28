
// ------------------------------------
// Exemplo0044 - COMPLEMENTO DE 2
// Nome: Guilherme Diniz de Assumpção
// Matricula: 462269
// ------------------------------------


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

module fullAdder3bits(output [2:0]s,
		input [2:0]a, input[2:0]b, input carryIn);
	wire [2:0]carryOut,w1;
	fullAdder fa1(s[0],carryOut[0],a[0],b[0],carryIn);
	fullAdder fa2(s[1],carryOut[1],a[1],b[1],carryOut[0]);
	fullAdder fa3(s[2],carryOut[2],a[2],b[2],carryOut[1]);
endmodule //fullAdder3bits

module complemento(output [2:0]s, input [2:0]x);
	reg carryOut;
	wire [2:0]aux1;
	not not1(aux1[0],x[0]);
	not not2(aux1[1],x[1]);
	not not3(aux1[2],x[2]);
	fullAdder3bits fa1(s,aux1,3'b000,1'b1);
endmodule //complemento

module principal;

	reg [2:0]a;
	wire [2:0]s;
	complemento c2(s,a);
	initial begin
		$display("Exemplo0025 - Guilherme Diniz de Assumpção - 462269"); 
		$display("Test LU's complemento de 2");
		a = 0;
		$display("c2(a) = s");
		$monitor("c2(%4b) = %4b",a,s);
		#1 a = 1;
		#1 a = 2;
		#1 a = 3;
		#1 a = 4;
		#1 a = 5;
		#1 a = 6;
		#1 a = 7;
		end

endmodule //principal