// ---------------------
// Guia 03 - Exercício 03
// Nome: Luiz Guilherme Andrade Menezes
// Matricula: 292160
// ---------------------

// ---------------------
// -- half sub
// ---------------------
module meiadiferenca (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2,s3,s4,s5,s6,s7;
 
 nand nandgate1 (s2, a, b);
 nand nandgate7 (s6, a, a);
 nand nandgate2 (s7, s6, b);
 nand nandgate8 (s1, s7, s7);
 nand nandgate3 (s3, a, b);
 nand nandgate4 (s4, a, s3);
 nand nandgate5 (s5, s3, b);
 nand nandgate6 (s0, s4, s5);

endmodule // meia diferenca

module testmeiadiferenca;
 reg   a, b;             
 wire  s0, s1;
 
 meiadiferenca MEIADIFERENCA1 (s0, s1, a, b);

 initial begin:start
      a=0; b=0;
 end

 initial begin:main
      $display("Guia 03 - Exercício 03 - Luiz Menezes - 292160");
      $display("Half sub using NAND");
      $display("\n a | b = s0 s1\n");
      $monitor(" %b | %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule
