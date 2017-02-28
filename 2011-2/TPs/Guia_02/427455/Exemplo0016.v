// ------------------------- 
// Exemplo0016 E 
// Nome: Pedro Ballona 
// Matricula: 427455 
// ------------------------- 

// ------------------------- 
//  test number system 
// ------------------------- 
 
module testop; 
// ------------------------- definir dados 
      reg [2:0] a; 
      reg [4:0] b; 
      reg [5:0] c;
		
		
		reg [2:0] x; 
      reg [3:0] y; 
      reg [5:0] z;
		
		reg [6:0] q; 
      reg [2:0] w; 
      reg [4:0] e;
		
		reg [5:0] u; 
      reg [4:0] i; 
      reg [4:0] o;
		
		reg [2:0] f; 
      reg [3:0] g; 
      reg [3:0] h;
		reg [1:0] j;
		reg [5:0] k;
		


		
       
// ------------------------- parte principal 
 initial begin:start
      $display("Exemplo0016 - Pedro Ballona - 427455"); 
       
 
      a =   2; 
      b =  14;
		c = a+b; 
            
       
  		   
		$display("a) %b    +    %b  =  %b", a, b,c);
		
		
		x =   3; 
      y =  7;
		z = x*y; 
            
       
  		   
		$display("b) %b    *    %b  =  %b", x, y,z);
		
		
		q =   34; 
      w =  3;
		e = q/w; 
            
       
  		   
		$display("c) %b    /    %b  =  %b", q, w,e);
		
		
		u =   19; 
      i =   11;
		o = u - i; 
            
       
  		   
		$display("d) %b    -    %b  =  %b", u, i,o); 
		
		
		f =   2; 
      g =   4;
		h =   6;
		j =   1;
		k = f*(g+h-j); 
            
       
  		   
		$display("d) %b *( %b + %b - %b)  =  %b", f, g,h,j,k);    
       
 
       end 
 
endmodule // test_base