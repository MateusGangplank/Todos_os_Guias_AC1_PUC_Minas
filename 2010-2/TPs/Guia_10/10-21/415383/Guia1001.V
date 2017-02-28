// ---------------------
// Guia 10
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------


module latchsr (s,r,q,qn);
 output q,qn;
 input   s, r;
 wire  nor1,nor2;
 nor NOR1 (nor1,s,nor2);
 nor NOR2 (nor2,r,nor1);
 assign q = nor2;
 assign qn = nor1;
endmodule  // fim modulo latch

         
//teste do modulo
module testlatch;
reg s,r;
wire q,qn;
latchsr SR (s,r,q,qn);
initial begin
      $display("Exercicio 01 - Lucas Teixeira Santos - 415383");
      $display("Teste Latch S-R");
      $display("S  R  = Q  Q'");
       s=0; r=0;
  	#1	 $monitor("%b  %b  = %b  %b", s, r, q, qn);
    #1  s=0; r=1;
    #1  s=1; r=0;
    #1  s=1; r=1;
 end

endmodule 
/* teste
    Teste Latch S-R
    S  R  = Q  Q'
    0  0  = x  x // HOLD
    0  1  = 0  1
    1  0  = 1  0
    1  1  = 0  0
*/
