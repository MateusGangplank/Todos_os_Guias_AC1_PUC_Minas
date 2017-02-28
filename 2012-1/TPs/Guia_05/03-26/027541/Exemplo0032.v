 // ------------------------- 
// Exemplo0032 - F4 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s0, 
            input [3:0] a, 
            input [3:0] b,
				input [3:0] c); 
//--descrever por portas 
   assign s0 = ((a & b)& c) | ((a | b) & ~c);	

endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   reg [3:0] a; 
   reg [3:0] b;
	reg [3:0] c;
	wire [3:0]s0;  
   
f4 modulo (s0, a, b, c); 
// ------------------------- parte principal 
   initial begin 
	
	$display("Exemplo0032 - Milton costa teles da silva-002751"); 
	$display("Test LU's module"); 
	a = 4'b0011; b = 4'b0101; c = 0; 
//--projetar testes do modulo
   #1 $display("\n%3b  %3b %b= %3b",a,b,c,s0);
  end      
endmodule // test_f4