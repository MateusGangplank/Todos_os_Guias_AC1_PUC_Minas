// Guia 04
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module xorgate (s0, s1, a, b);
output s0, s1;
input a, b;
wire s2, s3, s4, s5;

nor NOR1(s2,a,a);
nor NOR2(s3,b,b);
nor NOR3(s4,s3,s2);
nor NOR4(s5,a,b);

endmodule


module notgate(s,a);
output s;
input a;

nor NOR1(s,a,a);

endmodule


module andgate (s0,b,s);
output s0;
input b, s;
wire s1,s2;

nor NOR1(s1,b,b);
nor NOR2(s2,s,s);
nor NOR3(s0,s1,s2);

endmodule

module operadorMD (s0,s1,a,b);
output s0,s1;
input a, b;
wire s2;

xorgate XOR1(s0,s1,a,b);
notgate NOT1(s2,a);
andgate AND1(s1,s2,b);

endmodule

module testMD;
reg a,b;
wire s0,s1;

operadorMD MD ( s0, s1, a, b );

 initial begin : start
		a=0; b=0;  
end

initial begin : main

#1 $display ( " Operador Meia Diferença - Modelo Compacto " );
#1 $display ( " a - b  = s1 s0" );
	$monitor ( " %b - %b  =  %b  %b ",a,b,s1,s0);
	
		#1	a=0;	b=1; 
 		#1	a=1;	b=0; 
		#1	a=1;	b=1; 
		
end

endmodule 



