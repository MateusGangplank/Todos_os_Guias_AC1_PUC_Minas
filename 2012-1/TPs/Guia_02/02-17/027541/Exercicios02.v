// ------------------------- 
// Exercicios02 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
   reg [6:0] a; 
   reg [5:0] b; 
   reg [3:0] c; 
   reg [6:0] d;
   reg [9:0] e;
// ------------------------- parte principal 
initial begin 
    $display("Exercicios02 - Milton costa teles da silva - 002751"); 
    $display("Test number system");  
	 a = 6'b101010 + 5'b11010; 
    b = 5'b11010  + 5'o25; 
    c = 10'o1234 / 6'h2B; 
    d = 9'h1CA - 9'b101110001; 
    e = 25 * 5'o31 + 7'h7A; 
	 $display("a = %d = %b", a, a); 
    $display("b = %d = %b", b, b); 
    $display("c = %d = %b", c, c); 
    $display("d = %d = %b", d, d); 
    $display("e = %d = %b", e, e);  
end 
endmodule // test_base