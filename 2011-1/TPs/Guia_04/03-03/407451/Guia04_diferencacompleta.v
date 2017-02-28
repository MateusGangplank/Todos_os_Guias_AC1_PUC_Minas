// Guia 04 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 03/03/2011
//-----------------------------------------
// -- Diferenca-completa com duas meia-diferenca 
//-----------------------------------------

 module meiadiferenca(s0, s1, x, y);    //--criando entradas e saidas
 output s0, s1;                         //--definindo saidas
 input x, y;                            //--definindo entradas
 
 xor XOR1(s0, x, y);                   //--operacao da meia-diferenca
 and AND1(s1, ~x, y);
   
 endmodule   //--fim modulo meiadiferenca
 
 module diferencacompleta(s0, s1, x, y, e1);   //--criando modulo da difereca-completa
 output s0, s1;                                //--definindo saidas
 input x, y, e1;                               //--definindo entradas 
 
 meiadiferenca FU1(s2, s3, x, y);        //--chamando o modulo meia diferenca
 meiadiferenca FU2(s0, s4, s2, e1);      //--chamando o modulo meia diferenca
 or OR1(s1, s3,s4);                     //--porta or juntando as duas chamadas do modulo meia diferenca
 
 endmodule   //--dim modulo diferencacompleta
 
 //--------------------------------
 //-- Teste Diferenca-completa
 //--------------------------------
 
 module tesdiferenca;   //--criando modulo teste
 reg x, y, e1;         //-- valores definidos (registradores)
 wire s0, s1;           //-- valor alternado de acordo com a operacao
 
 diferencacompleta DF(s0, s1, x, y, e1);     //-- chamando o modulo
 
 initial begin
 		$display("Guia 04 - Karen Alves Pereira - 407451");             //-- imprimindo na tela
		$display("Operador de diferenca-completa");
		$display("\nx y e1 s0 s1");
		$monitor("%b %b %b  %b  %b", x, y, e1, s0, s1);
		x=0; y=0; e1=0;         //-- fornecendo valores
 #1   x=0; y=0; e1=1;
 #1   x=0; y=1; e1=0;
 #1   x=0; y=1; e1=1;
 #1   x=1; y=0; e1=0;
 #1   x=1; y=0; e1=1;
 #1   x=1; y=1; e1=0;
 #1   x=1; y=1; e1=1; 
 end                    //-- fim begin
 endmodule     //-- fim modulo testdiferenca