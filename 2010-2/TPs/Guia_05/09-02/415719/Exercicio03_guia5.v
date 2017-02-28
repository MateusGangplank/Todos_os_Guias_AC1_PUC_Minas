//----------------------------------
//Exercicio03_Guia05 _ XOR
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
//----------------------------------

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

module multiplicar ( s0, s1, s2, s3, s4, s5, s6,s7, a0, a1, b0, b1);
output s0, s1, s2, s3, s4, s5, s6, s7, s8;
input a0, a1, b0, b1;

and AND0 ( s0, a0, b0 );
and AND1 ( s7, a1 , b0 );
and AND2 ( s4, a0, b1 );
and AND3 ( s5, a1, b1 );

meiasoma M0 ( s1, s6, s7 ,s4);
meiasoma M1 ( s2, s3, s5, s6);

endmodule // multiplicar

module testmultiplicar;
reg a0, a1, b0, b1;
wire s0, s1, s2, s3, s4, s5, s6;

multiplicar TOTAL ( s0, s1, s2, s3, s4, s5, s6,s7, a0, a1, b0, b1 );

 initial begin
      $display("Exercicio03_Guia05 - Marcos Felipe Martins Silva - 415719");
        $display("TESTE MULTIPLICAR");
      $display("\n a  *  b   =  s3 s2 s1 s0\n");
        
		$monitor("  %b%b  *  %b%b  =  %b%b%b%b",  a1, a0, b1, b0, s3, s2, s1, s0);

       a0=0; a1=0; b0=0; b1=0;
#1     a0=1; a1=1; b0=1; b1=1;
#1     a0=0; a1=1; b0=1; b1=1;
#1     a0=1; a1=1; b0=0; b1=0;


 end

endmodule // testmultiplicar


