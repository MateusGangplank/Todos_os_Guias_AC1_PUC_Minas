// Nome: Isabella Gonçales
// Matrícula: 420120


module metodonandnor (s4,e1,e2,e3);

output s4;
input  e1,e2,e3;

assign s4 = ( ~ (e1 & e2 & e3 ) );

endmodule



module testnandnor;

reg e1,e2,e3;
wire s1,s,s2,s3,s4;


   metodonandnor NANDNOR1 ( s1,e1,e1,e1 );
	metodonandnor NANDNOR2 ( s,e2,e2,e2 );
	metodonandnor NANDNOR3 ( s2,e3,e3,e3 );
	metodonandnor NANDNOR4 ( s3,s1,s,s2 );
	metodonandnor NANDNOR5 ( s4,s3,s3,s3 );



initial begin:start
     e1= 0; e2=0; e3=0;
		
end

initial begin: main

   #1 $display (" Tabela verdade da porta NAND com 3 entradas utilizando portas NOR ");
   #1 $display ("  ~ (e1 & e2 & e3 )  =  s ");
	
	$monitor (" %b & %b & %b = %b", e1,e2,e3,s4 );   
   #1 e1 = 0; e2 = 0; e3 = 1;
	#1 e1 = 0; e2 = 1; e3 = 0;
	#1 e1 = 0; e2 = 1; e3 = 1;
	#1 e1 = 1; e2 = 0; e3 = 0;
	#1 e1 = 1; e2 = 0; e3 = 1;
	#1 e1 = 1; e2 = 1; e3 = 0;
	#1 e1 = 1; e2 = 1; e3 = 1;  

	
end

endmodule





/* Registrando os dados

    Tabela verdade da porta NOR com 3 entradas utilizando portas NAND 
      ~ (e1 & e2 & e3 )  =  s 
     0 & 0 & 0 = 1
     0 & 0 & 1 = 0
     0 & 1 & 0 = 0
     0 & 1 & 1 = 0
     1 & 0 & 0 = 0
     1 & 0 & 1 = 0
     1 & 1 & 0 = 0
     1 & 1 & 1 = 0
    
     ----jGRASP: operation complete.
 */




