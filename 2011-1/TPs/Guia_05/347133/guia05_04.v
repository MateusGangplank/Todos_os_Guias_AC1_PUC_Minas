//NOME: Henrique Carvalho Parreira
//SENHA: 347133

module operadorMS ( s0, s1, a, b );
output s0, s1;
input a, b;
wire s2, s3, s4, s5, s6;

nand NAND1(s6, a, a);
nand NAND2(s5, b, b);
nand NAND3(s4, s5, s6);
nand NAND4(s3, a, b);
nand NAND5(s2, s3, s4);
nand NAND6(s0, s2);
nand NAND7(s1, s3);

endmodule


module operadorSC (s0,s1,a,b,c);
output s0,s1;
input a,b,c;
wire s2,s3,s4,s5,s6;

operadorMS MS1(s2,s3,a,b);
operadorMS MS2(s0,s4,s2,c);
nand NAND1(s5,s3,s3);
nand NAND2(s6,s4,s4); 
nand NAND3(s1,s5,s6);

endmodule


module SC3Bits (s,a,b);
output[3:0]s;
input[2:0]a,b;
wire[1:0]c;

operadorMS MD1(s[0],c[0],a[0],b[0]);
operadorSC SC1(s[1],c[1],a[1],b[1],c[0]);
operadorSC SC2(s[2],s[3],a[2],b[2],c[1]);

endmodule

module testSC;
reg[2:0]a,b;
wire[3:0]s;
integer i,j;

SC3Bits SC3B(s,a,b);

initial begin : start

a=0; b=0;

end

initial begin : main

#1 $display ( " Operador Soma Completa Com Portas NAND - 3 Bits " );
#1 $display ( "   a  +  b   =  s   " );
	$monitor ( " %3b  %3b  = %4b ",a,b,s);
	
	for ( i = 0; i < 8; i = i + 1)begin
	 a = i;
	for ( j = 0; j < 8; j = j + 1)begin
	#1 b = j;
	end
	end
				
end

endmodule
