// ------------------------- 
// Exemplo00038 - FULL ADDER 
// Nome: Marcio Santana Correa 
// Matricula: 345368
// ------------------------- 

// ------------------------- 
// half adder 
// ------------------------- 
	
	module halfAdder( s0,carry_out, a, b);
	
	input a, b;
	output s0, carry_out;
	
	xor XOR1(s0, a, b);
	and AND1(carry_out, a, b);

	endmodule 
	
// ------------------------- 
// full adder 
// -------------------------	
	
	module fullAdder(s0, carry_out, a, b, carry_in);
	
	input a, b, carry_in;
	output s0, carry_out;
	
	halfAdder HA1(s_ha1, c_out1, a, b);
	halfAdder HA2(s_ha2, c_out2, s_ha1, carry_in);
	
	or OR1(carry_out, s_ha1, c_out1);
	
	endmodule
	

// ------------------------- 
// full adder 4 bits
// -------------------------	
	

	module fullAdder4 (output [3:0]s,output carry_out, input [3:0]a, input [3:0]b); 
	
	// descrever por portas
	wire c_in;
	wire c_in1;
	wire c_in2;
	wire carry_out;
	
	halfAdder HA1(s[0], c_in, a[0], b[0]);
	fullAdder FA1(s[1], c_in1, a[1], b[1], c_in);
	fullAdder FA2(s[2], c_in2, a[2], b[2], c_in1);	
	fullAdder FA3(s[3], carry_out, a[3], b[3],c_in2);
	
	

// descrever por portas 
	endmodule // fullAdder 
	module test_fullAdder4; 

// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg carry; 
	wire [3:0] soma; 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00038 - Marcio Santan Correa 345368"); 
	$display("Test ALU's full adder"); 

// projetar testes do somador complete 
	
	$monitor("x = %3b \t y = %3b\t  saida = %3b\n",x,y,soma);
	#1 x = 0000; y = 0000; 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;  
	
end 
endmodule // test_fullAdder 