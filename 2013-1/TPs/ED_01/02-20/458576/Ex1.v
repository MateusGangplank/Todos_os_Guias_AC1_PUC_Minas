//--------------------
// Exercicio 1
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
//--------------------
module gate ( output s, 
                           input  p, 
                           input  q);
assign s =  ~(p&q);
endmodule // gate


module testgate;

   reg   a, b; // definir registradores
wire  s;    // definir conexao (fio)

   gate AND1 (s, a, b);

   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end
   initial begin

         
         $display("\na & b = s\n");
           a=0; b=0;
  #1   $display("%b & %b = %b", a, b, s);
           a=0; b=1;
  #1  $display("%b & %b = %b", a, b, s);
           a=1; b=0;
  #1   $display("%b & %b = %b", a, b, s);
           a=1; b=1;
  #1   $display("%b & %b = %b", a, b, s);
  end
endmodule // testgate