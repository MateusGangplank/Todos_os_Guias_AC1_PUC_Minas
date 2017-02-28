 // ------------------------- 
// Exemplo0031 - F4 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s1,output [3:0] s2, 
            input [3:0] a, 
            input [3:0] b); 
//--descrever por portas 
   assign s1[3:0] = (a & b);
	assign s2[3:0] = a | b;

endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   reg [3:0] a; 
   reg [3:0] b; 
   wire [3:0] s1;
	wire [3:0] s2; 
f4 modulo (s1,s2, a, b); 
// ------------------------- parte principal 
   initial begin 
	
	$display("Exemplo0031 - Milton costa teles da silva-002751"); 
	$display("Test LU's module"); 
	a = 4'b0011; b = 4'b0101; 
//--projetar testes do modulo
   #1 $display("\n%3b  %3b = %3b %3b",a,b,s1,s2);
  end      
  
endmodule // test_f4 
 