//--AC 1 - 2010
//--TP 08_03
//--Nome:Felipe Pacifico
//--Matricula: 389868


module Exer3 (s0, a, b, c, d, e);

output s0;
input a, b, c, d, e;
wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, sa13;

not NOT1(s1, a);
not NOT2(s2, b);
not NOT3(s3, c);
not NOT4(s4, d);
not NOT5(s5, e);

and AND1(s6, a, s2, s3, d, s5);
and AND2(s7, a, b, d, e);
and AND3(s8, s1, s3, s4);
and AND4(s9, s2, s4, e);
and AND5(s10, s2, c, s4);
and AND6(s11, c, d, e);
and AND7(s12, b, c, e);
and AND8(s13, b, c, d);

or OR1(s0, s6, s7, s8, s9, s10, s11, s12, s13);

endmodule



module teste;

reg a, b, c, d, e;
wire s1;

Exer3 circ (s0, a, b, c, d, e);


initial begin
$display("Felipe Pacifico - 389868");
      $display("Guia 8");
		$display("AC - 2010");
	   $monitor("%b %b %b %b %b = %b", a, b, c, d, e, s0);
		
	 a=0;b=0;c=0;d=0; e=0;	
 #1 a=0;b=0;c=0;d=0;e=1;
 #1 a=0;b=0;c=0;d=1;e=0;
 #1 a=0;b=0;c=0;d=1;e=1;
 #1 a=0;b=0;c=1;d=0;e=0;
 #1 a=0;b=0;c=1;d=0;e=1;
 #1 a=0;b=0;c=1;d=1;e=0;
 #1 a=0;b=0;c=1;d=1;e=1;
 #1 a=0;b=1;c=0;d=0;e=0;
 #1 a=0;b=1;c=0;d=0;e=1;
 #1 a=0;b=1;c=0;d=1;e=0;
 #1 a=0;b=1;c=0;d=1;e=1;
 #1 a=0;b=1;c=1;d=0;e=0;
 #1 a=0;b=1;c=1;d=0;e=1;
 #1 a=0;b=1;c=1;d=1;e=0;
 #1 a=0;b=1;c=1;d=1;e=1;
 #1 a=1;b=0;c=0;d=0;e=0;
 #1 a=1;b=0;c=0;d=0;e=1;
 #1 a=1;b=0;c=0;d=1;e=0;
 #1 a=1;b=0;c=0;d=1;e=1;
 #1 a=1;b=0;c=1;d=0;e=0;
 #1 a=1;b=0;c=1;d=0;e=1;
 #1 a=1;b=0;c=1;d=1;e=0;
 #1 a=1;b=0;c=1;d=1;e=1;
 #1 a=1;b=1;c=0;d=0;e=0;
 #1 a=1;b=1;c=0;d=0;e=1;
 #1 a=1;b=1;c=0;d=1;e=0;
 #1 a=1;b=1;c=0;d=1;e=1;
 #1 a=1;b=1;c=1;d=0;e=0;
 #1 a=1;b=1;c=1;d=0;e=1;
 #1 a=1;b=1;c=1;d=1;e=0;
 #1 a=1;b=1;c=1;d=1;e=1;

end

endmodule