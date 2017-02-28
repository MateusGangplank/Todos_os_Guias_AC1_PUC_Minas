// ------------------------- 
// Exemplo0018  
// Nome: Pedro Ballona 
// Matricula: 427455 
// ------------------------- 

// ------------------------- 
//  test number system 
// ------------------------- 
 
module testop; 
// ------------------------- definir dados 
      reg [6:0] a; 
      reg [6:0] b; 
      
		
		
		reg [6:0] x; 
      reg [6:0] y; 
      
		
		reg [4:0] q; 
      reg [4:0] w; 
     
		
		reg [5:0] u; 
      reg [5:0] i; 
      
		
		reg [6:0] f; 
      reg [5:0] g; 
      reg [4:0] k;		


		
       
// ------------------------- parte principal 
 initial begin:start
      $display("Exemplo0018 - Pedro Ballona - 427455"); 
       
 
      a =   39; 
      b =  ~a+1;
		
            
       
  		   
		$display("a) -(%b(2))= %b(2) ", a, b);
		
		
		
      x =   44; 
      y =  ~x+1;
		
            
       
  		   
		$display("b) -(%o(8))= %b(2) ", x, y);
		
		
		q =   13; 
      w =  ~q+1;
		
            
       
  		   
		$display("c) -(%d(10))= %b(2) ", q, w);
		
		
		q =   13; 
      w =  ~q+1;
		
            
       
  		   
		$display("c) -(%d(10))= %b(2) ", q, w);
		
		
		u =   27; 
      i =  ~u+1;
		
            
       
  		   
		$display("d) -(%h(16))= %b(2) ", u, i);
		
		
		f =   36; 
      g =  25;
		k = ~(f-g)+1;
		
            
       
  		   
		$display("e) -(%d(10) - %d(10) )= %b(2) ", g, f , k);




		

		
		
		    
       
 
       end 
 
endmodule // test_base