// Guia 04_01 - Meia Soma NAND
// Nome: Andr� Silveira Gomes de Paiva
// Matricula: 371670

module meiasoma (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2,s3,s4,s5;
 
 nand nandgate1 (s2, a, b);
 nand nandgate2 (s1, s2, s2);
 nand nandgate3 (s3, a, b);
 nand nandgate4 (s4, a, s3);
 nand nandgate5 (s5, s3, b);
 nand nandgate6 (s0, s4, s5);

endmodule


module testmeiasoma;
 reg   a, b;             
 wire  s0, s1;
          
 meiasoma MEIASOMA1 (s0, s1, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04_01 - Andr� Silveira Gomes de Paiva - 371670");
      $display("Meia soma com portas NAND");
      $display("\n a & b = s0 s1\n");
      $monitor(" %b & %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule
