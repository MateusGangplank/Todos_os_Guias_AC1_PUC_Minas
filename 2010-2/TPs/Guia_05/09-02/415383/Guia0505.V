// ---------------------
// Guia05
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

// ---------------------
// -- test ex05
// ---------------------

module meiadiferenca (a,b,s,carry);
 output s,carry;
 input  a, b;
 wire nota,notb,c,s1,s2,s0,s;
 nor NOTB (notb, b);
 nor CARRY (carry,notb,a);
 nor NOR0 (nota,a,a);
 nor NOR1 (notb,b,b);
 nor NOR3 (s1,a,notb);
 nor NOR4 (s2, nota, b);
 nor NOR5 (s0, s1,s2);
 nor NOR6 (s, s0, s0);
endmodule  // fim modulo principal

module diferencacompleta(a,b,cin,s0,carry);
output s0,carry;
input a,b,cin;
wire c1,c2,notC;
meiadiferenca HS (a,b,s,c1);
meiadiferenca HS2 (s,cin,s0,c2);
nor NOR1 (notC, c1,c2);
nor NOR2 (carry, notC);
endmodule
    
module testex5;
reg [1:0]a;
reg [1:0]b;
wire c0,s0,s1,c1,s2,c2;
meiadiferenca HA (a[0],b[0],s0,c0);
diferencacompleta FA (a[1],b[1],c0,s1,c1);
initial begin
      $display("Exercicio 05 - Lucas Teixeira Santos - 415383");
      $display("Diferenca Completa 2 Bits usando portas NOR.");
      $display("AA  -  BB  =  CCC");
a = 2'b00;
b = 2'b00;
   #1	 $monitor("%b  -  %b  =  %b%b%b", a, b,c1,s1,s0);
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
    Diferenca Completa 2 Bits usando portas NOR.
    AA  -  BB  =  CCC
    00  -  00  =  000
    00  -  01  =  111
    00  -  10  =  110
    00  -  11  =  101
    01  -  00  =  001
    01  -  01  =  000
    01  -  10  =  111
    01  -  11  =  110
    10  -  00  =  010
    10  -  01  =  001
    10  -  10  =  000
    10  -  11  =  111
    11  -  00  =  011
    11  -  01  =  010
    11  -  10  =  001
    11  -  11  =  000
/*