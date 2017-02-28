// Guia 04
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

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



module testDC;
reg a,b,v1;
wire s0,s1;

operadorDC DC ( s0, s1, a, b, v1 );

 initial begin : start
		a=0; b=0; v1=0; 
end

initial begin : main

#1 $display ( " Operador Diferença Completa - Modelo Compacto " );
#1 $display ( " a - b - v1 = s1 s0" );
	$monitor ( " %b - %b - %b =  %b  %b ",a,b,v1,s1,s0);
	
		#1	a=0;	b=0; v1=1;
 		#1	a=0;	b=1; v1=0;
		#1	a=0;	b=1; v1=1;
		#1	a=1;	b=0; v1=0;
		#1	a=1;	b=0; v1=1;
		#1	a=1;	b=1; v1=0;
		#1	a=1;	b=1; v1=1;
		
end

endmodule


//Operador Diferença Completa - Modelo Compacto 
//   a - b - v1 = s1 s0
//   0 - 0 - 0 =  0  0 
//   0 - 0 - 1 =  1  1 
//   0 - 1 - 0 =  1  0 
//   0 - 1 - 1 =  1  0 
//   1 - 0 - 0 =  1  0 
//   1 - 0 - 1 =  0  0 
//   1 - 1 - 0 =  0  0 
//   1 - 1 - 1 =  1  1 
