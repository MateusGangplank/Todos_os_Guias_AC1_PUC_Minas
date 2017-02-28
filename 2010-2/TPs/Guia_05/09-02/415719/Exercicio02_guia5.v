//----------------------------------
//Exercicio02_Guia05 _ XOR
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
//----------------------------------

//--Diferenca-completa  (2 bits)

module meiadiferenca (s0, s1, a, b );
output s0, s1;
input a, b;

xor XOR ( s0, a, b );
and AND ( s1, ~a, b);
endmodule // meiadiferenca


module diferencacompleta ( s0, s1, a, b ,c);
output s0, s1;
input a, b, c;

meiadiferenca D0 ( s2, s3, a, b );
meiadiferenca D1 ( s0, s4, s3, c);
or            OR ( s1, s3, s4 );

endmodule // diferencacompleta


module doisbits ( s0, s1, s2, s3, a0, a1, b0, b1 );
output s0, s1, s2, s3;
input a0, a1, b0, b1;

meiadiferenca D2 ( s0, s2, a0, b0 );
diferencacompleta D3 ( s1, s3, s2, a1, b1 );

endmodule // doisbits

// -- teste

module testdoisbits;
reg a0, a1, b0, b1 ;
wire s0, s1;

doisbits TOTAL ( s0, s1, s2, s3, a0, a1, b0, b1 );

 initial begin
      $display("Exercicio02_Guia05 - Marcos Felipe Martins Silva - 415719");
      $display("Test DIFERENCA-COMPLETA (3BITS)");
      $display("\n a  -  b   =  s1s0\n");
        
		$monitor("  %b%b  -  %b%b   =  %b%b",   a1, a0, b1, b0, s1, s0);

       a0=0; a1=0;  b0=0; b1=0;
#1     a0=1; a1=1;  b0=1; b1=1;
#1     a0=0; a1=1;  b0=1; b1=0;
#1     a0=1; a1=1;  b0=1; b1=0;


 end

endmodule // testetresbits




