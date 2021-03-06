// Nome: Raphaela Fernanda Silva
// Matricula:420141


module maxtermos (s,a,b,c,d);
output s;
input a,b,c,d;
wire s1,s2,s3,s4,s5,s6,s7,s8;


or OR1(s1,a,b,c,d);
or OR2(s2,a,b,~c,~d);
or OR3 (s3, a,~b,c,~d);
or OR4 (s4,a,~b,~c,d);
or OR5 (s5,~a,b,c,~d);
or OR6 (s6,~a,b,~c,d);
or OR7 (s7,~a,~b,c,d);
or OR8 (s8,~a,~b,~c,~d);


and AND1 (s,s1,s2,s3,s4,s5,s6,s7,s8); 


endmodule 

module testesmaxtermos;

wire s;
reg a,b,c,d;

maxtermos MT (s,a,b,c,d);

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
