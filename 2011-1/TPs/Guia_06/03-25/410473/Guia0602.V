// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-06 
// Data de entrega: 14-17/03/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------


module halfadder (a, b, s0, s1);

	output s0, s1;
	input  a, b;
	assign s1 = a & b;
	xor XOR (s0, a, b);

endmodule // halfadder


module fulladder(a, b, cin, s0, s1);

	output s0, s1;
	input a, b, cin;
	wire c1, c2;
	halfadder HA (cin, a, s, c1);
	halfadder HA2 (s, b, s0, c2);
	assign s1 = c1 | c2;

endmodule // fulladder

	 
module adder4b(a, b, s);

	output [3:0]s;
	input [3:0]a;
	input [3:0]b;
	wire c0, c1, c2, cout;
	halfadder HA (a[0], b[0], s[0], c0);
	fulladder FA1 (a[1], b[1], c0, s[1], c1);
	fulladder FA2 (a[2], b[2], c1, s[2], c2);
	fulladder FA3 (a[3], b[3], c2, s[3], cout); 

endmodule // adder4b
	
	 
module C2 (b, s);

	input [3:0]b;
	output [3:0]s;
	wire [3:0]bnot;
	reg [3:0]maisum;
	initial begin 
	maisum = 4'b0001;
	end
	not NOT1 (bnot[0], b[0]);
	not NOT2 (bnot[1], b[1]);
	not NOT3 (bnot[2], b[2]);
	not NOT4 (bnot[3], b[3]);
	adder4b SOMA (bnot, maisum, s);

endmodule // C2	 

	 
module sub(a, b, b2, s);

	input [3:0]a;
	input [3:0]b;
	output[3:0]s;
	output[3:0]b2;
	wire c0, c1, c2;
	C2 complemento(b, b2);
	adder4b soma (a, b2, s);	 

endmodule // sub

	 
module zero(a, s);

	input [3:0]a;
	output s;
	nor NOR1 (s, a[0], a[1], a[2], a[3]);

endmodule // zero 

	 
module testex2;

	reg [3:0]a;
	reg [3:0]b;
	wire [3:0]s;
	wire [3:0]b2;
	wire not_zero, not_menor, zero, menor, maior;
	zero ZERO1 (s, zero);
	sub SUB1 (a, b, b2, s);
	assign menor = s[3]; 
	not NOT1 (not_menor, menor);
	not NOT2 (not_zero, zero);
	and AND1 (maior, not_zero, not_menor);
	
	initial begin
      $display("Exercicio 02 - Pedro Tronbin - 410473");
      $display("AAAA  -  BBBB  C2(+BBBB) =   CCCCC  (<=>)");
		a = 4'b0000;
		b = 4'b0000;
 	    #1  $monitor("%4b  -  %4b  (+%4b)   =   %4b  (%b%b%b)", a, b, b2, s,menor,zero,maior );
  	    #1  b=b+1;
   	 #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
   	 #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
     	 #1  b=b+1;
   	 #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
 	    #1  b=b+1;
  	    #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
		 #1  b=b+1;
  	    #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1; 
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
       #1  b=b+1;
		 #1  a=a+1;
		 #1  b=b+1;
	    #1  b=b+1;
    	 #1  b=b+1;
		 #1  a=a+1;
 end

endmodule // testex2
 
/* SAIDA

    Exercicio 02 - Pedro Tronbin - 410473
    AAAA  -  BBBB  C2(+BBBB) =   CCCCC  (<=>)
    0000  -  0000  (+0000)   =   0000  (010)
    0000  -  0001  (+1111)   =   1111  (100)
    0000  -  0010  (+1110)   =   1110  (100)
    0001  -  0010  (+1110)   =   1111  (100)
    0001  -  0011  (+1101)   =   1110  (100)
    0001  -  0100  (+1100)   =   1101  (100)
    0010  -  0100  (+1100)   =   1110  (100)
    0010  -  0101  (+1011)   =   1101  (100)
    0010  -  0110  (+1010)   =   1100  (100)
    0010  -  0111  (+1001)   =   1011  (100)
    0011  -  0111  (+1001)   =   1100  (100)
    0011  -  1000  (+1000)   =   1011  (100)
    0011  -  1001  (+0111)   =   1010  (100)
    0011  -  1010  (+0110)   =   1001  (100)
    0100  -  1010  (+0110)   =   1010  (100)
    0100  -  1011  (+0101)   =   1001  (100)
    0100  -  1100  (+0100)   =   1000  (100)
    0100  -  1101  (+0011)   =   0111  (001)
    0101  -  1101  (+0011)   =   1000  (100)
    0101  -  1110  (+0010)   =   0111  (001)
    0101  -  1111  (+0001)   =   0110  (001)
    0101  -  0000  (+0000)   =   0101  (001)
    0110  -  0000  (+0000)   =   0110  (001)
    0110  -  0001  (+1111)   =   0101  (001)
    0110  -  0010  (+1110)   =   0100  (001)
    0111  -  0010  (+1110)   =   0101  (001)
    0111  -  0011  (+1101)   =   0100  (001)
    0111  -  0100  (+1100)   =   0011  (001)
    1000  -  0100  (+1100)   =   0100  (001)
    1000  -  0101  (+1011)   =   0011  (001)
    1000  -  0110  (+1010)   =   0010  (001)
    1001  -  0110  (+1010)   =   0011  (001)
    1001  -  0111  (+1001)   =   0010  (001)
    1001  -  1000  (+1000)   =   0001  (001)
    1010  -  1000  (+1000)   =   0010  (001)
    1010  -  1001  (+0111)   =   0001  (001)
    1010  -  1010  (+0110)   =   0000  (010)
    1011  -  1010  (+0110)   =   0001  (001)
    1011  -  1011  (+0101)   =   0000  (010)
    1011  -  1100  (+0100)   =   1111  (100)
    1100  -  1100  (+0100)   =   0000  (010)
    1100  -  1101  (+0011)   =   1111  (100)
    1100  -  1110  (+0010)   =   1110  (100)
    1101  -  1110  (+0010)   =   1111  (100)
    1101  -  1111  (+0001)   =   1110  (100)
    1101  -  0000  (+0000)   =   1101  (100)
    1110  -  0000  (+0000)   =   1110  (100)
    1110  -  0001  (+1111)   =   1101  (100)
    1110  -  0010  (+1110)   =   1100  (100)
    1110  -  0011  (+1101)   =   1011  (100)
    1111  -  0011  (+1101)   =   1100  (100)
   
*/