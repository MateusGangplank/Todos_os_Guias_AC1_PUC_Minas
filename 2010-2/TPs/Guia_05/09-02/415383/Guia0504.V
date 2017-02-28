// ---------------------
// Guia05
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

// ---------------------
// -- test ex04
// ---------------------

module meiasoma (a,b,s,carry);
 input   a, b;
 output s,carry;
 wire  Ncarry,carry,s,s0,s1,s2,Nand4,Nand5,nota,notb, snotaANDb, saANDnotb;
 nand NAND2 (nota, a, a); // Negar A.
 nand NAND3 (notb, b, b); // Negar B.
 nand NAND4 (saANDnotb, a, notb); // nand A & ~B
 nand NAND5 (snotaANDb, nota, b);  // nand ~A & B
 nand NAND6 (Nand4, saANDnotb, saANDnotb);  // negar
 nand NAND7 (Nand5, snotaANDb, snotaANDb);  //negar
 nand NAND8 (s2, Nand4, Nand5);      // nand portas 6 e 7.
 nand NAND9 (s1, Nand4, s2);         // nand porta 6 e 8.
 nand NAND10(s0, Nand5, s2);         // nand porta 7 e 8.
 nand NAND11(s, s0, s1);             // nand portas 9 e 10.
 nand NAND0 (Ncarry, a, b);  // ~ CarryOut.
 nand NAND1 (carry, Ncarry, Ncarry);  // CarryOut.
endmodule  // fim modulo principal

module somacompleta(a,b,cin,s,carry);
output s,carry;
input a,b,cin;
wire s0,c1,c2, nand1,nand2;
meiasoma HA (cin,a,s0,c1);
meiasoma HA2 (s0,b,s,c2);
nand NAND1 (nand1,c2);
nand NAND2 (nand2, c1, nand1);
nand NAND3 (carry, nand1, nand2);
endmodule
    
module testex4;
reg [1:0]a;
reg [1:0]b;
wire[2:0]s;
wire s0,s1,s1b,s2;
meiasoma HA (a[0],b[0],s0,s1);
somacompleta FA (a[1],b[1],s1,s1b,s2);
assign s[0] = s0;
assign s[1] = s1b;
assign s[2] = s2;
initial begin
      $display("Exercicio 04 - Lucas Teixeira Santos - 415383");
      $display("Soma Completa 2 Bits usando portas NAND.");
      $display("AA  +  BB  =  CCC");
a = 2'b00;
b = 2'b00;
   #1	 $monitor("%b  +  %b  =  %b", a, b, s);
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
    Soma Completa 2 Bits usando portas NAND.
    AA  +  BB  =  CCC
    00  +  00  =  000
    00  +  01  =  001
    00  +  10  =  010
    00  +  11  =  011
    01  +  00  =  001
    01  +  01  =  010
    01  +  10  =  011
    01  +  11  =  100
    10  +  00  =  010
    10  +  01  =  011
    10  +  10  =  100
    10  +  11  =  101
    11  +  00  =  011
    11  +  01  =  100
    11  +  10  =  101
    11  +  11  =  110
    
/*