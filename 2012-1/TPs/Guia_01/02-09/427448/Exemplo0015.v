// ------------------------- 
// Exemplo0015 - OR 
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// -- or gate 
// ------------------------- 
     module or0gate ( output s, input p, q); 
			assign s = p | q; 
      endmodule // or0gate 


      module orgate ( output s, input p, q, r); 
          wire s1;
			 
			 or0gate OR1(s1, p, q);
			 or0gate OR2(s, s1, r);
			 
      endmodule // orgate 

// --------------------- 
// -- test or gate 
// --------------------- 

      module testorgate; 

// ------------------------- dados locais 

      reg a, b, c; // definir registradores 
      wire s; // definir conexao (fio) 

// ------------------------- instancia 
     
	   orgate OR1 (s, a, b, c); 

// ------------------------- preparacao 

     initial begin:start 
        a=0; b=0; c=0;
      end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0015 - Michelle da Costa Silva - 427448"); 
                $display("\nTabela-verdade OR"); 
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
   endmodule // testorgate 