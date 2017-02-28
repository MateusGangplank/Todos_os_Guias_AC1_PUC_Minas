//-----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773
//-----------------------------

//-----------------------------
//------ GUIA 03 - 01----------
//-----------------------------


module meiaSoma(s0 ,s1 ,a ,b);

	output s0, s1;
	input  a, b;
		
	xor XOR1 (s0, a, b);              // NAO ERA O MODELO COMPACTO
	and AND1 (s1, a, b);
	

	
endmodule // fim do modulo


module TestemeiaSoma;

	reg a, b ;
	wire s0, s1;
	
	//instancia
	meiaSoma SOMA1 (s0, s1, a, b);
	
	
 	initial begin:start
      a = 0; b = 0;
 	end

          // parte principal
 	initial begin:main
      $display("Guia 03 - 01 - Silvino Henrique Santos de Souza - 412773");
      $display("MEIA SOMA");
      $display("\nA + B = S\n");
      $monitor("%b + %b  = %b %b ", a , b ,s1 ,s0);
  #1  a = 0; b = 1;
  #1  a = 1; b = 0;  
  #1  a = 1; b = 1;
 	end
endmodule // fim main

/*Guia 03 - 01 - Silvino Henrique Santos de Souza - 412773
    MEIA SOMA
    
    A + B = S
    
    0 + 0  = 0 0 
    0 + 1  = 0 1 
    1 + 0  = 0 1 
    1 + 1  = 1 0*/