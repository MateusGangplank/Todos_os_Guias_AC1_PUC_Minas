//----------------------------------
//Exercicio01_Guia08 
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
//----------------------------------

//-- Simplifica��o f(a,b,c,d)= SoP(2,3,6,7,10,11,12,14)

module simplifica (s, a, b, c, d);
input a, b, c, d;
output s;

not NOT0 ( s1, a );
not NOT1 ( s2, b );
not NOT2 ( s3, d );
and AND0 ( s4, s1, c );
and AND1 ( s5, a, b, s3 );
and AND2 ( s6, a, s2, c );
or  OR0  ( s, s4, s5, s6 );

endmodule // simplifica

//--teste

module testesimplifica;
reg a, b, c, d;
wire s;

simplifica S0 (s, a, b, c, d);

initial begin
      $display("Exercicio01_Guia08 - Marcos Felipe Martins Silva - 415719");
      $display("Test Quine-McCluskey");
      $display("\n a  b  c  d  =  s\n");
        
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