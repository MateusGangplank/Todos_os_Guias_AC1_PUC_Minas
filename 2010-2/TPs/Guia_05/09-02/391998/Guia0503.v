// Nome: Andre Sulivam 391998
// Guia 05 ex03

module MeiaSoma (s1,s0,a,b);
output s1,s0;
input a,b;
	
	xor XOR1 (s0,a,b);
	and AND1 (s1,a,b);

endmodule // end MeiaSoma



module SomaCompleta (s1,s0,a,b,c);
output s1,s0;
input a,b,c;

	MeiaSoma MS1 (s2,s3,a,b);
	MeiaSoma MS2 (s4,s0,s3,c);
	or OR1 (s1,s2,s4);
	
	endmodule // end SomaCompleta



module ProdutoCompleto (s0,s1,s2,s3,a0,a1,b0,b1,e);
output s0,s1,s2,s3;
input a0,a1,b0,b1,e;
wire c1,c2,c3;

	and AND1 (c1,b1,a0);
	and AND2 (c2,b1,a1);
	and AND3 (c3,a1,b0);
	and AND4 (s0,a0,b0);


SomaCompleta SC (se,s1,c3,c1,e);
SomaCompleta SC2 (s3,s2,c2,e,se);

endmodule // end module ProdutoCompleto



module testProduto;
 reg  a0,a1,b0,b1,e;
  wire s0,s1,s2,s3;
  

ProdutoCompleto PD1 (s0,s1,s2,s3,a0,a1,b0,b1,e);

 
 initial begin
      
		a0=0; a1=0; b0=0; b1=0; e=0;

end
     
	  
 initial begin
     
	   $display("Andre Sulivam 391998");
      $display("Guia 05 Ex:03");
      $display("Produto completo - 2 bits");
		
      $monitor("%b %b x %b %b = %b %b %b %b",a1,a0,b1,b0,s3,s2,s1,s0 );
  		
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