
//----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//----------------------------


//----------------------------
//------ Guia 05 - 03---------
//----------------------------


module meiasoma(s0,s1, a,b);

	output s0,s1;
	input  a, b;

	and(s0, a,b);
	xor(s1, a,b);
	
endmodule // fim meia soma

module halfAdder (s0, c0, a, b);

input a, b;
output s0, c0;

xor (s0, a, b);
and (c0, a, b);

endmodule//halfAdder

module teste;

reg a1, b1, a0, b0;
wire s0, s1, s2, s3, s4, s5, c0, c1;

and (s0, a0, b0);
and (s3, a0, b1);
and (s4, a1, b0);
and (s5, a1, b1);
halfAdder HA1 (s1, c1, s3, s4);
fullAdder FA1 (s2, c0, c1, 0, s5);

initial
begin
$display ("Multiplier Gate Test");
$display ("Exercicio 03");
$display ("\n Nome: Washington Luis \n Matricula: 407456 \n");
$display ("(ab x cd) = resultado, vaiUm\n");

	a1 = 0; a0 = 0; b1 = 0; b0 = 0;
$monitor ("(%b%b x %b%b) = %b%b%b, %b", a1, a0, b1, b0, s2, s1, s0, c0);

#1 a1 = 0; a0 = 0; b1 = 0; b0 = 1;
#1 a1 = 0; a0 = 1; b1 = 1; b0 = 0;
#1 a1 = 1; a0 = 0; b1 = 0; b0 = 0;
#1 a1 = 1; a0 = 1; b1 = 1; b0 = 1;
#1 a1 = 0; a0 = 1; b1 = 0; b0 = 1;
#1 a1 = 1; a0 = 0; b1 = 1; b0 = 0;
#1 a1 = 1; a0 = 1; b1 = 1; b0 = 0;
#1 a1 = 0; a0 = 1; b1 = 1; b0 = 1;

end

endmodule//teste