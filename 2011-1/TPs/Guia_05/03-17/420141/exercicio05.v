// Guia 05
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module operadorMD ( s0,s1,a,b );

output s0,s1;
input a,b;
wire s2,s3,s4,s5,s6;

nor NOR1 (s2,b,b);
nor NOR2 (s3,a,a);
nor NOR3 (s4,s2,s3);
nor NOR4 (s5,a,b);
nor NOR5 (s0,s4,s5);
nor NOR6 (s6,b,b);
nor NOR7 (s1,a,s6);

endmodule

module operadorDC(s0,s1,a,b,c);
output s0,s1;
input a,b,c;
wire s2,s3,s4,s5;

operadorMD MD1(s2,s3,a,b);
operadorMD MD2(s0,s4,s2,c);
nor NOR1(s5,s3,s4);
nor NOR2(s1,s5,s5);

endmodule

module DC3Bits (s,a,b);
output[3:0]s;
input[2:0]a,b;
wire[1:0]c;

operadorMD MD1(s[0],c[0],a[0],b[0]);
operadorDC DC1(s[1],c[1],a[1],b[1],c[0]);
operadorDC DC2(s[2],s[3],a[2],b[2],c[1]);

endmodule

module testDC;
reg[2:0]a,b;
wire[3:0]s;
integer i,j;

DC3Bits DC3B(s,a,b);

initial begin : start

a=0; b=0;

end

initial begin : main

#1 $display ( " Operador Diferença Completa Com Portas Nor - 3 Bits " );
#1 $display ( "   a  -  b   =  s   " );
	$monitor ( " %3b  %3b  = %4b ",a,b,s);
	
	for ( i = 0; i < 8; i = i + 1)begin
	 a = i;
	for ( j = 0; j < 8; j = j + 1)begin
	#1 b = j;
	end
	end
				
end

endmodule

/* Operador Diferença Completa Com Portas Nor - 3 Bits 
       a  -  b   =  s   
     000  000  = 0000 
     000  001  = 1111 
     000  010  = 1110 
     000  011  = 1101 
     000  100  = 1100 
     000  101  = 1011 
     000  110  = 1010 
     001  111  = 1010 
     001  000  = 0001 
     001  001  = 0000 
     001  010  = 1111 
     001  011  = 1110 
     001  100  = 1101 
     001  101  = 1100 
     001  110  = 1011 
     010  111  = 1011 
     010  000  = 0010 
     010  001  = 0001 
     010  010  = 0000 
     010  011  = 1111 
     010  100  = 1110 
     010  101  = 1101 
     010  110  = 1100 
     011  111  = 1100 
     011  000  = 0011 
     011  001  = 0010 
     011  010  = 0001 
     011  011  = 0000 
     011  100  = 1111 
     011  101  = 1110 
     011  110  = 1101 
     100  111  = 1101 
     100  000  = 0100 
     100  001  = 0011 
     100  010  = 0010 
     100  011  = 0001 
     100  100  = 0000 
     100  101  = 1111 
     100  110  = 1110 
     101  111  = 1110 
     101  000  = 0101 
     101  001  = 0100 
     101  010  = 0011 
     101  011  = 0010 
     101  100  = 0001 
     101  101  = 0000 
     101  110  = 1111 
     110  111  = 1111 
     110  000  = 0110 
     110  001  = 0101 
     110  010  = 0100 
     110  011  = 0011 
     110  100  = 0010 
     110  101  = 0001 
     110  110  = 0000 
     111  111  = 0000 
     111  000  = 0111 
     111  001  = 0110 
     111  010  = 0101 
     111  011  = 0100 
     111  100  = 0011 
     111  101  = 0010 
     111  110  = 0001 
     111  111  = 0000
*/
