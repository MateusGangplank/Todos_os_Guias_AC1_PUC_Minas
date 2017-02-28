// Giselle Caroline Vieira
// Matricula:424649
// Prava 01 - letra d


module s0maxtermos (s0,a,b,c,d);
output s0;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t,t7,t8;


or OR1(t1,a,b,c,d);
or OR2(t2,a,b,~c,~d);
or OR3 (t3, a,~b,c,~d);
or OR4 (t4,a,~b,~c,d);
or OR5 (t5,~a,b,c,~d);
or OR6 (t6,~a,b,~c,d);
or OR7 (t7,~a,~b,c,d);
or OR8 (t8,~a,~b,~c,~d);


and AND1 (s0,t1,t2,t3,t4,t5,t6,t7,t8); 


endmodule //fim s0mintermos

module testes0;

wire s0;
reg a,b,c,d;

s0maxtermos Teste (s0,a,b,c,d);

 initial begin
      $display("\na  b   c   d  s0\n");
      $monitor("%b  %b   %b   %b  %b", a, b, c, d, s0);
  
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

