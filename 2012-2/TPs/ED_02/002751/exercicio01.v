// ------------------------- 
// Exercicios01 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
   reg [4:0] a; 
   reg [4:0] b; 
   reg [3:0] c; 
   reg [3:0] d;
   reg [4:0] e;
// ------------------------- parte principal 
initial begin 
    $display("Exercicios01 - Milton costa teles da silva - 002751"); 
    $display("Test number system");  
	 a = 2 + 14; 
    b = 3 * 9 ;
    c = 32 / 5; 
    d = 24 - 11 ;
    e = 2 * 6 + 7 - 1 ; 
	 $display("a = 2 + 14 = %b", a); 
    $display("b = 3 * 9 = %b", b); 
    $display("c = 32 / 5 = %b", c); 
    $display("d = 24 - 11 = %b", d); 
    $display("e =  2 * 6 + 7 - 1 = %b", e);  
end 
endmodule // test_base