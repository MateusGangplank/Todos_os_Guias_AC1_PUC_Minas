// Guia 05
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

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

/*  Operador Soma Completa Com Portas NAND - 3 Bits 
       a  +  b   =  s   
     000  000  = 0000 
     000  001  = 0001 
     000  010  = 0010 
     000  011  = 0011 
     000  100  = 0100 
     000  101  = 0101 
     000  110  = 0110 
     001  111  = 1000 
     001  000  = 0001 
     001  001  = 0010 
     001  010  = 0011 
     001  011  = 0100 
     001  100  = 0101 
     001  101  = 0110 
     001  110  = 0111 
     010  111  = 1001 
     010  000  = 0010 
     010  001  = 0011 
     010  010  = 0100 
     010  011  = 0101 
     010  100  = 0110 
     010  101  = 0111 
     010  110  = 1000 
     011  111  = 1010 
     011  000  = 0011 
     011  001  = 0100 
     011  010  = 0101 
     011  011  = 0110 
     011  100  = 0111 
     011  101  = 1000 
     011  110  = 1001 
     100  111  = 1011 
     100  000  = 0100 
     100  001  = 0101 
     100  010  = 0110 
     100  011  = 0111 
     100  100  = 1000 
     100  101  = 1001 
     100  110  = 1010 
     101  111  = 1100 
     101  000  = 0101 
     101  001  = 0110 
     101  010  = 0111 
     101  011  = 1000 
     101  100  = 1001 
     101  101  = 1010 
     101  110  = 1011 
     110  111  = 1101 
     110  000  = 0110 
     110  001  = 0111 
     110  010  = 1000 
     110  011  = 1001 
     110  100  = 1010 
     110  101  = 1011 
     110  110  = 1100 
     111  111  = 1110 
     111  000  = 0111 
     111  001  = 1000 
     111  010  = 1001 
     111  011  = 1010 
     111  100  = 1011 
     111  101  = 1100 
     111  110  = 1101
 */