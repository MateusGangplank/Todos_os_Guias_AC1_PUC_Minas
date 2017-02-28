// -------------------------
// Exemplo00049 - 
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
	output carryOut,
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire vaiUm;
	wire vaiUm1;
	wire vaiUm2;
	
	
	
	halfAdder HA1(s[0], vaiUm, a[0], b[0]);
	fullAdder FA1(s[1], vaiUm1, a[1], b[1],vaiUm);
	fullAdder FA2(s[2], vaiUm2, a[2], b[2],vaiUm1);	
	fullAdder FA3(s[3], carryOut, a[3], b[3],vaiUm2);
	
	

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
	

	module fullSub4 (output [4:0]s,
	output carryOut, 
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire vemUm;
	wire vemUm1;
	wire vemUm2;
	
	
	halfSub HS(s[0], vemUm, a[0], b[0]);
	fullSub FS1(s[1], vemUm1, a[1], b[1], vemUm);
	fullSub FS2(s[2], vemUm2, a[2], b[2], vemUm1);	
	fullSub FS3(s[3], s[4], a[3], b[3],vemUm2);
	
	

// descrever por portas 
	endmodule // fullSub 


// ------------------------- definir dados 
	
	module teste;
	
	reg [3:0] x; 
	wire [3:0] soma;
	
	ComplementoDois CD(soma, x);
	 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00049 - Flávio Andrade Amaral Motta - 392001"); 
	$display("Test ALU's Complemento de Dois"); 
	
	#1 x = 1111;
	
// projetar testes do ComplementoDois
	
	$monitor("x = %4b \t  saida = %5b\n",x,soma);
	#1 x = 0000;  
	#1 x = 0001; 
	#1 x = 0000; 
	#1 x = 1111; 
	
end 
endmodule // test_ComplementoDois