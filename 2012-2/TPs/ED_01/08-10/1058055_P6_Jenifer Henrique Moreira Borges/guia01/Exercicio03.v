// ---------------------
// Exercicio03 - xnor
// Nome: Jenifer Henrique
// Matricula: 427420
// --------------------- 
 
// --------------------- 
// -- xnor gate 
// --------------------- 
 
module xnorgate (output [0:3] s, 
                             input   [0:3] p, 
                             input   [0:3] q); 
 assign s = ~(p ^ q); 
endmodule // xnor
 
// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
   reg  [0:3] a,b; // definir registrador 
   wire [0:3] s;    // definir conexao (fio) 
// ------------------------- instancia 
   xnorgate XNOR1 (s, a, b);  
// ------------------------- preparacao 
   initial begin:start 
      a=4'b0011;   // 4 valores binarios 
      b=4'b0101;   // 4 valores binarios 
   end 
 
// ------------------------- parte principal 
   initial begin:main 
      $display("Exercicio03- Jenifer Henrique - 427420"); 
      $display("Test xnor gate"); 
      $display("\n ~(a   &   b)  =   s\n"); 
      $monitor("~(%b & %b) = %b", a, b, s); 
  #1  a=4'b0000;    b=4'b0001;     
  #1  a=4'b0010;    b=4'b0011;  
  #1  a=4'b0100;    b=4'b0101;  
  #1  a=4'b0110;    b=4'b0111;    
  #1  a=4'b1000;    b=4'b1001;     
  #1  a=4'b1010;    b=4'b1011;    
 
 end 
 
endmodule // testxnorgate