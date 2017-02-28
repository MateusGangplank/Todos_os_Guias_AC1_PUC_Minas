/*
PUC-Minas - Instituto de Informática
ARQ1 Guia-07
Data de entrega: 20-23/09/2010
Nome: Washington Luis de Souza Ramos
Matricula: 407456
Prof.: Theldo
*/

module fullAdder (s0, c0, a, b, c);

input a, b, c;
output s0, c0;

xor (s1, a, c);
and (c1, a, c);
xor (s0, s1, b);
and (c2, s1, b);
or (c0, c2, c1);

endmodule//fullAdder

module halfAdder (s0, c0, a, b);

input a, b;
output s0, c0;

xor (s0, a, b);
and (c0, a, b);

endmodule//halfAdder

module adder_4bits (s0,s1,s2,s3,a0,a1,a2,a3,b0,b1,b2,b3);

input a0,a1,a2,a3,b0,b1,b2,b3;
output s0,s1,s2,s3,c0,c1,c2;

halfAdder HA1 (s0, c0, a0, b0);
fullAdder FA1 (s1, c1, c0, a1, b1);
fullAdder FA2 (s2, c2, c1, a2, b2);
fullAdder FA3 (s3, c3, c2, a3, b3);

endmodule//adder_4bits

 module complemento_2 (s0,s1,s2,s3, a0,a1,a2,a3);
 input a0,a1,a2,a3;
 output s0,s1,s2,s3,c0,c1,c2,c3;
 
 not NOT1 (c0, a0);
 not NOT1 (c1, a1);
 not NOT1 (c2, a2);
 not NOT1 (c3, a3);
 
 adder_4bits ADD1 (s0,s1,s2,s3,c0,c1,c2,c3,0,0,0,1);
 
 endmodule//complemento_2

module teste;
reg a0,a1,a2,a3;
wire s0,s1,s2,s3;

complemento_2 COMP2 (s0,s1,s2,s3, a0,a1,a2,a3);

initial
begin

	$display ("Guia07");
	$display ("\n Nome: Washington Luis \n Matricula: 407456 \n");
	$display (" ");
	$monitor ("Complemento de 2 de %b%b%b%b = %b%b%b%b", a3,a2,a1,a0, s3,s2,s1,s0); 
		a3 = 0; a2 = 0; a1 = 0; a0 = 0;
#1 a3 = 0; a2 = 0; a1 = 0; a0 = 1;
#1 a3 = 0; a2 = 0; a1 = 1; a0 = 0;
#1 a3 = 0; a2 = 0; a1 = 1; a0 = 1;
#1 a3 = 0; a2 = 1; a1 = 0; a0 = 0;
#1 a3 = 0; a2 = 1; a1 = 0; a0 = 1;
#1 a3 = 0; a2 = 1; a1 = 1; a0 = 0;
#1 a3 = 0; a2 = 1; a1 = 1; a0 = 1;
#1 a3 = 1; a2 = 0; a1 = 0; a0 = 0;
#1 a3 = 1; a2 = 0; a1 = 0; a0 = 1;
#1 a3 = 1; a2 = 0; a1 = 1; a0 = 0;
#1 a3 = 1; a2 = 0; a1 = 1; a0 = 1;
#1 a3 = 1; a2 = 1; a1 = 0; a0 = 0;
#1 a3 = 1; a2 = 1; a1 = 0; a0 = 1;
#1 a3 = 1; a2 = 1; a1 = 1; a0 = 0;
#1 a3 = 1; a2 = 1; a1 = 1; a0 = 1;

end
endmodule//teste