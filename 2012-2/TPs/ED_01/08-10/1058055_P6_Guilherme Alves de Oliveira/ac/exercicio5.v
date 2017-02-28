// -------------------------
// Exercicio5- NOR
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- NOR gate
// -------------------------
module norgate (output s,input a,
                        input  b);
assign s = ~(a) & ~(b);
endmodule // norgate
// -------------------------
// -- test NOR gate
// -------------------------
module testnorgate;
// ------------------------- dados locais
   reg    a,b;   // definir registrador
                 // (variavel independente)
   wire   s;   // definir conexao (fio)
                // (variavel dependente  )
// ------------------------- instancia
  norgate NOR1 (s, a,b);
// ------------------------- preparacao
   initial begin:start
      a=0;
		b=0;    // valor inicial
   end// ------------------------- parte principal
   initial begin
         $display("Exrcicio5 - Guilherme Alves - 450161");
         $display("Test NOR gate");
$display("a  b   s");
$monitor(a, "  " ,b,     "   " ,s);
	   #1     a=0;
				 b=0;
       
		#1		 a= 0;
				 b =1;
    
  		#1	    a = 1;
			    b = 0;
	
		#1		a=1;
				b=1;
	 
   end
endmodule // testnorgate