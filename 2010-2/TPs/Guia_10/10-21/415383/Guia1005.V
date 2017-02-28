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
reg d;
wire dn,q,qn;
not DNOT (dn,d);
latchsr SR (d,dn,q,qn);
initial begin
      $display("Exercicio 01 - Lucas Teixeira Santos - 415383");
      $display("Teste Latch S-R usando Latch D");
      $display("D  DN  = Q  Q'");
       d=0;
  	#1	 $monitor("%b  %b   = %b  %b", d, dn, q, qn);
    #1  d=1;
	 #1  d=0;
	 #1  d=1;
 end

endmodule 
/* teste
    Teste Latch S-R usando Latch D
    D  DN  = Q  Q'
    0  1   = 0  1
    1  0   = 1  0
    0  1   = 0  1
    1  0   = 1  0
*/
