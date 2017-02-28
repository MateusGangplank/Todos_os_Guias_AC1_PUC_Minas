// ------------------------- 
// Exemplo00038 - FULL ADDER 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
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
	

	module fullAdder4 (output [4:0]s,
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
	fullAdder FA3(s[3], s[4], a[3], b[3],vaiUm2);
	
	

// descrever por portas 
	endmodule // fullAdder 
	 
	
	
	
	
// ------------------------- definir dados 
	module teste;
	
	reg [3:0] x; 
	reg [3:0] y; 
	wire carry; 
	wire [4:0] soma; 
	
	fullAdder4 FA(soma, carry,x,y);
	
	
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00038 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test ALU's full adder"); 
	
	
	
	#1 x = 0000; y = 0000; 
	
// projetar testes do somador complete 
	
	$monitor("x = %4b \t y = %4b\t  saida = %5b\n",x,y,soma);
	
	#1 x = 0010; y = 0000; 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;  
	
	
	

end 
endmodule // test_fullAdder 