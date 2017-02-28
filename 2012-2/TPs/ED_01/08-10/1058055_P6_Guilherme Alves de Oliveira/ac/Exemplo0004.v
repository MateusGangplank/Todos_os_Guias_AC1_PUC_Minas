// -------------------------
// Exemplo0001 - NAND
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- NAND gate
// -------------------------
module nandgate (output s,input a,
                        input  b);
assign s =  ~(a) |  ~(b);
endmodule // nandgate
// -------------------------
// -- test NAND gate
// -------------------------
module testnandgate;
// ------------------------- dados locais
   reg    a,b;   // definir registrador
                 // (variavel independente)
   wire   s;   // definir conexao (fio)
                // (variavel dependente  )
// ------------------------- instancia
  nandgate NAND1 (s, a,b);
// ------------------------- preparacao
   initial begin:start
      a=0;
		b=0;    // valor inicial
   end// ------------------------- parte principal
   initial begin
         $display("Exrcicio1 - Guilherme Alves - 450161");
         $display("Test NAND gate");
			$display("a  b = s");
          a=0;
			 b=0;
#1   		$display(a, "  " ,b,     "   " ,s);
           a= 0;
			  b =1;
#1   		$display(a, "  " ,b,     "   " ,s);
  			a = 1;
			b = 0;
#1   		$display(a, "  " ,b,     "   " ,s);	
			a=1;
			b=1;
#1   		$display(a, "  " ,b,     "   " ,s);
   end
endmodule // testnandgate