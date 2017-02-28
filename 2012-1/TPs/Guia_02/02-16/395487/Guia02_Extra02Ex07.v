// --------------------------------------- 
// Guia 02 - Extra 02 - Exercicio 07
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------------
// ----------------------------
// -- calculo complemento de 2
// ----------------------------

module calculoComplemento2 (saida, entrada);
 output [0:7] saida;
 input [0:7] entrada;
 wire [0:7] temp;
 
 assign temp = ~entrada;
 assign saida = temp + 1'b1;
 
 
endmodule //-- calculoComplemento2

// --------------------------------
// -- Testando calculoComplemento2
// --------------------------------

module testcalculoComplemento2;
 reg   [0:7] entrada1;
 wire  [0:7] saida1;
 
          //-- instancia
 calculoComplemento2 COMPLEMENTO2 (saida1, entrada1);
          
			 //-- parte principal
 initial begin
      entrada1 = 8'b00000001; //-- byte 
		
      $display("Guia 02 - Extra 01 - Exercicio 07 - Alvaro Henrique de Araujo Rungue - 395487");
      
		$display("\nTeste do Modulo que Calcula complemento de 2:");
		
      $display("\n\n\nByte		Complemento de 2\n");
		
		$monitor("%b        %b", entrada1 , saida1);
		
 #1   entrada1 = 8'b00000010; //-- byte
 #1   entrada1 = 8'b00000100; //-- byte   
 #1   entrada1 = 8'b00001000; //-- byte 
 #1   entrada1 = 8'b00010000; //-- byte  
 #1   entrada1 = 8'b00100000; //-- byte 
 #1   entrada1 = 8'b01000000; //-- byte 
 #1   entrada1 = 8'b10000000; //-- byte 
 #1   entrada1 = 8'b11111111; //-- byte 
 #1   entrada1 = 8'b00000000; //-- byte 
 
 end

endmodule // testmodule