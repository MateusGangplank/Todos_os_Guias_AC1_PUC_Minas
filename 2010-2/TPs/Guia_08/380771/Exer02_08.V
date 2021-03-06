//
// AC 1 - 2010
// TP 08_02
// Nome:Igor Rodrigues de Oliveira
// Matricula: 380771
//


module Exer2 (s0, a, b, c, d);

 output s0;
 input a, b, c, d;
 wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;


and AND1(s12, s1, s2, s3);
and AND2(s13, s4, s5, s6);
and AND3(s14, s7, s8, s9);
and AND4(s15, a, s10, d);
and AND5(s16, a, s11, d);
or OR1(s0, s12, s13, s14, s15, s16);
not NOT1(s1, a);
not NOT2(s2, b);
not NOT3(s3, d);
not NOT4(s4, a);
not NOT5(s5, c);
not NOT6(s6, d);
not NOT7(s7, b);
not NOT8(s8, c);
not NOT9(s9, d);
not NOT10(s10, b);
not NOT11(s11, c);

endmodule



module teste;

 reg a, b, c, d;
 wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;


Exer2 circ (s0, a, b, c, d);



initial begin
 $display("Igor Rodrigues de Oliveira - 380771");
      $display("Guia 8");
		 $display("AC - 2010");
$display("\na b c d = s0\n");
$monitor("%b %b %b %b = %b", a, b, c, d, s0);

  a=0; b=0; c=0; d=0;
 #1 a=0; b=0; c=0; d=1;
 #1 a=0; b=0; c=1; d=0;
 #1 a=0; b=0; c=1; d=1;
 #1 a=0; b=1; c=0; d=0;
 #1 a=0; b=1; c=0; d=1;
 #1 a=0; b=1; c=1; d=0;
 #1 a=0; b=1; c=1; d=1;
 #1 a=1; b=0; c=0; d=0;
 #1 a=1; b=0; c=0; d=1;
 #1 a=1; b=0; c=1; d=0;
 #1 a=1; b=0; c=1; d=1;
 #1 a=1; b=1; c=0; d=0;
 #1 a=1; b=1; c=0; d=1;
 #1 a=1; b=1; c=1; d=0;
 #1 a=1; b=1; c=1; d=1;

end
 
endmodule