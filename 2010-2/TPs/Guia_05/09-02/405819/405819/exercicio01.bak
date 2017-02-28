// ---------------------
// Exercicio 01_guia05 -
// Nome: Mariana do Amaral
// Matricula: 405819
// ---------------------

module meiasoma(s0,s1,a,b);

output s0,s1;
input a,b;

xor XOR(s0,a,b);
and AND(s1,a,b);

endmodule

module somacompleta(s0,s1,a,b,c);

output s0,s1;
input a,b,c;

meiasoma MS1(r,c1,a,b);
meiasoma MS2(s0,c2,c,r);
or OR1(s1,c1,c2);

endmodule

module somacompleta3bits(s0,s1,s2,s3,a0,a1,a2,b0,b1,b2);
input a0,a1,a2,b0,b1,b2;
output s0,s1,s2,s3;

meiasoma MS3(s0,c1,a0,b0);
somacompleta SC1(s1,c2,a1,b1,c1);
somacompleta SC2(s2,s3,a2,b2,c2);

endmodule

module testesomacompleta3bits;
reg   a0,a1,a2,b0,b1,b2;
wire   s0,s1,s2,s3;

somacompleta3bits somaP (s0,s1,s2,s3,a0,a1,a2,b0,b1,b2);

initial begin: start
 a0=0; a1=0; a2=0; b0=0; b1=0; b2=0;
 end
 initial begin:main
 
 $display(" Mariana do Amaral - 405819");
      $display("exercicio01-guia05");
      //$display("\n(a ^ b) ^ c = s0 vai s1\n");
 $monitor("%b%b%b + %b%b%b = %b%b%b%b", a0,a1,a2,b0,b1,b2,s3,s2,s1,s0);

     #1 a0=0;a1=1;a2=1;b0=1;b1=0;b2=0;
     #1 a0=1;a1=1;a2=1;b0=1;b1=1;b2=1;

end
endmodule





