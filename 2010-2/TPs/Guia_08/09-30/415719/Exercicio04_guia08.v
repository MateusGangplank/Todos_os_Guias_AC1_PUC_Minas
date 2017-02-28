//----------------------------------
//Exercicio04_Guia08
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
//----------------------------------

//-- Simplificação- Usando apenas portas NANDs

module simplifica (s, a, b, c, d);
input a, b, c, d;
output s;

 nand NAND0 ( s1, a, a );
 nand NAND1 ( s2, s1, c );
 nand NAND2 ( s3, d, d );
 nand NAND3 ( s4, s3, a, b );
 nand NAND4 ( s5, b, b );
 nand NAND5 ( s6, s5, c );
 nand NAND0 ( s, s2, s4, s6 );

endmodule // simplifica

//--teste

module testesimplifica;
reg a, b, c, d;
wire s;

simplifica S0 (s, a, b, c, d);

initial begin
      $display("Exercicio04_Guia08 - Marcos Felipe Martins Silva - 415719");
      $display("Test Quine-McCluskey");
      $display("\n a b c d  = s\n");
        
$monitor(" %b %b %b %b  = %b", a, b, c, d, s);
	  
       a=0; b=0; c=0; d=0;
#1     a=0; b=0; c=0; d=1;
#1     a=0; b=0; c=1; d=0;
#1     a=0; b=0; c=1; d=1;
#1     a=0; b=1; c=0; d=0;
#1     a=0; b=1; c=0; d=1;
#1     a=0; b=1; c=1; d=0;
#1     a=0; b=1; c=1; d=1;
#1     a=1; b=0; c=0; d=0;
#1     a=1; b=0; c=0; d=1;
#1     a=1; b=0; c=1; d=0;
#1     a=1; b=0; c=1; d=1;
#1     a=1; b=1; c=0; d=0;
#1     a=1; b=1; c=0; d=1;
#1     a=1; b=1; c=1; d=0;
#1     a=1; b=1; c=1; d=1;

end

endmodule // testsimplificar
