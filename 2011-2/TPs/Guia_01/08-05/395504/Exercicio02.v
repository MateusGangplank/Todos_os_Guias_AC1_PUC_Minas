// -------------------------
// Exercicio02 - NOR
// Nome: Thaise Souto Martins
// Matricula: 395504
// ------------------------- 
 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate ( output s,  
                               input  p,  
                               input  q); 
 assign s = ~(p|q); 
endmodule // norgate 
 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
   reg   a, b; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end 
  
// ------------------------- parte principal 
 
   initial begin 
      $display("Exercicio02  - Thaise Souto Martins - 395504");
      $display("Test NOR gate"); 
      $display("\n ~(a|b) = s\n"); 
      a=0; b=0; 
		$monitor("~(%b|%b) = %b", a, b, s);
  #1  a=0; b=1;
  #1  a=1; b=0; 
  #1  a=1; b=1; 
 end 
 
endmodule // testnorgate 
// Saídas

    -- Exercicio02  - Thaise Souto Martins - 395504
    -- Test NOR gate
    -- 
    --  ~(a|b) = s
    -- 
    -- ~(0|0) = 1
    -- ~(0|1) = 0
    -- ~(1|0) = 0
    -- ~(1|1) = 0