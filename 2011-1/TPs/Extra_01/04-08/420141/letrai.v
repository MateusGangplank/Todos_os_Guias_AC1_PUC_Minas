// Nome: Raphaela Fernanda Silva
// Matricula:420141

module algebra (s,a,b,c,d);
output s;
input a,b,c,d;
wire s1,s2,s3,s4,s5,s6,s7,s8;

xor XOR1(s1,a,c);
xor XOR2(s2,b,c);
xor XOR3(s3,a,b);
xor XOR4(s4,b,d);
and AND1(s5,s1,d);
and AND2(s6,s2,d);
and AND3(s7,s3,c);
and AND4(s8,s4,a);

or OR1(s,s5,s6,s7,s8);

endmodule

module testalgebra;

wire s;
reg a,b,c,d;

algebra AL (s,a,b,c,d);

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
