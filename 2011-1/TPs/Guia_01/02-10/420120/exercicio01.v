// Nome: Isabella de Paula Gonçales
// Matrícula: 420120

module metodonand ( s,e1,e2,e3 );

output s;
input e1,e2,e3;

assign s = ~(e1 & e2 & e3);

endmodule

module testnand;

reg e1,e2,e3;
wire s;

metodonand NAND1 ( s,e1,e2,e3 );

initial begin:start
      e1=0; e2=0; e3=0;
		
end

initial begin:main

   $display ("~(e1&e2&e3)");
#1 $display (" %b & %b & %b = %b ", e1,e2,e3,s);

#1 e1=0; e2=0; e3=1; 
#1 $display (" %b & %b & %b = %b ", e1,e2,e3,s);

#1 e1=0; e2=1; e3=0; 
#1 $display (" %b & %b & %b = %b ", e1,e2,e3,s);

#1 e1=0; e2=1; e3=1; 
#1 $display (" %b & %b & %b = %b ", e1,e2,e3,s);

#1 e1=1; e2=0; e3=0; 

#1  $display (" %b & %b & %b = %b ", e1,e2,e3,s);
#1  e1=1; e2=0; e3=1;

#1  $display (" %b & %b & %b = %b ", e1,e2,e3,s);
#1  e1=1; e2=1; e3=0;

#1  $display (" %b & %b & %b = %b ", e1,e2,e3,s);

#1  e1=1; e2=1; e3=1;
#1  $display (" %b & %b & %b = %b ", e1,e2,e3,s);



end

endmodule


/* resultado
  
    ~(e1&e2&e3)
     0 & 0 & 0 = 1 
     0 & 0 & 1 = 1 
     0 & 1 & 0 = 1 
     0 & 1 & 1 = 1 
     1 & 0 & 0 = 1 
     1 & 0 & 1 = 1 
     1 & 1 & 0 = 1 
     1 & 1 & 1 = 0 
    
     ----jGRASP: operation complete.
	  */
    