// Nome: Isabella Gonçales
// Matrícula: 420120


module metodonandnot (s,e1,e2,e3);

output s;
input  e1,e2,e3;

assign s = ( ~(e1 & e2 & e3) );

endmodule



module testnandnot;

reg e4;
wire s;

metodonandnot NANDNOT1 ( s,e4,e4,e4 );


initial begin:start
     e4 = 0;
		
end

initial begin: main

   #1 $display (" Tabela verdade da porta NOR com 3 entradas utilizando portas NAND ");
   #1 $display ("  ~(e1 & e2 & e3)  =  s ");
	
	$monitor (" %b = %b", e4,s );   
     

	
end

endmodule




/* registrando os resultados

 Tabela verdade da porta NOR com 3 entradas utilizando portas NAND 
      ~(e1 & e2 & e3)  =  s 
     0 = 1
    
     ----jGRASP: operation complete.
*/