// -------------------------
// Exemplo0006 - NAND
// Nome: Ítalo Guimarães Otoni
// Matricula: 451581
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module nandgate ( output s, 
                           input  p, 
                           input  q);
assign s = ~(p & q);

endmodule

module testnandgate;
   reg   a, b; // definir registradores
	wire  s;    // definir conexao (fio)

   nandgate NAND1 (s, a, b);

   initial begin:start

      a=0; b=0;
   end
   initial begin
	
         $display("Exemplo0006 - Ítalo Guimarães Otoni - 451581");
         $display("Test NAND gate");
         $display("\n(a & b)' = s\n");
           a=0; b=0;
			  
  #1 $display ("%b & %b = %b", a, b, s);
  a=0; b=1;
  #1  $display ("%b & %b = %b", a, b, s); 
  a=1; b=0;
  #1  $display ("%b & %b = %b", a, b, s);
  a=1; b=1;
  #1 $display ("%b & %b = %b", a, b, s);
  end
  
endmodule // testnandgate