// Nome: Andre Sulivam 391998
// Guia 07


module halfadder(s, c, a, b);
	input  a, b;
		output s, c;
	
	xor XOR1 (s, a, b);
	and AND1 (c, a, b);
	
endmodule // end module halfladder


module halfsub (s, bout, a, b);
	input  a, b;
	output s, bout;
	
	wire s0, na;
	
	xor XOR1 (   s, a, b);
	not NOT1 (  na, a);
	and AND1 (bout,na, b);
	
endmodule // end module halfsub


module ex01(s, a, op);
	output[3:0] s;
	input [3:0] a;
	input 		op;
	
	xor XOR1(s[0],a[0],op);
	xor XOR2(s[1],a[1],op);
	xor XOR3(s[2],a[2],op);
	xor XOR4(s[3],a[3],op);
	
endmodule // end module ex01


module ex02(s, a, op);
	output[4:0] s;
	input [3:0] a;
	input 		op;
	wire  [3:0]	s0;
	wire		c1,c2,c3;
	
	ex01 EX1 (s0, a, op);
	
	halfadder ADDER1 (s[0],c1,op,s0[0]);
	halfadder ADDER2 (s[1],c2,c1,s0[1]);
	halfadder ADDER3 (s[2],c3,c2,s0[2]);
	halfadder ADDER4 (s[3],s[4],c3,s0[3]);

endmodule // end module ex02


module ex03(s, a, op);
	output[4:0] s;
	input [3:0] a;
	input 		op;
	wire  [3:0]	s0;
	wire		b1,b2,b3;
	
	ex01 EX1 (s0, a, op);
	
	halfsub SUB1 (s[0],b1,op,s0[0]);
	halfsub SUB2 (s[1],b2,b1,s0[1]);
	halfsub SUB3 (s[2],b3,b2,s0[2]);
	halfsub SUB4 (s[3],s[4],b3,s0[3]);

endmodule // end module ex03

module testes;
	reg [3:0] a1,a2,a3; 
	wire[3:0] s1;
	wire[4:0] s2,s3;
	reg		 op;
	
	ex01 EX1 (s1,a1,op);
	ex02 EX2 (s2,a2,op);
	ex03 EX3 (s3,a3,op);
	
	initial begin
$display("Andre Sulivam 391998");
$display("Guia 07\n");
		#1 a1 = 4'b0010; a2 = 4'b0010; a3 = 4'b0010; op = 0;
		$monitor("OPERADOR = %b\n Ex01: a = %4b, s = %4b\n Ex02: a = %4b, s = %5b \n Ex03: a = %4b, s = %5b\n",op,a1,s1,a2,s2,a3,s3);
		#1 a1 = 4'b0010; a2 = 4'b0010; a3 = 4'b0010; op = 1;
		#1 a1 = 4'b1010; a2 = 4'b1010; a3 = 4'b1010; op = 0;
		#1 a1 = 4'b1010; a2 = 4'b1010; a3 = 4'b1010; op = 1;
		#1 a1 = 4'b1110; a2 = 4'b1110; a3 = 4'b1110; op = 0;
		#1 a1 = 4'b1110; a2 = 4'b1110; a3 = 4'b1110; op = 1;
		#1 a1 = 4'b0111; a2 = 4'b0111; a3 = 4'b0111; op = 0;
		#1 a1 = 4'b0111; a2 = 4'b0111; a3 = 4'b0111; op = 1;
	end
endmodule // end module testes

/* 
 Andre Sulivam 391998
    Guia 07
    
    OPERADOR = 0
     Ex01: a = 0010, s = 0010
     Ex02: a = 0010, s = 00010 
     Ex03: a = 0010, s = 00110
    
    OPERADOR = 1
     Ex01: a = 0010, s = 1101
     Ex02: a = 0010, s = 01110 
     Ex03: a = 0010, s = 00100
    
    OPERADOR = 0
     Ex01: a = 1010, s = 1010
     Ex02: a = 1010, s = 01010 
     Ex03: a = 1010, s = 11110
    
    OPERADOR = 1
     Ex01: a = 1010, s = 0101
     Ex02: a = 1010, s = 00110 
     Ex03: a = 1010, s = 01100
    
    OPERADOR = 0
     Ex01: a = 1110, s = 1110
     Ex02: a = 1110, s = 01110 
     Ex03: a = 1110, s = 11010
    
    OPERADOR = 1
     Ex01: a = 1110, s = 0001
     Ex02: a = 1110, s = 00010 
     Ex03: a = 1110, s = 00000
    
    OPERADOR = 0
     Ex01: a = 0111, s = 0111
     Ex02: a = 0111, s = 00111 
     Ex03: a = 0111, s = 01101
    
    OPERADOR = 1
     Ex01: a = 0111, s = 1000
     Ex02: a = 0111, s = 01001 
     Ex03: a = 0111, s = 11001

*/