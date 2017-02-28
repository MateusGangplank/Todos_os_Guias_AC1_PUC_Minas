// ------------------------- 
// Exercicios04 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
   reg [7:0] a; 
   reg [6:0] b; 
   reg [5:0] c; 
   reg [4:0] d;
   reg [7:0] e;
// ------------------------- parte principal 
initial begin 
    $display("Exercicios04 - Milton costa teles da silva - 002751"); 
    $display("Test number system");  
	 a = 6'b101011; 
    b = 5'b11011; 
    c = 27; 
    d = 6'hC; 
    e = 5'o21; 
	 $display("%8b[2] = %8b", a, (~a) + 1'b1);
	 $display("%7b[2] = %7b", b, (~b) + 1'b1);
	 $display("%2d[10] = %6b = %6b", c,c, (~c) + 1'b1);
	 $display("%h[16] = %5b = %5b", d,d, (~d) + 1'b1);
	 $display("%2o[8] = %8b = %8b",e,e, (~e) + 1'b1);

	 	 
end
endmodule // test_base 