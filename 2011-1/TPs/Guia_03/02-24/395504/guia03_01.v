// ---------------------
// Guia 03_01 - Meia Soma AND
// Nome: Thaise Souto Martins
// Matricula: 395504
// ---------------------

// ---------------------
// -- meia soma
// ---------------------

module meiasoma (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2,s3;
 
 or orgate1(s2, a, b);
 nand nandgate1 (s3, a, b);	    // DEVERIA TER USADO UMA not
 and andgate1( s1, a, b);
 and andgate2 (s0, s2, s3);


endmodule // meia soma

// --------------------------
// -- test meia soma and
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
      $display("Guia 03_01 - Thaise Souto Martins - 395504");
      $display("Test Meia Soma gate");
      $display("\n a & b = s0 s1\n");
      $monitor(" %b & %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testmeiasoma
