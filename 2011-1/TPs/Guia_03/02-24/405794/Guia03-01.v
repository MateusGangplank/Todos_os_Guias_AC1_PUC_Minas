// ---------------------
// Nome: Caio Ragacci Pimentel
// Matricula: 405794
// ---------------------


// ---------------------
// -- Guia03 - 01
// ---------------------

 module testexercicio01;
 reg   a, b;
 wire  c0, s, s0, s1, a0, b0;
 
 not NOT1 (a0, a);              // TENTE FAZER A DEFINICAO EM OUTRO MODULO
 not NOT2 (b0, b);
 and AND1 (s0, a0, b);
 and AND2 (s1, a, b0);
 or  OR1   (s, s0, s1);
 and AND3 (c0, a, b);
           
         
 initial begin
 
      $display("Guia03- 01 - Caio Ragacci Pimentel - 405794");
      $display(" MEIA SOMA");
      $display("A  +  B  =  C  S");
      
		a=0; b=0;
		
  	#1	 $monitor("%b  +  %b  =  %b  %b", a, b, c0, s);
   #1  a=0; b=1;
   #1  a=1; b=0;
   #1  a=1; b=1;
 
 end

endmodule // testexercicio01

