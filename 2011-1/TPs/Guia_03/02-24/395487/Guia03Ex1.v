// ---------------------
// Guia 03_01 - Meia Soma
// Nome:Alvaro Henrique de Araujo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- Half Adder
// ---------------------

 module halfAdder (s0 , s1 , x , y);
 
 	output s0 , s1;
 	input  x , y;
 	wire s2 , s3;
	
 or orgate1(s2, x, y);
 and andgate1( s1, x, y);
 not notgate1( s3 , s1);
 and andgate2 (s0, s2, s3);	
 
 endmodule // halfAdder
 
 // --------------------------
// -- test HalfAdder
// --------------------------

module testhalfAdder;
 reg   a, b;             
 wire  s0, s1;
          // instancia
 halfAdder HALFADDER1 (s0, s1, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 03 Ex01 - Alvaro Henrique de Araujo Rungue");
      $display("Test Half Adder gate");
      $display("\n a & b = s0 s1\n");
      $monitor(" %b & %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testhalfAdder
