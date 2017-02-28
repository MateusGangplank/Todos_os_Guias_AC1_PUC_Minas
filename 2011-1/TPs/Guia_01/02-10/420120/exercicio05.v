// Nome: Isabella de Paula Gonçales
// Matrícula: 420120


// ** EXTRA **


module metodoxor ( s,e1,e2 );

output s;
input e1,e2;

assign s = ( (~e1 & e2 | e1 & ~e2) );

endmodule

module testxor;

reg e1,e2;
wire s;

metodoxor XOR1 ( s,e1,e2 );

initial begin: start
       e1=0; e2=0;
		 
end

initial begin: main
   $display (" ( (~e1 & e2 | e1 & ~e2) ) ");
#1 $display (" %b | %b | %b | %b = %b ", ~e1,e2,e1,~e2,s ); 

#1 e1=0; e2=1; 
#1 $display (" %b | %b | %b | %b = %b ", ~e1,e2,e1,~e2,s);

#1 e1=1; e2=0;
#1 $display (" %b | %b | %b | %b = %b ", ~e1,e2,e1,~e2,s);

#1 e1=1; e2=1;
#1 $display (" %b | %b | %b | %b = %b ", ~e1,e2,e1,~e2,s);


end

endmodule

/* Registrando os Resultados 

   
     ( (~e1 & e2 | e1 & ~e2) ) 
     1 | 0 | 0 | 1 = 0 
     1 | 1 | 0 | 0 = 1 
     0 | 0 | 1 | 1 = 1 
     0 | 1 | 1 | 0 = 0 
    
     ----jGRASP: operation complete.
    

*/


