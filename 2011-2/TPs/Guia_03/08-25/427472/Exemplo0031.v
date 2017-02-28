// -------------------------
// Exemplo0031 
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 
   module f4 (output [7:0] s,
              input  [3:0] a, 
              input  [3:0] b); 
				  
// Cálculo da OR
	assign s[0] = ( a[0] | b[0] );
	assign s[1] = ( a[1] | b[1] );
	assign s[2] = ( a[2] | b[2] );
	assign s[3] = ( a[3] | b[3] );
	
// Cálculo da AND
 	assign s[4] = ( a[0] & b[0] );
	assign s[5] = ( a[1] & b[1] );
	assign s[6] = ( a[2] & b[2] );
	assign s[7] = ( a[3] & b[3] );

   endmodule // f4 

   module test_f4; 
// ------------------------- definir dados 
   reg  [3:0] x; 
   reg  [3:0] y; 
   wire [7:0] s; // Saída do resultado
		
   f4 modulo (s, x, y); 

// ------------------------- parte principal 

   initial begin 
     $display("Exemplo0031 - Wender Zacarias Xavier - 427472"); 
     $display("Test LU's module"); 
    x = 4'b0011;        y = 4'b0101; 

// Mostrar resultados
	$display("  **** Resultado **** ");
	$monitor (" OR gate = %3b | %3b =  %4b \n AND gate = %3b & %3b = %4b", x,y,s[3:0],x,y,s[7:4]);
#1 x = 4'b0111;   y = 4'b0001;
#1 x = 4'b0001;	y = 4'b1001;
   end 

endmodule // test_f4 


/**
 TESTE 01 = (OK)
 **** Resultado **** 
     OR gate = 0011 | 0101 =  0111 
     AND gate = 0011 & 0101 = 0001
     OR gate = 0111 | 0001 =  0111 
     AND gate = 0111 & 0001 = 0001
     OR gate = 0001 | 1001 =  1001 
     AND gate = 0001 & 1001 = 0001
     
     */