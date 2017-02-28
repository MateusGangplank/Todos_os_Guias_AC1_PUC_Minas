// Guia 04
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module orgate ( s3, a, b );
output s3;
input a, b;
wire s5, s6;

nand NAND1(s5,a,a);
nand NAND2(s6,b,b);
nand NAND3(s3,s5,s6);

endmodule



module andgate ( s1, a, b );
output s1;
input a, b;
wire s4;

nand NAND4(s4,a,b); 
nand NAND5(s1,s4);

endmodule



module notgate ( s7, s1);
output s7;
input s1;

nand NAND8(s7,s1,s1);

endmodule



module operadorMS( s0, s1, a, b );
output s0,s1;
input a, b;
wire s2, s3;

orgate OR1(s2,a,b);
andgate AND1(s1,a,b);
notgate NOT1(s3,s1);
andgate AND2(s0,s2,s3);

endmodule


module testMS;
reg a,b;
wire s0,s1;

operadorMS MS ( s0, s1, a, b );

 initial begin : start
		a=0; b=0;
end

initial begin : main

#1 $display ( " Operador Meia Soma - Modelo Tradicional " );
#1 $display ( " a + b = s1 s0" );
	$monitor ( " %b + %b =  %b  %b ",a,b,s1,s0);
	
		#1	a=0;	b=1;
 		#1	a=1;	b=0;
		#1	a=1;	b=1;
		
end

endmodule

//  Operador Meia Soma - Modelo Tradicional
//  a + b = s1 s0
//  0 + 0 =  0  0 
//  0 + 1 =  0  1 
//  1 + 0 =  0  1 
//  1 + 1 =  1  0 