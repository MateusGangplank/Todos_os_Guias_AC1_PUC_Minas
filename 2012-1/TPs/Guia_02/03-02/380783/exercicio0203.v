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
a = ~6'b100111+1;
b = ~5'o23+1;
c = ~23+1;
d = ~6'h2B;
e = (~(26-36))+1;
$display(" "); 
$display("~a+1 = %d = %b", a, a); 
$display("~b+1 = %d = %b", b, b);
$display("~c+1 = %d = %b", c, c);
$display("~d+1 = %d = %b", d, d);
$display("~e+1 = %d = %b", e, e);

end 
endmodule 