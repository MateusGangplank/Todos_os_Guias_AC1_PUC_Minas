// Nome: Isabella Gonšales
// MatrÝcula: 420120


module metodonandor (s,e1,e2,e3);

output s;
input  e1,e2,e3;

assign s = ~(e1 & e2 & e3);

endmodule



module testnandor;

reg e1,e2,e3;
wire s1,s2,s3,s;
                                     // SE POSSIVEL, DEFINIR EM OUTRO MODULO
metodonandor NANDOR1 ( s1,e1,e1,e1 );
metodonandor NANDOR2 ( s2,e2,e2,e2 );
metodonandor NANDOR3 ( s3,e3,e3,e3 );
metodonandor NANDOR4 ( s,s1,s2,s3 );


initial begin:start
      e1=0; e2=0; e3=0;
		
end

initial begin:main

   #1 $display (" Tabela verdade da porta OR com 3 entradas utilizando portas NAND ");
   #1 $display (" e1 | e2 | e3 = s ");
	
	$monitor (" %b & %b & %b = %b ", e1,e2,e3,s);
	   #1 e1=0;    e2=0;    e3=1;
      #1 e1=0;    e2=1;    e3=0;
      #1 e1=0;    e2=1;    e3=1;
		#1 e1=1;    e2=0;    e3=0;
		#1 e1=1;    e2=0;    e3=1;
		#1 e1=1;    e2=1;    e3=0;
		#1 e1=1;    e2=1;    e3=1;

	
end

endmodule

/*

   
     Tabela verdade da porta OR com 3 entradas utilizando portas NAND 
     e1 | e2 | e3 = s )
     0 & 0 = 0 0
     0 & 0 = 1 1
     0 & 1 = 0 1
     0 & 1 = 1 1
     1 & 0 = 0 1
     1 & 0 = 1 1
     1 & 1 = 0 1
     1 & 1 = 1 1
    
     ----jGRASP: operation complete.
    */


