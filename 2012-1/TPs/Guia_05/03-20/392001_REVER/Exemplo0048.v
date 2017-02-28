// -------------------------
// Exemplo00048 - 
// Nome: Flávio Andrade Amaral Motta 
// Matricula: 392001 
// ------------------------- 


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
	input Carry, 
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire vaiUm;
	wire vaiUm1;
	wire vaiUm2;
	wire s_xor;
	wire s_xor1;
	wire s_xor2;
	wire s_xor3;
	wire carryOut;
	
	
	
	xor XOR1	(s_xor,  b[0], Carry);
	xor XOR2	(s_xor1, b[1], Carry );
	xor XOR3	(s_xor2, b[2], Carry);
	xor XOR4	(s_xor3, b[3], Carry);
	
	
	fullAdder FA1(s[0], vaiUm, Carry, a[0], s_xor);
	fullAdder FA2(s[1], vaiUm1, a[1], s_xor1,vaiUm);
	fullAdder FA3(s[2], vaiUm2, a[2], s_xor2,vaiUm1);	
	fullAdder FA4(s[3],carryOut , a[3], s_xor3,vaiUm2);
	
	
	
// descrever por portas 
	endmodule // fullAdder 
	
	
// ------------------------- 
// half Subtractor
// ------------------------- 
	
	module halfSub( s0,s1, a, b);
	
	input a, b;
	output s0, s1;
	
	xor XOR1(s0, a, b);
	and AND1(s1,~a, b);

	endmodule 
	
// ------------------------- 
// full Subtractor
// -------------------------	
	
	module fullSub(s0, s1, a, b, c);
	
	input a, b, c;
	output s0, s1;
	wire q0, q1, q2;
	
	halfSub HS1(q0, q1, a, b);
	halfSub HS2(s0, q2, q0, c);
	or OR1(s1, q2, q1);
	
	endmodule
	

// ------------------------- 
// full subtractor 4 bits
// -------------------------	
	

	module fullSub4 (output [3:0]s,
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire vemUm;
	wire vemUm1;
	wire vemUm2;
	wire carryOut;
	
	
	halfSub HS(s[0], vemUm, a[0], b[0]);
	fullSub FS1(s[1], vemUm1, a[1], b[1], vemUm);
	fullSub FS2(s[2], vemUm2, a[2], b[2], vemUm1);	
	fullSub FS3(s[3],carryOut, a[3], b[3],vemUm2);
	
	

// descrever por portas 
	endmodule // fullSub 
	 
	
	


// ------------------------- definir dados 
	
	module teste;
	
	reg [3:0] x; 
	reg [3:0] y; 
	reg carry;
	reg [3:0]constante;
	wire [3:0] soma;
	wire [3:0] saida;
	
	fullAdder4 FA(soma, carry,x,y);
	fullSub4 FS1(saida, soma, constante);	
	
	
		
	
	 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00048 - Flávio Andrade Amaral Motta - 392001"); 
	$display("Test ALU's full adder");  
	
	
	#1 x = 1100; y = 0100; carry = 0; constante = 0001; 
	
// projetar testes do 
	
	$monitor("x = %4b \t y = %4b\t carry1 = %b\t constante = %b\t   saida = %5b\n",x,y,carry, constante, saida);
	
	#1 x = 0010; y = 0000; carry = 0; constante = 0001; 
	#1 x = 0001; y = 0001; carry = 1; constante = 0001; 
	#1 x = 0000; y = 0001; carry = 1; constante = 0001; 
	#1 x = 1111; y = 1000; carry = 0; constante = 0001; 
end 
endmodule // test_ComplementoDois