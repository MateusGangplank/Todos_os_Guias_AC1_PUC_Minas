module not_switch (output out,input in); 
                    
        
    supply1 power;              
    supply0 ground;             
        
    pmos (out, power, in);      
    nmos (out, ground, in);     
      
    endmodule 
	
	module test_switch;
	
	reg x;
	wire z;
	
	not_switch NS(z,x);
	
	initial begin:main
	
	  $monitor("%1b",x);
	  
	 #1 x=1'b0;
		 
	  end
	  endmodule