// --------------------------
// Guia01 - Capitulo3
// Nome: Karen Alves Pereira
// Matricula: 407451
// ---------------------------
// ---------------------------
// NOR
// -- nor gate
// ---------------------------

 module norgate (s, d, e, f);   //-- definindo a saida e as entradas
 output s;                      //-- saida
 input d, e, f;                 //-- entradas
 
 assign s = ~(d | e | f);       //-- operacao
 
 endmodule // fim norgate        //-- fim modulo
 
// ---------------------------
// --  Teste nor gate
// ---------------------------
 
 module testnorgate;           //-- teste
 reg d, e, f;                  //-- valores definidos (registradores)
 wire s;                      //-- valor alternado de acordo com a operacao
 
 norgate NOR1 (s, d, e, f);    //-- nomeando a porta
 
 initial begin
 		$display ("Guia 01 - Karen Alves Pereira - 407451");
		$display ("Teste NOR gate");
		$display ("\n~(d | e | f) = s\n");
		d=0; e=0; f=0;        //-- fornecendo valores     
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);    //-- em um instante, tem os valores fornecidos e gera a saida
  		d=0; e=0; f=1;                                   //--imprimido na tela
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);	
    	d=0; e=1; f=0;
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);		
   	d=0; e=1; f=1;
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);
   	d=1; e=0; f=0;
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);
      d=1; e=0; f=1;
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);
      d=1; e=1; f=0;
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);
      d=1; e=1; f=1;
 #1 	$display("~(%b | %b | %b) = %b", d, e, f, s);	
 end     //--fim inicial
 
 endmodule // -- fim testnorgate