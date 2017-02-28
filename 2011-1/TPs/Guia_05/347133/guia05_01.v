//NOME: Henrique Carvalho Parreira
//MATRICULA: 347133

module operadorMS ( s4, s3, a, b);
output s4, s3;
input a, b;

xor XOR2(s4,a,b);
and AND2(s3,a,b);

endmodule

module operadorSC ( s0, s1, a, b, v1 );
output s0, s1;
input a, b, v1;
wire s3, s4;

operadorMS MS1(s4,s3,a,b);
operadorMS MS2( s0, s2 ,v1 ,s4);
or OR1(s1,s2,s3);

endmodule

module SC4Bits ( s, a, b);
output[4:0]s;
input[3:0]a,b;
wire[2:0]c;

operadorMS MS1(s[0],c[0],a[0],b[0]);
operadorSC SC1(s[1],c[1],a[1],b[1],c[0]);
operadorSC SC2(s[2],c[2],a[2],b[2],c[1]);
operadorSC SC3(s[3],s[4],a[3],b[3],c[2]);

endmodule


module testSC;
reg [3:0]a,b;
wire [4:0]s;
integer i, j;

SC4Bits SC4B(s, a, b);

 initial begin : start
 
 a=0; b=0;
 
 end

initial begin : main

#1 $display ( " Operador Soma Completa - 4 Bits " );
#1 $display ( "   a  +  b   =  s   " );
	$monitor ( " %4b  %4b  = %5b ",a,b,s);
	
	for ( i = 0; i < 16; i = i + 1)begin
	 a = i;
	for ( j = 0; j < 16; j = j + 1)begin
	#1 b = j;
	end
	end
				
end

endmodule

