// ------------------------- 
// Exemplo0015 - OR 
// Nome: Jenifer Henrique Moreira Borges 
// Matricula: 427420
// ------------------------- 
 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, input  p, input  q); 
 
 assign s = p | q;
  
endmodule // orgate 
 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
   reg   a, b, c; // definir registradores 
   wire  s, s1;    // definir conexao (fio) 
// ------------------------- instancia 
   orgate OR1 (s1, a, b); 
	orgate OR2 (s, s1, c);
// ------------------------- preparacao 
   initial begin:start 
                   // atribuicao simultanea 
                   // dos valores iniciais 
      a=0; b=0; c=0;
   end 
  
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0015 - Jenifer Henrique Moreira Borges - 427420"); 
      $display("Test OR gate"); 
      $display("\na & b = s1\n");
		$display("s1 & c = s\n");
		$monitor("%b & %b & %b = %b", a, b, c, s); 
      a=0; b=0; c=0;
  #1  a=0; b=0; c=1;
  #1  a=0; b=1; c=0;
  #1  a=0; b=1; c=1;
  #1  a=1; b=0; c=0;
  #1  a=1; b=0; c=1;
  #1  a=1; b=1; c=0;
  #1  a=1; b=1; c=1;
 end 
 
endmodule // testorgate