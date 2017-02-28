// -------------------------
// Exemplo0009 - AND
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- AND gate
// -------------------------
module andgate1 (output s,input a,
                        input  b);
assign s = a & b;
endmodule // andgate1
// -------------------------
// -------------------------
// -- AND gate2
// -------------------------
module andgate2 (output f,input c,input s,
                        input  d);
assign f = (s & (c & d));
endmodule // notgate2
// -------------------------
// -- test AND gate
// -------------------------
module testandgate;
// ------------------------- dados locais
   reg    a,b,c,d;   // definir registrador
                 // (variavel independente)
   wire   s,f;   // definir conexao (fio)
                // (variavel dependente  )
// ------------------------- instancia
  andgate1 AND1 (s, a,b);
  andgate2 AND2 (f,c,s,d);
// ------------------------- preparacao
   initial begin:start
      a=0;
		b=0;    // valor inicial
   end// ------------------------- parte principal
   initial begin
         $display("Exrcicio009 - Guilherme Alves - 450161");
         $display("Test NAND gate");
			$display("\na b c d s\n");
          a=0;
			 b=0;
			 c=0;
			 d=0;
          a=0; b=0;c=0;d=0;
  #1   $monitor(a," ",b," ",c," ",d," ", f);
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