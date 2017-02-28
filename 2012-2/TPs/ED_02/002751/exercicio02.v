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
	 a = 6'b101010 + 5'b11011; 
    b = 5'b11011  + 5'o25; 
    c = 10'o1234 / 6'h3C; 
    d = 9'h1BA - 9'b101110001; 
    e = 25 * 5'o32 + 7'h7A; 
	 $display("a = 101010(2) + 11011(2) = %b" , a); 
    $display("b = 11011(2) + 25(8) = %b" , b); 
    $display("c = 1234(8) / 3C(16) = %b" , c); 
    $display("d = 1BA(16) – 101110001(2) = %b" , d); 
    $display("e = 25 * 32(8) + 7A(16) = %b" , e);  
end 
endmodule // test_base