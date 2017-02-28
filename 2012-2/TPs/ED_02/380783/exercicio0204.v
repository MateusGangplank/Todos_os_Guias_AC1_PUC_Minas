// --------------------- 
// Exercicio02-04
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
 module teste_com_numeros; 
// ------------------------- definir dados 
reg [8:0] a; 
reg [7:0] b; 
reg [6:0] c; 

reg [5:0] d; 
reg [8:0] e; 
initial begin
a = (~8'b101011)+1;
b = (~7'd24)+1;
c = (~6'd27)+1;
d = (~5'hC)+1;
e = (~(8'o21))+1;
$display(" "); 
$display("~a+1 = %d = %b", a, a); 
$display("~b+1 = %d = %b", b, b);
$display("~c+1 = %d = %b", c, c);
$display("~d+1 = %d = %b", d, d);
$display("~e+1 = %d = %b", e, e);

end 
endmodule 