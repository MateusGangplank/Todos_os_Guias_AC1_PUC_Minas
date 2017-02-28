// --------------------- 
// Exercicio0007
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
module notgate (output [7:0] s, input [7:0] p); 
	assign s = ~p + 1; 
endmodule //notgate  

module test_base_01; 
// ------------------------- definir dados 
      reg [7:0] a;
		wire[7:0] s;
		
		notgate NOT1(s,a);
// ------------------------- parte principal 
 initial begin 
       $display("Exercicio0007 - Marcio Enio G Dutra Junior - 441698"); 
       $display("Test number system"); 
		 
		 //C2 de 0000_0000 vai dar Overflow, por isso foi ignorado.
  	#1		a=8'b0000_0001;
	
		 $monitor("a = %8b = %8b",a, s);
	#1		a=8'b0000_0010;
	#1		a=8'b0000_0011;
	#1		a=8'b0000_0100;
	#1		a=8'b0000_0101;
	#1		a=8'b0000_0110;
	#1		a=8'b0000_0111;
	#1		a=8'b0000_1000;
	#1		a=8'b0000_1001;
	#1		a=8'b0000_1010;
	#1		a=8'b0000_1011;
	#1		a=8'b0000_1100;
	#1		a=8'b0000_1101;
	#1		a=8'b0000_1110;
	#1		a=8'b1111_1111;
 end 
 
endmodule // test_base