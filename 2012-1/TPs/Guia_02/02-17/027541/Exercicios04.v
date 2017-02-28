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
	 a = 6'b101010; 
    b = 5'b11011; 
    c = 23; 
    d = 6'he; 
    e = 5'o26; 
	 $display("a = %d = %b", a, a); 
    $display("b = %d = %b", b, b); 
    $display("c = %d = %b", c, c); 
    $display("d = %d = %b", d, d); 
    $display("e = %d = %b", e, e); 
	 
	 $display("a = %d = %b", a, ~a + 1'b1 ); 
    $display("b = %d = %b", b, ~b + 1'b1 ); 
    $display("c = %d = %b", c, ~c + 1'b1 );
	 $display("d = %d = %b", a, ~d + 1'b1 ); 
    $display("e = %d = %b", b, ~e + 1'b1 );
	 	 
end
endmodule // test_base 