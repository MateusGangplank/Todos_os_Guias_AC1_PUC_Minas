// Nome: Isabella de Paula Gonçales
// Matrícula: 420120


module metodoxnor ( s,e1,e2,e3,e4 );

output s;
input e1,e2,e3,e4;

assign s = ( ~(e1^e2^e3^e4) );

endmodule

module testxnor;

reg e1,e2,e3,e4;
wire s;

metodoxnor XNOR1 ( s,e1,e2,e3,e4 );

initial begin: start
       e1=0; e2=0; e3=0; e4=0;
		 
end

initial begin: main
   $display (" ( ~(e1^e2^e3^e4) )");
#1 $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s ); 

#1 e1=0; e2=0; e3=0; e4=1; 
#1 $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1 e1=0; e2=0; e3=1; e4=0;
#1 $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1 e1=0; e2=0; e3=1; e4=1;
#1 $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=0; e2=1; e3=0; e4=0;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=0; e2=1; e3=0; e4=1;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=0; e2=1; e3=1; e4=0;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=0; e2=1; e3=1; e4=1;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=0; e3=0; e4=0;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=0; e3=0; e4=1;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=0; e3=1; e4=0;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=0; e3=1; e4=1;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=1; e3=0; e4=0;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=1; e3=0; e4=1;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=1; e3=0; e4=1;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=1; e3=1; e4=0;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);

#1  e1=1; e2=1; e3=1; e4=1;
#1  $display (" %b | %b | %b | %b = %b ", e1,e2,e3,e4,s);


end

endmodule


/* Registrando os Resultados
  
     ( ~(e1^e2^e3^e4) )
     0 | 0 | 0 | 0 = 1 
     0 | 0 | 0 | 1 = 0 
     0 | 0 | 1 | 0 = 0 
     0 | 0 | 1 | 1 = 1 
     0 | 1 | 0 | 0 = 0 
     0 | 1 | 0 | 1 = 1 
     0 | 1 | 1 | 0 = 1 
     0 | 1 | 1 | 1 = 0 
     1 | 0 | 0 | 0 = 0 
     1 | 0 | 0 | 1 = 1 
     1 | 0 | 1 | 0 = 1 
     1 | 0 | 1 | 1 = 0 
     1 | 1 | 0 | 0 = 1 
     1 | 1 | 0 | 1 = 0 
     1 | 1 | 0 | 1 = 0 
     1 | 1 | 1 | 0 = 0 
     1 | 1 | 1 | 1 = 1 
    
     ----jGRASP: operation complete.
    
*/