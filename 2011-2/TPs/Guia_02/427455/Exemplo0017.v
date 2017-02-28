// ------------------------- 
// Exemplo0017 
// Nome: Pedro Ballona 
// Matricula: 427455 
// ------------------------- 

// ------------------------- 
//  test number system 
// ------------------------- 
 
module testop; 
// ------------------------- definir dados 
      reg [6:0] a; 
      reg [5:0] b; 
      reg [6:0] c;
		
		
		reg [5:0] x; 
      reg [5:0] y; 
      reg [6:0] z;
		
		reg [10:0] q; 
      reg [6:0] w; 
      reg [4:0] e;
		
		reg [9:0] u; 
      reg [9:0] i; 
      reg [7:0] o;
		
		reg [5:0] f; 
      reg [5:0] g; 
      reg [7:0] h;
		reg [11:0] j;
		
		


		
       
// ------------------------- parte principal 
 initial begin:start
      $display("Exemplo0017 - Pedro Ballona - 427455"); 
      
 
      a =   34; 
      b =  26;
		c = a+b; 
            
       
  		   
		$display("a) %b(2)    +    %b(2)  =  %b(2)", a, b,c);
		
		
		x =   26; 
      y =  19;
		z = x+y; 
            
       
  		   
		$display("b) %b(2)    +    %o(8)  =  %b(2)", x, y,z);
		
		
		q =   668; 
      w =  45;
		e = q/w; 
            
       
  		   
		$display("c) %o(8)    /    %h(16)  =  %b(2)", q, w,e);
		
		
		u =   425; 
      i =   361;
		o = u - i; 
            
       
  		   
		$display("d) %h(16)    -    %b(2)  =  %b(2)", u, i,o); 
		
		
		f =   25; 
      g =   33;
		h =   107;
		j =   f*(g + h);
		 
            
       
  		   
		$display("d) %d(10) *( %o(8) + %h(16) )  =  %b", f, g,h,j);    
       
 
       end 
 
endmodule // test_base