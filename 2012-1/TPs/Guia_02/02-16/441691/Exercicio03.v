// ------------------------- 
// Exercicio03 - BASE 
// Nome: Gabriel Luiz Marquezini Gonçalves Vieira 
// Matricula: 441691 
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
$display("Exercicio03 - Gabriel Luiz Marquezini Gonçalves Vieira - 441691"); 
$display("Test number system"); 
a = 'b100111; 
b = 'o23; 
c = 23;
d = 'h2B; 
e = 26;
a=~a+1'b1; 
b=~b+1'b1;
c=~c+1'b1;
d=~d+1'b1;
e=e+(~36+1'b1);
$display("\nResults"); 
$display("a = %d = %b", a, a);  
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
end 
endmodule // test_base 
