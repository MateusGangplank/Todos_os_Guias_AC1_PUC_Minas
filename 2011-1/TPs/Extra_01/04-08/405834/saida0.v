
module saida0 (s0,a,b,c,d);
	output s0;
	input a,b,c,d;
	wire f1,f2;
	
	xnor XNOR1 (f1,a,b);
	xnor XNOR2 (f2,c,d);
	xor XOR1 (s0,f1,f2);
endmodule

module TESTE;
	
	wire s0;
	reg a,b,c,d;

	saida0 Teste (s0,a,b,c,d);

 	initial begin
	   $display("\nRafael Moreira Melo-405834\n");
      $display("\na   b   c   d   s0\n");
      $monitor("%b + %b + %b + %b = %b", a, b, c, d, s0);
  
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
