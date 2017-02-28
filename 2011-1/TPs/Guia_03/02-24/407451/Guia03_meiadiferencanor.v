// Guia 03 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 24/02/2011
//------------------------------------
// -- Meia-Diferenca 
//-------------------------------------

 module halfSubtractornor(s, e1, a, b);   //--criando entradas e saidas
 output s, e1;                            //--definindo saidas    
 input a, b;                              //--definindo entradas
 wire tem1, tem2, tem3;                   //-- "declarando variavel para receber valores"
 
 //--E1                                   //--portas para construcao da tabela verdade da meia-diferenca
 nor NOR1(tem1, b, b);
 nor NOR2(e1, tem1, a);
 //--AND
 nor NOR3(y, a, a);
 nor NOR4(x, y, tem1);
  //--OR
 nor NOR5(tem3, a, b);
 nor NOR6(tem4, tem3, tem3);
 //--XOR
 nor NOR7(tem5, tem4, tem4);
 nor NOR8(s, x, tem5);
 
 endmodule       //-- Fim modulo  halfSubtractornor
 
 //-------------------------------------
 // -- Teste halfSubtractor
 //-------------------------------------
 
 module testhalfSubtractornor;     //--criando modulo teste
 reg a, b;                         //-- valores definidos (registradores)
 wire s, v1;                        //-- valor alternado de acordo com a operacao
 
 halfSubtractornor NOR1(s, v1, a, b);            //-- chamando o modulo
 
 		initial begin
	   $display("Guia 03 - Karen Alves Pereira - 407451");                  //-- imprimindo na tela
		$display("Operador de meia-diferenca apenas com portas NOR");
		$display("\na b s e1");
		$monitor("%b %b %b %b", a, b, s, v1);
		a=0; b=0;           //-- fornecendo valores
 #1   a=0; b=1;
 #1   a=1; b=0;
 #1   a=1; b=1;
 end               //-- fim begin
 endmodule    //-- fim modulo  testhalfSubtractornor
 	  
