// ---------------------
// Guia05
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

// ---------------------
// -- test ex03
// -- Expressao Simplificada:
// -- S0 = a0 & b0
// -- S1 = HS1 [(a1&b0) + (a0&b1)]
// -- S2 = HS2 [CarryHS1 + (a1&b1)] 
// -- S3 = CarryHS2
// ---------------------

module meiasoma (a,b,s,carry);
 output s,carry;
 input  a, b;
 assign carry = a & b;
 xor XOR (s,a,b);
         
endmodule  // fim modulo principal

module multiplicacao(a1,a0,b1,b0, s);
output [3:0]s;
input  a1,a0,b1,b0;
wire and1,and2,and3,carry1,carry2,soma1,soma2;
and AND1 (and1,a0,b1);
and AND2 (and2,a1,b0);
and AND3 (and3,a1,b1);
meiasoma HA1 (and1,and2,soma1,carry1);
meiasoma HA2 (and3,carry1,soma2,carry2);
assign s[0] = a0 & b0;
assign s[1] = soma1;
assign s[2] = soma2;
assign s[3] = carry2;
endmodule
    
module testex3;
reg [1:0]a;
reg [1:0]b;
wire [3:0]s;
multiplicacao M1 (a[1],a[0],b[1],b[0],s);
initial begin
      $display("Exercicio 03 - Lucas Teixeira Santos - 415383");
      $display("Multiplicacao 2 Bits.");
      $display("AA  *  BB  =  CCCC");
a = 2'b00;
b = 2'b00;
   #1	 $monitor("%b  *  %b  =  %b", a, b, s);
   #1  b=b+1;
   #1  b=b+1;
	#1  b=b+1;
	#1  a=a+1; b=0;
	#1  b=b+1;
   #1  b=b+1;
   #1  b=b+1;
	#1  a=a+1; b=0;	
	#1  b=b+1;
   #1  b=b+1;
   #1  b=b+1;
	#1  a=a+1; b=0;
	#1  b=b+1;
   #1  b=b+1;
   #1  b=b+1;
	 end

endmodule 
/* test
    Multiplicacao 2 Bits.
    AA  *  BB  =  CCCC
    00  *  00  =  0000
    00  *  01  =  0000
    00  *  10  =  0000
    00  *  11  =  0000
    01  *  00  =  0000
    01  *  01  =  0001
    01  *  10  =  0010
    01  *  11  =  0011
    10  *  00  =  0000
    10  *  01  =  0010
    10  *  10  =  0100
    10  *  11  =  0110
    11  *  00  =  0000
    11  *  01  =  0011
    11  *  10  =  0110
    11  *  11  =  1001
/*