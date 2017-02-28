// ------------------------- 
// Exemplo00039 - FULL SUB 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 

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
	
	module teste; 

// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	wire carry; 
	wire [4:0] sub; 
	
	fullSub4 FS(sub, carry, x, y);	
	
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00039 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test ALU's full subtractor"); 
	
	#1 x = 0010; y = 0000;
	
// projetar testes do sobtrator complete 
	
	$monitor("x = %3b \t y = %3b\t  saida = %3b\n",x,y,sub);
	#1 x = 0000; y = 0000; 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1001; y = 0110;  
	
end 
endmodule // test_fullAdder 