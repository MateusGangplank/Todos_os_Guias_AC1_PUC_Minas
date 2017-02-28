// -------------------------
// Exemplo0021 – FULL ADDER 
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// -------------------------


// -------------------------
//  full adder 
// ------------------------- 
module fullAdder (output [5:0]s,output [5:0]s1,output [5:0]s2, output [5:0]s3,   
                               input [5:0]a,  
                               input [5:0]b,  
                               input carryIn); 


endmodule // fullAdder 
 
module test_fullAdder; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y; 
      reg  carry; 
      wire [5:0] soma; 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Felipe Ferreira Andrade do Carmo - 427402");
      $display("Test ALU’s full adder"); 
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_fullAdder