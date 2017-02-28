//Henrique Carvalho Parreira
//347133

module circuito (s0, a, b, c, d);

 output s0;
 input a, b, c, d;

 not NOT1 (r1,a);
 not NOT2 (r2,b);
 not NOT3 (r3,c);
 not NOT4 (r4,d);

 and AND1 (s1, r1,r2,r4);
 and AND2 (s2, r1,r3,r4);
 and AND3 (s3, r2, r3, r4);
 and AND4 (s4, a, r2,d);
 and AND5 (s5,a,r3,d);

 or OR1 (s0, s1,s2,s3,s4,s5);

endmodule // end module

module testeCircuito( );

reg a, b,c,d;
wire s0;

circuito C1(s0, a, b, c, d);

  initial begin:start
   a = 0; b=0; c=0; d=0;

  end

  initial begin: main
 
      $display("Henrique Carvalho Parreira -347133");
   $display("\n     Circuito 02\n");
 $display("\na b c d = s0\n");  
	$monitor("%b %b %b %b = %b", a, b, c, d, s0);

        #1 a = 0; b=0; c=0; d=1;
        #1 a = 0; b=0; c=1; d=0;
        #1 a = 0; b=0; c=1; d=1;
        #1 a = 0; b=1; c=0; d=0;
        #1 a = 0; b=1; c=0; d=1;
        #1 a = 0; b=1; c=1; d=0;
        #1 a = 0; b=1; c=1; d=1;
        #1 a = 1; b=0; c=0; d=0;
        #1 a = 1; b=0; c=0; d=1;
        #1 a = 1; b=0; c=1; d=0;
        #1 a = 1; b=0; c=1; d=1;
        #1 a = 1; b=1; c=0; d=0;
        #1 a = 1; b=1; c=0; d=1;
        #1 a = 1; b=1; c=1; d=0;
        #1 a = 1; b=1; c=1; d=1;

  end
endmodule // end module

/*

		Henrique Carvalho Parreira
		347133
		  
         Circuito 02
    
    
    a b c d = s0
    
    0 0 0 0 = 1
    0 0 0 1 = 0
    0 0 1 0 = 1
    0 0 1 1 = 0
    0 1 0 0 = 1
    0 1 0 1 = 0
    0 1 1 0 = 0
    0 1 1 1 = 0
    1 0 0 0 = 1
    1 0 0 1 = 1
    1 0 1 0 = 0
    1 0 1 1 = 1
    1 1 0 0 = 0
    1 1 0 1 = 1
    1 1 1 0 = 0
    1 1 1 1 = 0

*/