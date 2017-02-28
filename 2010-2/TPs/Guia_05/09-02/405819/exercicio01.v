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

module somacompleta(s0,s1,s2,s3,s4,s5,a,b,c)

output so,s1;
input a,b,c;

meiasoma MS1(s4,s5,a,b);
meiasoma MS2(s0,s3,c,s4);
or OR1(s1,s3,s5);

endmodule

module somacompleta3bits(s0,s1,s2,s3,s4,s5,a0,a1,a2,a3,b0,b1,b2,b3);

meiasoma MS3(s0,s4,a0,b0);
somacompleta SC1(s1,s5,a1,b1,s4);
somacompleta SC2(s2,s3,a2,b2,s5);

endmodule

module testesomacompleta3bits;
reg   a0,a1,a2,a3,b0,b1,b2,b3;
wire   s0,s1,s2,s3,s4,s5;

somacompleta3bits P(s0,s1,s2,s3,s4,s5,a0,a1,a2,a3,b0,b1,b2,b3);

initial begin: start
 a0=0; a1=0; a2=0; b0=0; b1=0; b2=0 ;

 $display(" Mariana do Amaral - 405819");
      $display("exercicio01-guia05");
      $display("\n(a ^ b) ^ c = s0 vai s1\n");
 $monitor("(%b ^ %b)^%b = %b vai %b", a,b,c,s0,s1);

#1 a=0; b=0;c=1;
#1 a0=0;a1=1;a2=1;b0=1;b1=0;b2=0;

end
endmodule





