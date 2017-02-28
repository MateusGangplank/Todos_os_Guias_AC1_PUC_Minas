//--Felipe Pacífico -- 389868
//--Guia 0503

module MeiaSoma (o1,o0,a,b);
output o1,o0;
input a,b;
	
	xor XOR1 (o0,a,b);
	and AND1 (o1,a,b);

endmodule //--end MeiaSoma



module SomaCompleta (o1,o0,a,b,c);
output o1,o0;
input a,b,c;

	MeiaSoma MS1 (o2,o3,a,b);
	MeiaSoma MS2 (o4,o0,o3,c);
	or OR1 (o1,o2,o4);
	
	endmodule //--end SomaCompleta



module ProdutoCompleto (o0,o1,o2,o3,a0,a1,b0,b1,e);
output o0,o1,o2,o3;
input a0,a1,b0,b1,e;
wire c1,c2,c3;

	and AND1 (c1,b1,a0);
	and AND2 (c2,b1,a1);
	and AND3 (c3,a1,b0);
	and AND4 (o0,a0,b0);


SomaCompleta SC (se,o1,c3,c1,e);
SomaCompleta SC2 (o3,o2,c2,e,se);

endmodule //--end module ProdutoCompleto



module testProduto;
 reg  a0,a1,b0,b1,e;
  wire o0,o1,o2,o3;
  

ProdutoCompleto PD1 (o0,o1,o2,o3,a0,a1,b0,b1,e);

 
 initial begin
      
		a0=0; a1=0; b0=0; b1=0; e=0;

end
     
	  
 initial begin
     
	   $display("Felipe Pacifico -- 389868");
      $display("Guia 0503");
      $display("Produto completo - 2 bits");
		
      $monitor("%b %b x %b %b = %b %b %b %b",a1,a0,b1,b0,o3,o2,o1,o0 );
  		
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