//----------------------------------
//Exercicio01_Guia05 - XOR
//Nome:Bruno Calil Nicoliello Moreira
//Matricula: 405790
//----------------------------------

//--Soma Completa (com 3 bits)

module meiasoma (s0, s1, a, b);
output s0, s1;
input a, b;

xor XOR ( s0, a, b );
and AND ( s1, a, b );

endmodule // meiasoma


module somacompleta ( s0, s1, a, b, c );
output s0, s1;
input a, b, c;

meiasoma M0 ( s2, s3, a, b) ;
meiasoma M1 ( s0, s4, c, s2);
or       OR0 (s1, s3, s4);

endmodule // somacompleta


module tresbits ( s0, s1, s2, s3, s4, s5, a0, a1, a2, b0, b1, b2 );
output s0, s1, s2, s3, s4, s5;
input a0, a1, a2, b0, b1, b2;

meiasoma T0 ( s0, s4, a0, b0 );
somacompleta T1 ( s1, s5, a1, b1, s4 );
somacompleta T2 ( s2, s3, a2, b2, s5 );

endmodule // tresbits

//--teste

module testetresbits;
reg a0, a1, a2, b0, b1, b2 ;
wire s0, s1, s2, s3;

tresbits TOTAL ( s0, s1, s2, s3, s4, s5, a0, a1, a2, b0, b1, b2 );

 initial begin
      $display("Exercicio01_Guia05 - Bruno Calil Nicoliello Moreira - 405790");
      $display("Teste da Soma completa (3BITS)");
      $display("\n a  +  b   =  s3s2s1s0\n");
        
		$monitor("  %b%b%b  +  %b%b%b   =  %b%b%b%b",  a2, a1, a0, b2, b1, b0, s3, s2, s1, s0);

       a0=0; a1=0; a2=0; b0=0; b1=0; b2=0;
#1     a0=1; a1=1; a2=1; b0=1; b1=1; b2=1;
#1     a0=0; a1=1; a2=1; b0=1; b1=1; b2=1;
#1     a0=1; a1=1; a2=0; b0=1; b1=1; b2=1;


 end

endmodule //teste
