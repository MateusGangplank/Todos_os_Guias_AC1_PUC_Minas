// ---------------------
// Guia 03_05 - Meia Diferenca NOR
// Nome: Heitor Terozendi
// Matricula: 396698
// ---------------------

// ---------------------
// -- meia diferenca
// ---------------------

module meiadiferenca (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2,s3,s4,s5,s6;
 
 nor norgate1 (s2, a, a);
 nor norgate2 (s3, b, b);
 nor norgate3 (s4, s2, s3);
 nor norgate4 (s5, a, b);
 nor norgate5 (s0, s5, s4);
 nor norgate6 (s6, s2, s2);
 nor norgate7 (s1, s6, s3);
 
 endmodule //meiadiferenca

// --------------------------
// -- test meia diferenca nor
// --------------------------

module testmeiadiferenca;
 reg   a, b;             
 wire  s0, s1;
          // instancia
 meiadiferenca MEIADIFERENCA1 (s0, s1, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 03_05 - Heitor Terozendi - 396698");
      $display("Test Meia Diferenca NOR gate");
      $display("\n a | b = s0 s1\n");
      $monitor(" %b | %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testmeiadiferenca
