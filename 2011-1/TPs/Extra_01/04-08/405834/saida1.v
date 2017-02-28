
module saida1 (s1,a,b,c,d);
	output s1;
	input a,b,c,d;
	wire f1,f2,f3,f4,g1,g2,g3,g4;
	
	xor XOR1 (f1,a,c);
	xor XOR2 (f2,b,c);
	xor XOR3 (f3,a,b);
	xor XOR4 (f4,b,d);
	
	and AND1 (g1,d,f1);
	and AND2 (g2,d,f2);
	and AND3 (g3,c,f3);
	and AND4 (g4,a,f4);
	
	or OR1 (s1,g1,g2,g3,g4);
endmodule

module TESTE;
	
	wire s1;
	reg a,b,c,d;

	saida1 Teste (s1,a,b,c,d);

 	initial begin
	   $display("\nRafael Moreira Melo-405834\n");
      $display("\na   b   c   d   s1\n");
      $monitor("%b + %b + %b + %b = %b", a, b, c, d, s1);
  
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

