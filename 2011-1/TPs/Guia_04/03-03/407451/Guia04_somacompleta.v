// Guia 04 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 03/03/2011
//------------------------------------
// -- Soma-completa com duas meia-soma 
//-------------------------------------

 module meiasoma(s0, s1,x, y);    //--criando entradas e saidas
 output s0, s1;                  //--definindo saidas
 input x, y;                     //--definindo entradas

 xor XOR1(s0, x, y);
 and AND1(s1, x, y);
 
 endmodule
 
 module somacompleta(s0, s1, x, y, v1);
 output s0, s1;
 input x, y, v1;
 wire s4, s5, s2;
 
 meiasoma HA1(s2, s4, x, y);
 meiasoma HA2(s0, s5, s2, v1);
 or OR1(s1,s5,s4);
 
 endmodule
 
 //--------------------------------
 //-- Teste Soma-completa
 //--------------------------------
 
 module testsoma;              // --criando modulo teste
 reg x, y, v1;                 //-- valores definidos (registradores)
 wire s0,s1;                   //-- valor alternado de acordo com a operacao
 
 somacompleta SO(s0, s1, x, y, v1);         //-- chamando o modulo
 
 initial begin
 		$display("Guia 04 - Karen Alves Pereira - 407451");             //-- imprimindo na tela
		$display("Operador de soma-completa");
		$display("\nx y v1 s s1");
		$monitor("%b %b %b  %b  %b", x, y, v1, s0, s1);
		x=0; y=0; v1=0;         //-- fornecendo valores
 #1   x=0; y=0; v1=1;
 #1   x=0; y=1; v1=0;
 #1   x=0; y=1; v1=1;
 #1   x=1; y=0; v1=0;
 #1   x=1; y=0; v1=1;
 #1   x=1; y=1; v1=0;
 #1   x=1; y=1; v1=1; 
 end                    //-- fim begin
 endmodule     //-- fim modulo testsoma