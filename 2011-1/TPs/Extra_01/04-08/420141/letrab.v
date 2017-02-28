// Nome: Raphaela Fernanda Silva
// Matricula: 420141


module mintermos (s,a,b,c,d);
output s;
input a,b,c,d;
wire s1,s2,s3,s4,s5,s6,s7,s8;


and AND1(s1,~a,~b,~c,d);
and AND2(s2,~a,~b,c,~d);
and AND3 (s3, ~a,b,~c,~d);
and AND4 (s4,~a,b,c,d);
and AND5 (s5,a,~b,~c,~d);
and AND6 (s6,a,~b,c,d);
and AND7 (s7,a,b,~c,d);
and AND8 (s8,a,b,c,~d);

or OR1 (s,s1,s2,s3,s4,s5,s6,s7,s8); 


endmodule

module testmintermos;

wire s;
reg a,b,c,d;

mintermos MT (s,a,b,c,d);

 initial begin
      $display("a  b   c   d = s0");
      $monitor("%b  %b   %b   %b =  %b", a, b, c, d, s);
  
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