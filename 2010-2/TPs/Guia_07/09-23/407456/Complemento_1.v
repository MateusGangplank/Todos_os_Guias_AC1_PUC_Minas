/*
PUC-Minas - Instituto de Informática
ARQ1 Guia-07
Data de entrega: 20-23/09/2010
Nome: Washington Luis de Souza Ramos
Matricula: 407456
Prof.: Theldo
*/
 module complemento_1 (s0,s1,s2,s3, a0,a1,a2,a3);
 input a0,a1,a2,a3;
 output s0,s1,s2,s3;
 
 not NOT1 (s0, a0);
  not NOT1 (s1, a1);
 not NOT1 (s2, a2);
 not NOT1 (s3, a3);
 
 endmodule

module teste;
reg a0,a1,a2,a3;
wire s0,s1,s2,s3;

complemento_1 COMP1 (s0,s1,s2,s3, a0,a1,a2,a3);

initial
begin

	$display ("Guia07");
	$display ("\n Nome: Washington Luis \n Matricula: 407456 \n");
	$display (" ");
	$monitor ("Complemento de 1 de %b%b%b%b = %b%b%b%b", a0,a1,a2,a3, s0,s1,s2,s3); 
		a0 = 0; a1 = 0; a2 = 0; a3 = 0;
#1 a0 = 0; a1 = 0; a2 = 0; a3 = 1;
#1 a0 = 0; a1 = 0; a2 = 1; a3 = 0;
#1 a0 = 0; a1 = 0; a2 = 1; a3 = 1;
#1 a0 = 0; a1 = 1; a2 = 0; a3 = 0;
#1 a0 = 0; a1 = 1; a2 = 0; a3 = 1;
#1 a0 = 0; a1 = 1; a2 = 1; a3 = 0;
#1 a0 = 0; a1 = 1; a2 = 1; a3 = 1;
#1 a0 = 1; a1 = 0; a2 = 0; a3 = 0;
#1 a0 = 1; a1 = 0; a2 = 0; a3 = 1;
#1 a0 = 1; a1 = 0; a2 = 1; a3 = 0;
#1 a0 = 1; a1 = 0; a2 = 1; a3 = 1;
#1 a0 = 1; a1 = 1; a2 = 0; a3 = 0;
#1 a0 = 1; a1 = 1; a2 = 0; a3 = 1;
#1 a0 = 1; a1 = 1; a2 = 1; a3 = 0;
#1 a0 = 1; a1 = 1; a2 = 1; a3 = 1;

end
endmodule//teste

/*
    Guia07
    
     Nome: Washington Luis 
     Matricula: 407456 
    
     
    Complemento de 1 de 0000 = 1111
    Complemento de 1 de 0001 = 1110
    Complemento de 1 de 0010 = 1101
    Complemento de 1 de 0011 = 1100
    Complemento de 1 de 0100 = 1011
    Complemento de 1 de 0101 = 1010
    Complemento de 1 de 0110 = 1001
    Complemento de 1 de 0111 = 1000
    Complemento de 1 de 1000 = 0111
    Complemento de 1 de 1001 = 0110
    Complemento de 1 de 1010 = 0101
    Complemento de 1 de 1011 = 0100
    Complemento de 1 de 1100 = 0011
    Complemento de 1 de 1101 = 0010
    Complemento de 1 de 1110 = 0001
    Complemento de 1 de 1111 = 0000
    
    */