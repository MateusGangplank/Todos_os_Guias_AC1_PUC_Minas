// ------------------------- 
// Exemplo0014 - AND 
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// -- and gate 
// ------------------------- 
      module and0gate ( output s, input p, q); 
			 assign s = p & q; 
       endmodule // and0gate 


       module andgate ( output s, input p, q, r); 
		    wire s1;
			 
			 and0gate AND1(s1, p, q);
			 and0gate AND2(s, s1, r);

       endmodule // andgate 

// --------------------- 
// -- test and gate 
// --------------------- 

       module testandgate; 

// ------------------------- dados locais 
       
		 reg a, b, c; // definir registradores 
       wire s; // definir conexao (fio) 

// ------------------------- instancia 
 
       andgate AND1 (s, a, b, c); 

// ------------------------- preparacao 
     
	    initial begin:start 
            a=0; b=0; c=0;
           end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0014 - Michelle da Costa Silva - 427448"); 
                $display("\nTabela-verdade AND"); 
                $display("\na b c s\n"); 
                  a=0; b=0; c=0;
             #1 $display("%b %b %b %b", a, b, c, s); 
                  a=0; b=1; c=0;
             #1 $display("%b %b %b %b", a, b, c, s); 
                  a=1; b=0; c=0;
				 #1 $display("%b %b %b %b", a, b, c, s); 
                  a=0; b=0; c=1;
             #1 $display("%b %b %b %b", a, b, c, s); 
                  a=1; b=0; c=1;
				 #1 $display("%b %b %b %b", a, b, c, s); 
                  a=0; b=1; c=1;
				 #1 $display("%b %b %b %b", a, b, c, s); 
                  a=1; b=1; c=0;						
             #1 $display("%b %b %b %b", a, b, c, s); 
                  a=1; b=1; c=1;
             #1 $display("%b %b %b %b", a, b, c, s);  
			   end 
     endmodule // testandgate 