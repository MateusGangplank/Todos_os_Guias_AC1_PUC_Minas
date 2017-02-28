//Henrique Carvalho Parreira
//347133

module simplificada (s, a, b, c ,d);
input a,b,c,d;
output s;

nor NOR1 (q0,a,a);
nor NOR2 (q1,b,b);
nor NOR3 (q2,d,d);
nor NOR4 (q3,a,b,c);
nor NOR5 (q4,q0,b,c);
nor NOR6 (q5,q0,c,q2);
nor NOR7 (q6,a,c,d);
nor NOR8 (q7,q0,b,q2);
nor NOR9 (q8,q3,q4,q5,q6,q7);
nor NOR10 (s,q8,q8);
endmodule

module Teste ;
reg a,b,c,d;
wire s;
simplificada test  (s,a,b,c,d);
initial begin : start
a=0; b=0; c=0; d=0; 
end // end module teste

initial begin: main
 $display("Henrique Carvalho Parreira - 347133");
      $display("Guia 08 Ex:05\n");
$display ("Circuito simplificado com NOR\n");

$display ("a b c d = s\n");
$monitor ("%b %b %b %b = %2b",a,b,c,d,s);
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

/*

		Henrique Carvalho Parreira
		347133

    
    Circuito simplificado com NOR
    
    a b c d = s
    
    0 0 0 0 =  1
    0 0 0 1 =  1
    0 0 1 0 =  0
    0 0 1 1 =  0
    0 1 0 0 =  1
    0 1 0 1 =  0
    0 1 1 0 =  0
    0 1 1 1 =  0
    1 0 0 0 =  1
    1 0 0 1 =  1
    1 0 1 0 =  0
    1 0 1 1 =  1
    1 1 0 0 =  0
    1 1 0 1 =  1
    1 1 1 0 =  0
    1 1 1 1 =  0
    

*/