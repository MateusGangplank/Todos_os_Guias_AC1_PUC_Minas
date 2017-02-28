// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module QuineMC (s,a,b,c,d);
output s;
input a,b,c,d;
wire s1,s2,s3,s4,s5,s6,s7,s8;

and AND1(s1,~a,c,d);
and AND2(s2,~b,c,d);
and AND3(s3,b,~c,d);
and AND4(s4,~a,b,c);
and AND5(s5,a,~b,d);
and AND6(s6,a,~c,d);
and AND7(s7,a,~b,c);
and AND8(s8,a,b,~c);
and AND9(s9,a,b,~d);

or OR1(s,s1,s2,s3,s4,s5,s6,s7,s8,s9); 

endmodule 

module testQuineMC;

wire s;
reg a,b,c,d;

QuineMC QMC (s,a,b,c,d);

 initial begin
      $display("a  b   c   d  s");
      $monitor("%b  %b   %b   %b  %b", a, b, c, d, s);
  
	     a=0; b=0; c=0; d=0;  
    #1  a=0; b=0; c=0; d=1;
    #1  a=0; b=0; c=1; d=0;
    #1  a=0; b=0; c=1; d=1;
    #1  a=0; b=1; c=0; d=0;
 	 #1  a=0; b=1; c=0; d=1;
    #1  a=0; b=1; c=1; d=0;
    #1  a=0; b=1; c=1; d=1;
    #1  a=1; b=0; c=0; d=0;
    #1  a=1; b=0; c=0; d=1;
    #1  a=1; b=0; c=1; d=0;
    #1  a=1; b=0; c=1; d=1;
    #1  a=1; b=1; c=0; d=0;
    #1  a=1; b=1; c=0; d=1;
    #1  a=1; b=1; c=1; d=0;
    #1  a=1; b=1; c=1; d=1;


        
    end
    endmodule