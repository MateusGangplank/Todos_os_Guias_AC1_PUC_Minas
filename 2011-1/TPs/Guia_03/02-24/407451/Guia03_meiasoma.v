// Guia 03 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 24/02/2011
//------------------------------------
// -- Meia-Soma
//-------------------------------------
 
 module halfAdder(s1,s2,a,b);     //--criando entradas e saidas
  output s1, s2 ;                 //--definindo saidas
  input a, b;                     //--definindo entradas
  wire s3;                        //-- "declarando variavel para receber valores"

   or  OR1 (s3, a, b);            //--portas para construcao da tabela verdade da meia-soma
   and AND1(s2, a, b);
   and AND2(s1, ~s2,s3);

  endmodule   //--Fim modulo halfAdder
 
 //-------------------------------------
 // -- Teste halfAdder
 //-------------------------------------

 module testhalfAdder;        //--criando modulo teste
  reg a, b;                   //-- valores definidos (registradores)
  wire s, v1;                  //-- valor alternado de acordo com a operacao
 
 halfAdder HALF(s,v1,a,b);          //-- chamando o modulo
 
 initial begin
 		$display("Guia 03 - Karen Alves Pereira - 407451");             //-- imprimindo na tela
		$display("Operador de meia-soma");
		$display("\na b s v1");
		$monitor("%b %b %b %b", a, b, s, v1);
		a=0; b=0;         //-- fornecendo valores
 #1   a=0; b=1;
 #1   a=1; b=0;
 #1   a=1; b=1;
 end                    //-- fim begin
 endmodule     //-- fim modulo testhalfAdder