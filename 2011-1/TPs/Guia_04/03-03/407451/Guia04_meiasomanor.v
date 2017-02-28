// Guia 04 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 03/03/2011
//------------------------------------
// -- Meia-Soma com portas nor
//-------------------------------------

 module halfAddernor(s, v1, a, b);        //--criando entradas e saidas
 output s, v1;                            //--definindo saidas  
 input a, b;                              //--definindo entradas

 //--AND                           //--portas para construcao da tabela verdade da meia-soma
 nor NOR1(tem1, a, a);
 nor NOR2(tem2, b, b);
 nor NOR3(v1, tem1, tem2);
 //--OR
 nor NOR4(tem3, a, b);
 nor NOR5(tem4, tem3, tem3);
 //--XOR
 nor NOR6(tem5, tem4, tem4);
 nor NOR7(s, v1, tem5);
 
 endmodule   //--Fim modulo halfAddernor
 
 //-------------------------------------
 // -- Teste halfAdder
 //-------------------------------------
 
 module testhalfAddernor;        //--criando modulo teste
 reg a, b;                       //-- valores definidos (registradores)
 wire s, v1;                      //-- valor alternado de acordo com a operacao
 
 halfAddernor NOR1(s, v1, a, b);       //-- chamando o modulo 
 
 		initial begin
	   $display("Guia 04 - Karen Alves Pereira - 407451");           //-- imprimindo na tela
		$display("Operador de meia-soma apenas com portas NOR");
		$display("\na b s v1");
		$monitor("%b %b %b %b", a, b, s, v1);
		a=0; b=0;            //-- fornecendo valores
 #1   a=0; b=1;
 #1   a=1; b=0;
 #1   a=1; b=1;
 end                  //-- fim begin
 endmodule     //-- fim modulo  testhalfAddernor