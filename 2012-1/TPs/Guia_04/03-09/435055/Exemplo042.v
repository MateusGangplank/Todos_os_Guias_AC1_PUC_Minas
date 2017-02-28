// -------------------------
// Exemplo00042 - ComplementoDois
// Nome: Samuel Eusébio da Silva - 435055
// ------------------------- 


// ------------------------- 
// Complemento de Um
// ------------------------- 

	module Complemento1(output [3:0]sC, 
	input [3:0]a);
		
	
	not NOT1(sC[0], a[0]);
	not NOT2(sC[1], a[1]);
	not NOT3(sC[2], a[2]);
	not NOT4(sC[3], a[3]);
	
	endmodule


// ------------------------- 
// half adder 
// ------------------------- 
	
	module halfAdder( s0,s1, a, b);
	
	input a, b;
	output s0, s1;
	
	xor XOR1(s0, a, b);
	and AND1(s1, a, b);

	endmodule
	
// ------------------------- 
// full adder 
// -------------------------	
	
	module fullAdder(s0, s1, a, b, c);
	
	input a, b, c;
	output s0, s1;
	wire q0, q1, q2;
	
	halfAdder HA1(q0, q1, a, b);
	halfAdder HA2(s0, q2, c, q0);
	or OR1(s1, q2, q1);
	
	endmodule
	

// ------------------------- 
// full adder 4 bits
// -------------------------	
	

	module fullAdder4 (output [3:0]s, 
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire vaiUm;
	wire vaiUm1;
	wire vaiUm2;
	wire carryOut;
	
	halfAdder 01(s[0], vaiUm, a[0], b[0]);
	fullAdder 02(s[1], vaiUm1, a[1], b[1], vaiUm);
	fullAdder 03(s[2], vaiUm2, a[2], b[2], vaiUm1);	
	fullAdder 04(s[3], carryOut, a[3], b[3],vaiUm2);
	
	

// descrever por portas 
	endmodule // fullAdder 
	module test_fullAdder4; 
	

// ------------------------- 
// Complemento de Dois
// -------------------------
	
	module ComplementoDois(output [3:0]s,
	output carryOut, input [3:0]a, input [3:0]b  );
	
	wire s_half;
	wire s_half1;
	wire s_half2;
	wire s_half3;
	
	Complemento1 c1(s_half , a[0]);
	Complemento1 c2(s_half1, a[1]);
	Complemento1 c3(s_half2, a[2]);
	Complemento1 c4(s_half3, a[3]);
	
	fullAdder4 FA1(s[0],s_half, b[0]);
	fullAdder4 FA2(s[1],s_half1, b[1]);
	fullAdder4 FA3(s[2],s_half2, b[2]);
	fullAdder4 FA4(s[3],s_half3, b[3]);
	
	fullAdder4
	
	
		
	endomodule

// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg carry; 
	wire [3:0] soma; 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00038 - Samuel Eusébio da Silva - 435055"); 
	$display("Test ALU's Complemento de Dois"); 

// projetar testes do ComplementoDois
	
	$monitor("x = %3b \t y = %3b\t  saida = %3b\n",x,y,soma);
	#1 x = 0000; y = 0000; 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;  
	
end 
endmodule // test_ComplementoDois