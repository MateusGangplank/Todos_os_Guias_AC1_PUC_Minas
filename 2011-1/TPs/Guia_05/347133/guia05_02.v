//NOME: Henrique Carvalho Parreira
//MATRICULA: 347133

module operadorMD ( s0, s1, a, b);
output s0, s1;
input a, b;
wire s2;

xor XOR1(s0,a,b);
not NOT1(s2,a);
and AND1(s1,s2,b);

endmodule

module operadorDC ( s0, s1, a, b, v1 );
output s0, s1;
input a, b, v1;
wire s2, s3, s4;

operadorMD MD1(s2,s3,a,b);
operadorMD MD2(s4,s0,s2,v1);
or OR1(s1,s3,s4);

endmodule

module DC3Bits ( s, a, b);
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

#1 $display ( " Operador Diferença Completa - 3 Bits " );
#1 $display ( "   a  -  b   =  s   " );
	$monitor ( " %3b  %3b  = %4b ",a,b,s);
	
	for ( i = 0; i < 16; i = i + 1)begin
	 a = i;
	for ( j = 0; j < 16; j = j + 1)begin
	#1 b = j;
	end
	end
				
end

endmodule
