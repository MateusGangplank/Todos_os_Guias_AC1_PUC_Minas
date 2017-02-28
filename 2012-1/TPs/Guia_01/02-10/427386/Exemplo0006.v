// --------------------- 
// Exemplo0006 - nand 
// Nome: André Henriques Fernandes 
// Matricula: 427386
// --------------------- 
 
// --------------------- 
// -- nand gate 
// --------------------- 
 
module nandgate (output [0:3] s, 
                             input   [0:3] p, 
                             input   [0:3] q); 
 assign s = ~(p & q); 
endmodule // nand 
 
// --------------------- 
// -- test nandgate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
   reg  [0:3] a,b; // definir registrador 
   wire [0:3] s;    // definir conexao (fio) 
// ------------------------- instancia 
   nandgate NAND1 (s, a, b);  
// ------------------------- preparacao 
   initial begin:start 
      a=4'b0011;   // 4 valores binarios 
      b=4'b0101;   // 4 valores binarios 
   end 
 
// ------------------------- parte principal 
   initial begin:main 
      $display("Exemplo0006 - Andre Henriques Fernandes - 427386"); 
      $display("Test nand gate"); 
      $display("\n ~(a   &   b)  =   s\n"); 
      $display("~(%b & %b) = %b", a, b, s); 
  #1  a=4'b0000;    b=4'b0001;
   $display("~(%b & %b) = %b", a, b, s);     
  #1  a=4'b0010;    b=4'b0011;  
   $display("~(%b & %b) = %b", a, b, s);
  #1  a=4'b0100;    b=4'b0101;  
   $display("~(%b & %b) = %b", a, b, s);
  #1  a=4'b0110;    b=4'b0111;    
   $display("~(%b & %b) = %b", a, b, s);
  #1  a=4'b1000;    b=4'b1001;     
   $display("~(%b & %b) = %b", a, b, s);
  #1  a=4'b1010;    b=4'b1011;   
   $display("~(%b & %b) = %b", a, b, s); 
 
 end 
 
endmodule // testnandgate 