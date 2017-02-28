//Nome: Gabriel Benjamim de Carvalho
//Matrícula: 396690



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
 

 endmodule 



module testemeiadiferenca;


 reg   a, b;             
 wire  s0, s1;

          
 meiadiferenca MEIADIFERENCA1 (s0, s1, a, b);


 initial begin:start
      a=0; b=0;
 end

         

 initial begin:main
      $display("Nome: Gabriel Benjamim de Carvalho - 396690");
      $display("Meia diferenca com portas NOR.");
      $display("\n a | b = s0 s1\n");
      $monitor(" %b | %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  

 end

endmodule 
