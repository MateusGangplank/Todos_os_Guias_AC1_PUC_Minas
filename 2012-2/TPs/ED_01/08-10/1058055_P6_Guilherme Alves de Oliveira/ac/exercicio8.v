// -------------------------
// Exemplo0008 - AND
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s, 
                           input  p, 
                           input  q,input x,input y);
assign s = (p & q) & (x & y) ;
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b,c,d; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate AND1 (s, a, b,c,d);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;c =0; d=0;
   end// ------------------------- parte principal
   initial begin
         $display("Exemplo0008 - guilherme Alves - 450161");
         $display("Test AND gate");
         $display("\na b c d s\n");
           a=0; b=0;c=0;d=0;
  #1   $monitor(a," ",b," ",c," ",d," ", s);
           a=0; b=0;c=0;d=1;
  #1  	  a=0; b=0;c=1;d=0;
           
  #1   	  a=0; b=0;c=1;d=1;
           
  #1       a=0; b=1;c=0;d=0;
           
  #1		  a=0; b=1;c=0;d=1;
    	  
  #1		  a=0; b=1;c=1;d=0;
           
  #1   	  a=0; b=1;c=1;d=1;
          
  #1       a=1; b=0;c=0;d=0;
           
  #1		  a=1; b=0;c=0;d=1;
			  
  #1		  a=1; b=0;c=1;d=0;
           
  #1   	  a=1; b=0;c=1;d=1;
           
  #1      a=1; b=1;c=0;d=0;
           
  #1		  a=1; b=1;c=0;d=1;
    	  
  #1		  a=1; b=1;c=1;d=0;
           
  #1   	  a=1; b=1;c=1;d=1;
           
 
  			  
  end
endmodule // testandgate