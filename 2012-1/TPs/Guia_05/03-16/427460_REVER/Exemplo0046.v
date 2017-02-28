// -------------------------
// Exemplo00046 - 
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
	input Carry, 
	input [3:0]a, 
	input [3:0]b, output saida); 
	
	// descrever por portas
	wire vaiUm;
	wire vaiUm1;
	wire vaiUm2;
	wire s_xor;
	wire s_xor1;
	wire s_xor2;
	wire s_xor3;
	
	
	
	
	xor XOR1	(s_xor,  b[0], Carry);
	xor XOR2	(s_xor1, b[1], Carry );
	xor XOR3	(s_xor2, b[2], Carry);
	xor XOR4	(s_xor3, b[3], Carry);
	
	
	fullAdder FA1(s[0], vaiUm, Carry, a[0], s_xor);
	fullAdder FA2(s[1], vaiUm1, a[1], s_xor1,vaiUm);
	fullAdder FA3(s[2], vaiUm2, a[2], s_xor2,vaiUm1);	
	fullAdder FA4(s[3], s[4], a[3], s_xor3,vaiUm2);
	
	
	nor NOR1(saida , s[0], s[1], s[2], s[3]);

// descrever por portas 
	endmodule // fullAdder 
	 
	
	


// ------------------------- definir dados 
	
	module teste;
	
	reg [3:0] x; 
	reg [3:0] y; 
	reg carry; 
	wire [4:0] soma;
	wire saida;
	
	fullAdder4 FA(soma, carry,x,y, saida);
	
	
	
		
	
	 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00046 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test ALU's full adder");  
	
	
	#1 x = 0000; y = 0000; carry = 1; 
	
// projetar testes do 
	
	$monitor("x = %4b \t y = %4b\t carry = %b\t  saida = %5b\t   igual = %b\n",x,y,carry,soma, saida);
	
	#1 x = 0010; y = 0000; carry = 0;
	#1 x = 0001; y = 0001; carry = 1; 
	#1 x = 0000; y = 0001; carry = 1; 
	#1 x = 1111; y = 1000; carry = 0;
	
end 
endmodule // test_ComplementoDois