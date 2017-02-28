// ---------------------
// Guia 04_01 - Meia Soma
// Nome:Alvaro Henrique de Araujo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- Half Adder
// ---------------------

	module meiasoma (s0, s1, a, b);
	 output s0, s1;
	 input  a, b;
	 wire s2,s3,s4;
 
    nor norgate1 (s2, a, a);
	 nor norgate2 (s3, b, b);
	 nor norgate3 (s1, s2, s3);
	 nor norgate4 (s4, a, b); 
	 nor norgate5 (s0, s1, s4);
 
	endmodule // meia soma

// --------------------------
// -- test Half Adder
// --------------------------

module testmeiasoma;
 reg   a, b;             
 wire  s0, s1;
          // instancia
 meiasoma MEIASOMA1 (s0, s1, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04 - Ex01 - Alvaro Henrique de Araujo Rungue");
      $display("Test Half Adder gate");
      $display("\n a & b = s0 s1\n");
      $monitor(" %b & %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testmeiasoma
