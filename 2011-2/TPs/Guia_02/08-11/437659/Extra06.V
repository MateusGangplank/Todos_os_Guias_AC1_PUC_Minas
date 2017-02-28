// ------------------------- 
// Extra06 - Complemento de 1 extra 06
// Nome: Debora Amaral Chaves 
// Matricula: 437659 
// ------------------------- 
module complementoDeUm(output [7:0]s, input [7:0]p);
	assign s = ~p; //complemento de 1, notgate bit a bit
endmodule
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [7:0] a; 
		wire [7:0] s;
		complementoDeUm c1(s,a); 
		
 initial 
	begin
		a = 6'b1011; 
	end
// ------------------------- parte principal 
 initial 
 	begin 
      $display("Extra06 - Debora Amaral Chaves - 437659"); 
      $display("Complementos de 1 "); 
		
		#1 $display("Complemento de 1 de %b(2) = %b(2)",a,s);
 	// Testes
      #1 a = 6'b1100;
	   $display("Complemento de 1 de %b(2) = %b(2)",a,s); 


	end 
	
	

 
endmodule // test_base

    // Extra06 - Debora Amaral Chaves - 437659
    // Complementos de 1 
    // Complemento de 1 de 00001011(2) = 11110100(2)
    // Complemento de 1 de 00001100(2) = 11110100(2) -- Não funcionou