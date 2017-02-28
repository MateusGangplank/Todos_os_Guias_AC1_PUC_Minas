// ------------------------- 
// Exercicios03 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
   reg [5:0] a; 
   reg [4:0] b; 
   reg [4:0] c; 
   reg [5:0] d;
   reg [4:0] e;
// ------------------------- parte principal 
initial begin 
    $display("Exercicios03 - Milton costa teles da silva - 002751"); 
    $display("Test number system");  
	 a = 6'b100110; 
    b = 5'o24; 
    c = 25; 
    d = 6'h2D; 
    e = 27 - 37; 
	 $display("a = 100110(2) = %6b = %b", a, ~a + 1'b1); 
    $display("b = 24(8)  = %5b = %5b", b, ~b + 1'b1); 
    $display("c = 25(10) = %5b = %5b", c, ~c + 1'b1); 
    $display("d = 2D(16) = %6b = %6b", d, ~d + 1'b1); 
    $display("e = 27 - 37 = %5b = %5b", e,  ~e + 1'b1); 
	 	 
end
endmodule // test_base 