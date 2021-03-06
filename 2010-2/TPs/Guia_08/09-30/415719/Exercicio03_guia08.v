//----------------------------------
//Exercicio03_Guia08
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
//----------------------------------

//-- Simplificação

module simplifica (s, a, b, c, d);
input a, b, c, d;
output s;

not NOT0 ( s1, a );
not NOT1 ( s2, b );
not NOT2 ( s3, c );
not NOT3 ( s4, d );
and AND0 ( s5, s1, s2, s4 );
and AND1 ( s6, s1, s3, s4 );
and AND2 ( s7, a, s2, s3 );
and AND3 ( s8, a, s3, d );
and AND4 ( s9, a, s2, d );
or  OR1  ( s, s5, s6, s7, s8, s9 );

endmodule // simplifica

//--teste

module testesimplifica;
reg a, b, c, d;
wire s;

simplifica S0 (s, a, b, c, d);

initial begin
      $display("Exercicio03_Guia08 - Marcos Felipe Martins Silva - 415719");
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
