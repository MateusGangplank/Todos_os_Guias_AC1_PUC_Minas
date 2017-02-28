// ----------------------
// Guia 01 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// -----------------------

// ----------------------
// XOR
// -- xor gate
// ----------------------

 module xorgate(s , x, y);   //-- definindo a saida e as entradas
 output s;                   //-- saida
 input x, y;                 //-- entradas
 
 assign s = x ^ y;           //-- operacao
 
 endmodule // fim xorgate       //-- fim modulo
 
// ----------------------
// -- Teste xor gate
// ----------------------

 module testxorgate;        //-- teste
 reg x, y;                  //-- valores definidos (registradores)
 wire s;                    //-- valor alternado de acordo com a operacao
 
 xorgate XOR1 (s, x, y);    //-- nomeando a porta
 
 initial begin
 		$display("Guia 01 - Karen Alves Pereira - 407451");
		$display("Teste XOR gate");
		$display("\nx ^ y = s\n");
		x=0; y=0;       //-- fornecendo valores
#1		$display("%b ^ %b = %b", x, y, s);    //-- em um instante, tem os valores fornecidos e gera a saida
      x=0; y=1;
#1		$display("%b ^ %b = %b", x, y, s);
      x=1; y=0;
#1		$display("%b ^ %b = %b", x, y, s);
      x=1; y=1;
#1		$display("%b ^ %b = %b", x, y, s); 
   end    //--fim inicial

endmodule // -- fim testxorgate