// --------------------- 
// Exercicio02-03
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
 module teste_com_numeros; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [4:0] b; 
reg [4:0] c; 

reg [5:0] d; 
reg [4:0] e; 
initial begin
a = ~6'b100110+1;
b = ~5'o24+1;
c = ~25+1;
d = ~6'h2D;
e = (~(27-37))+1;
$display(" "); 
$display("~a+1 = %d = %b", a, a); 
$display("~b+1 = %d = %b", b, b);
$display("~c+1 = %d = %b", c, c);
$display("~d+1 = %d = %b", d, d);
$display("~e+1 = %d = %b", e, e);

end 
endmodule 