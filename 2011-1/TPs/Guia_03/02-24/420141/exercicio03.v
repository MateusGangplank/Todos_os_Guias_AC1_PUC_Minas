// Guia 03
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module operadorMD ( s0, s1, a, b );

output s0, s1;
input a, b;
wire s2, s3, s4, s5, s6;

nand NAND1(s6, a, b);
nand NAND2(s5, s6, a);
nand NAND3(s4, s6, b);
nand NAND4(s3, a, a);
nand NAND5(s2, s3, b);
nand NAND6(s1, s2, s2);
nand NAND7(s0, s5, s4);

endmodule

module testMD;
reg a, b;
wire s0, s1;

operadorMD MD (s0, s1, a, b);

initial begin : start
		a=0; b=0;
end

initial begin : main

#1 $display ( " Modelo Tradicional " );
#1 $display ( "a - b = s0 s1" );
	$monitor ( "%b - %b = %b  %b ",a,b,s0,s1);
	
		#1	a=0;	b=1;
 		#1	a=1;	b=0;
		#1	a=1;	b=1;
end

endmodule

// Modelo Tradicional 
// a - b = s0 s1
// 0 - 0 = 0  0 
// 0 - 1 = 1  1 
// 1 - 0 = 1  0 
// 1 - 1 = 0  0