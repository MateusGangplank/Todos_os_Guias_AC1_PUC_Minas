// Guia 04
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

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



module testSC;
reg a,b,v1;
wire s0,s1;

operadorSC SC ( s0, s1, a, b, v1 );

 initial begin : start
		a=0; b=0; v1=0; 
end

initial begin : main

#1 $display ( " Operador Meia Soma - Modelo Tradicional " );
#1 $display ( " a + b + v1 = s1 s0" );
	$monitor ( " %b + %b + %b =  %b  %b ",a,b,v1,s1,s0);
	
		#1	a=0;	b=0; v1=1;
 		#1	a=0;	b=1; v1=0;
		#1	a=0;	b=1; v1=1;
		#1	a=1;	b=0; v1=0;
		#1	a=1;	b=0; v1=1;
		#1	a=1;	b=1; v1=0;
		#1	a=1;	b=1; v1=1;
		
end

endmodule

 
//    Operador Meia Soma - Modelo Tradicional 
//     a + b + v1 = s1 s0
//     0 + 0 + 0 =  0  0 
//     0 + 0 + 1 =  0  1 
//     0 + 1 + 0 =  0  1 
//     0 + 1 + 1 =  1  0 
//     1 + 0 + 0 =  0  1 
//     1 + 0 + 1 =  1  0 
//     1 + 1 + 0 =  1  0 
//     1 + 1 + 1 =  1  1