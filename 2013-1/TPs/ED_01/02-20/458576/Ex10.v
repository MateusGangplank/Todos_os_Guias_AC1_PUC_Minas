//--------------------
// Exercicio 10
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
//--------------------
module gatedois ( output s, 
                           input  p, 
                           input  q);
assign s = p | q;
endmodule // gate

module gate ( output s, 
                           input  p, 
                           input  q,
									input  r);
					wire x, z;				
gatedois AND1 (x, p, q);
		gatedois AND2 (z, x, r);							
assign s =  z;
endmodule // gate

module testgate;

   reg   a, b, c; // definir registradores
wire  s;    // definir conexao (fio)

   gate AND1 (s, a, b, c);

   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end
	   initial begin

         $display("\na & b = s\n");
           a=0; b=0; c=0;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);
           a=0; b=0; c=1;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);
           a=0; b=1; c=0;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);
           a=0; b=1; c=1;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);
           a=1; b=0; c=0;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);
           a=1; b=0; c=1;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);
           a=1; b=1; c=0;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);
           a=1; b=1; c=1;
  #1   $display("(%b & %b) & %b = %b", a, b, c, s);

  end
endmodule // testgate