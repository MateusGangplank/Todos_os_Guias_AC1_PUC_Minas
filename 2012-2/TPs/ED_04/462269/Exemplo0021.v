// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome:Guilherme Diniz de Assumpção
// Matricula: 462269
// ------------------------- 


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

module fullAdder3bits(output [2:0]s,output carry,
		input [2:0]a, input[2:0]b, input carryIn);
	wire [2:0]carryOut,w1;
	fullAdder fa1(s[0],carryOut[0],a[0],b[0],carryIn);
	fullAdder fa2(s[1],carryOut[1],a[1],b[1],carryOut[0]);
	fullAdder fa3(s[2],carryOut[2],a[2],b[2],carryOut[1]);
	or or1(carry,carryOut[0],carryOut[1]);
	or or2(carry,carry,carryOut[2]);
endmodule //fullAdder3bits


module test_fullAdder; 
// ------------------------- definir dados 
	reg [2:0] x; 
	reg [2:0] y; 
	wire carry; 
	wire [2:0] soma;
	
// ------------------------- instância
	fullAdder3bits fa1(soma,carry,x,y, 0);
	
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Guilherme Diniz de Assumpção - 462269"); 
		$display("Test ALU's full adder"); 
		x = 3'b000;
		y = 3'b000;
		//carry = 0;
		$display("\t  \tt\tx + y = soma");
		$monitor("%d %3b + %3b = %b(c) %3b",$time,x,y,carry,soma);
		#1 y = 3'b001;
		#1 y = 3'b010;
		#1 y = 3'b011;
		#1 y = 3'b100;
		#1 y = 3'b101;
		#1 y = 3'b110;
		#1 y = 3'b111;
				
		#1 x = 3'b111; y = 3'b000;
		#1 y = 3'b001;
		#1 y = 3'b010;
		#1 y = 3'b011;
		#1 y = 3'b100;
		#1 y = 3'b101;
		#1 y = 3'b110;
		#1 y = 3'b111;
	end 
endmodule // test_fullAdder 