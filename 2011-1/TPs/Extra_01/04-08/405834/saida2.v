
module saida2 (s2,a,b,c,d);
	output s2;
	input a,b,c,d;
	
	and AND1 (s2,a,b,c,d);	
endmodule

module TESTE;
	
	wire s2;
	reg a,b,c,d;

	saida2 Teste (s2,a,b,c,d);

 	initial begin
	   $display("\nRafael Moreira Melo-405834\n");
      $display("\na   b   c   d   s2\n");
      $monitor("%b + %b + %b + %b = %b", a, b, c, d, s2);
  
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

