//
// Nome:Thaise Souto Martins - 395504
//


module Exer3 (s1,s0,a,b);
output s1,s0;
input a,b;

 xor XOR1 (s0,a,b);
 and AND1 (s1,a,b);

endmodule



module Soma (s1,s0,a,b,c);
output s1,s0;
input a,b,c;

 Exer3 soma01 (s2,s3,a,b);
 Exer3 soma02 (s4,s0,s3,c);
 or ou (s1,s2,s4);
	
	endmodule



module Produto (s0,s1,s2,s3,a0,a1,b0,b1,e);
output s0,s1,s2,s3;
input a0,a1,b0,b1,e;
wire c1,c2,c3;

 and AND1 (c1,b1,a0);
 and AND2 (c2,b1,a1);
 and AND3 (c3,a1,b0);
 and AND4 (s0,a0,b0);


Soma soma1 (se,s1,c3,c1,e);
Soma soma2 (s3,s2,c2,e,se);

endmodule



module teste;
 reg  a0,a1,b0,b1,e;
  wire s0,s1,s2,s3;
  

Produto Prod (s0,s1,s2,s3,a0,a1,b0,b1,e);

 
    
	  
 initial begin
     
	$display("Thaise Souto Martins");
      $display("Exercicio 03");
		$monitor("%b %b   %b %b   %b %b %b %b",a1,a0,b1,b0,s3,s2,s1,s0 );
		
   a0=0; a1=0; b0=0; b1=0; e=0;		
  #1 b0=1;		
  #1 b1=1;b0=0;
  #1 b0=1;   		
  #1 a0=1;b1=0;b0=0;
  #1 b0=1;		
  #1 b1=1;b0=0;
  #1 b0=1;	
  #1 a1=1;a0=0;b1=0;b0=0;
  #1 b0=1;		
  #1 b1=1;b0=0;
  #1 b0=1;   		
  #1 a0=1;b1=0;b0=0;
  #1 b0=1;		
  #1 b1=1;b0=0;
  #1 b0=1;	

    
  
   end
	
endmodule