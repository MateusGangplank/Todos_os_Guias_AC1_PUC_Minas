// --------------------- 
// Exercicio02-05
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
 module teste_com_numeros; 
// ------------------------- definir dados 
reg [8:0] a; 
reg [8:0] b; 
reg [8:0] c; 

initial begin
a = 8'b101010;
b = 8'b1101;
c = a+(~b)+1;
$display(" "); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display(" a - b = c"); 
$display("c = %d = %b", c, c); 
$display("b = %d = %b", ~b, ~b); 

a = 8'b11010;
b = 8'o15;
c = a+(~b)+1;
$display(" "); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display(" a - b = c"); 
$display("c = %d = %b", c, c); 

a = 8'o34;
b = 8'hB;
c = a+(~b)+1;
$display(" "); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display(" a - b = c"); 
$display("c = %d = %b", c, c); 

a = 8'hCA;
b = 8'b10111001;
c = a+(~b)+1;
$display(" "); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display(" a - b = c"); 
$display("c = %d = %b", c, c); 

a = 8'd25;
b = 8'h1A;
c = a+(~b)+1;
$display(" "); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display(" a - b = c"); 
$display("c = %d = %b", c, c); 


end 
endmodule 