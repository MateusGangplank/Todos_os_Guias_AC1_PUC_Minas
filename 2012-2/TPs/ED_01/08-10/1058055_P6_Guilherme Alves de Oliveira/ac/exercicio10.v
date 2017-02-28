// -------------------------
// Exemplo0010 - OR
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- OR gate
// -------------------------
module orgate1 (output s,input a,
                        input  b);
assign s = a | b;
endmodule // notgate1
// -------------------------
// -------------------------
// -- OR gate2
// -------------------------
module orgate2 (output f,input c,input s,
                        input  d);
assign f = (s | (c | d));
endmodule // notgate2
// -------------------------
// -- test OR gate
// -------------------------
module testorgate;
// ------------------------- dados locais
   reg    a,b,c,d;   // definir registrador
                 // (variavel independente)
   wire   s,f;   // definir conexao (fio)
                // (variavel dependente  )
// ------------------------- instancia
  orgate1 OR1 (s, a,b);
  orgate2 OR2 (f,c,s,d);
// ------------------------- preparacao
   initial begin:start
      a=0;
		b=0;
		c=0;
		d=0;    // valor inicial
   end// ------------------------- parte principal
   initial begin
         $display("Exrcicio010 - Guilherme Alves - 450161");
         $display("Test OR gate");
			$display("\na b c d s\n");
          
    #1 $display(a," ",b," ",c," ",d," ", f);   
			 
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
           
  #1	  a=1; b=1;c=0;d=1;
    	  
  #1		  a=1; b=1;c=1;d=0;
           
  #1   	  a=1; b=1;c=1;d=1;
    end
endmodule // testorate