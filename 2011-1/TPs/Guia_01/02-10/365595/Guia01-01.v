
// 
// Ex 01 
// Vinicius Dos Santos Bordoni
// 365595
//
module NAND(A,B,C,S);
       output S;
       input A,B,C;
   assign S = ( ~(A&B&C) );
endmodule
module testeNAND;
       reg Y,W,Z;
       wire X;
       NAND NAND1(Y, W, Z, X);
       initial begin
       $display("Guia 01 Ex01");
       $display("Vinicius dos Santos Bordoni");
       $display("365595");
       $display("Teste NAND");
      Y=0; W=0; Z=0;
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);
      Y=0; W=0; Z=1; 
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);
      Y=0; W=1; Z=0;
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);
      Y=0; W=1; Z=1;
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);
      Y=1; W=0; Z=0;
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);
      Y=1; W=0; Z=1;
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);
      Y=1; W=1; Z=0;
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);
      Y=1; W=1; Z=1;
  #1  $display("%b & %b & %b = %b ", Y, W, Z, X);

 end

endmodule // testNAND