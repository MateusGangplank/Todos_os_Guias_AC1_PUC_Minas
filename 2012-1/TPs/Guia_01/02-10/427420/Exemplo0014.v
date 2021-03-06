// ------------------------- 
// Exemplo0014 - AND 
// Nome: Jenifer Henrique Moreira Borges 
// Matricula: 427420
// ------------------------- 
 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, input  p, input  q); 
 
 assign s = p & q;
  
endmodule // andgate 
 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
   reg   a, b, c; // definir registradores 
   wire  s, s1;    // definir conexao (fio) 
// ------------------------- instancia 
   andgate AND1 (s1, a, b); 
	andgate AND2 (s, s1, c);
// ------------------------- preparacao 
   initial begin:start 
                   // atribuicao simultanea 
                   // dos valores iniciais 
      a=0; b=0; c=0;
   end 
  
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0014 - Jenifer Henrique Moreira Borges - 427420"); 
      $display("Test AND gate"); 
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
 
endmodule // testandgate