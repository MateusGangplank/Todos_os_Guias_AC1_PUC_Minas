// -------------------------
// Exercicio09 - AND
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate4 ( output s, input  p, input  q, input t, input x);
 wire y, z;
 andgate2 AND1 (y, p, q);
 andgate2 AND2 (z, t, x);
 assign s = (y & z);

endmodule // andgate

module andgate2 (output s, input p, input q);
  assign s = ( p & q );
endmodule
 
// --------------------- 
// -- test and gate
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
   reg   a, b, c, d; // definir registradores
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   andgate4 AND3 (s, a, b, c, d);
// ------------------------- preparacao 
   initial begin:start 
                   // atribuicao simultanea 
                   // dos valores iniciais 
      a=0; b=0; c=0; d=0;
   end 
  
// ------------------------- parte principal

   initial begin 
      $display("Exercicio09 - Jenifer Henrique - 427420");
      $display("Test AND gate");
      $display("\na & b & c & d = s\n");
		$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
      a = 0; b=0; c=0; d=0;
  #1  a = 0; b=0; c=0; d=1;
  #1  a = 0; b=0; c=1; d=0;
  #1  a = 0; b=0; c=1; d=1;
  #1  a = 0; b=1; c=0; d=0;
  #1  a = 0; b=1; c=0; d=1;
  #1  a = 0; b=1; c=1; d=0;
  #1  a = 0; b=1; c=1; d=1;
  #1  a = 1; b=0; c=0; d=0;
  #1  a = 1; b=0; c=0; d=1;
  #1  a = 1; b=0; c=1; d=0;
  #1  a = 1; b=0; c=1; d=1;
  #1  a = 1; b=1; c=0; d=0;
  #1  a = 1; b=1; c=0; d=1;
  #1  a = 1; b=1; c=1; d=0;
  #1  a = 1; b=1; c=1; d=1;



 end

endmodule // testandgate