 
// ------------------------- 
// Exemplo0041 – FULL ADDER 
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  full adder 
// ------------------------- 
module fullAdder (output s,  
                               input a,  
                               input b,  
                               input carryIn); 
 
// descrever por portas

 
endmodule // fullAdder 
 
module test_fullAdder; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y; 
      reg  carry; 
      wire [5:0] soma; 
		
	initial begin
	
	x= 6'b111111;
	y= 6'b000000;	
	carry=1'b1; 
	end
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test ALU’s full adder"); 
 
 // projetar testes do somador complete 
 
 $monitor("x=%6b  y=%6b carry=%1b  soma=%6b" , x,y,carry,soma);

 
 end 
 
endmodule // test_fullAdder 
 