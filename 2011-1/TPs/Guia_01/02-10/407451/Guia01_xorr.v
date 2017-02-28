// ---------------------
// Guia 01 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// ---------------------

// ---------------------
// XOR
// -- xor gate
// ---------------------

 module xorgate (s, r, t);   //-- definindo a saida e as entradas
 output s;                   //-- saida
 input r, t;                 //-- entradas
 
 assign s = (~r) & t | r & (~t);    //-- operacao
 
 endmodule // fim xorgate        //-- fim modulo
 
 //------------------------
 //-- Teste xor gate
 //------------------------
 
 module testxorgate;       //-- teste
 reg r, t;                 //-- valores definidos (registradores)
 wire s;                   //-- valor alternado de acordo com a operacao
 
 xorgate XOR2(s, r, t);    //-- nomeando a porta
 
 initial begin
 		$display ("Guia 01 - Karen Alves Pereira - 407451");
		$display ("Teste XOR gate");
		$display ("\n(~r & t | r & ~t) = s\n");
		r=0; t=0;     //-- fornecendo valores
 #1	$display ("%b & %b = %b", r, t, s);   //-- em um instante, tem os valores fornecidos e gera a saida
 		r=0; t=1;                             //--imprimido na tela  
 #1	$display ("%b & %b = %b", r, t, s);
 		r=1; t=0;
 #1	$display ("%b & %b = %b", r, t, s);
 		r=1; t=1;
 #1	$display ("%b & %b = %b", r, t, s);
 end    //--fim inicial
 
 endmodule // -- fim testxorgate