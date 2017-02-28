// -------------------------
// Exercicio3- XNOR
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- XNOR gate
// -------------------------
module xnorgate (output s,input a,
                        input  b);
assign s = ~(a ^ b );
endmodule // notgate
// -------------------------
// -- test XNOR gate
// -------------------------
module testxnorgate;
// ------------------------- dados locais
   reg    a,b;   // definir registrador
                 // (variavel independente)
   wire   s;   // definir conexao (fio)
                // (variavel dependente  )
// ------------------------- instancia
  xnorgate XNOR1 (s, a,b);
// ------------------------- preparacao
   initial begin:start
      a=0;
		b=0;    // valor inicial
   end// ------------------------- parte principal
   initial begin
         $display("Exrcicio2 - Guilherme Alves - 450161");
         $display("Test XNOR gate");
			$display("a  b   s");
			$monitor(a, "  " ,b,     "   " ,s);
	   #1     a=0;
				 b=0;
       
		#1		 a= 0;
				 b =1;
    
  		#1     a = 1;
			    b = 0;
	
		#1	    a=1;
				 b=1;
	 
   end
endmodule // testxnorgate