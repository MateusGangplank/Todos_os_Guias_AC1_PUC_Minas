// ------------------------- 
// Exercicios05 -  BASE 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
   reg [7:0] a,b,c,d,e; 

// ------------------------- parte principal 
initial begin 
    $display("Exercicios02 - Milton costa teles da silva - 002751"); 
    $display("Test number system");  
	 a = 6'b101010 - 4'b1001; 
    b = 8'b11011  - 8'o15; 
    c = 8'o34  - 8'hC; 
    d = 8'hDA - 8'b10111001; 
    e = 8'd27 - 8'h1B; 
	 $display("a = 101010(2) - 1001(2) = %8b = %8b", a,(~a) + 1'b1); 
    $display("b = 11011(2) - 15(8) = %8b = %8b",b,(~b) + 1'b1); 
    $display("c = 34(8) - C(16) = %8b = %8b",c,(~c) + 1'b1); 
    $display("d = DA(16) - 10111001(2) = %8b = %8b",d,(~d) + 1'b1); 
    $display("e = 27 - 1B(16) = %8b = %8b",e,(~e) + 1'b1);  
end 
endmodule // test_base