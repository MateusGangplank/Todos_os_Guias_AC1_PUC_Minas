// ------------------------- 
// Exerc0010
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// --------------------- 
// --------------------- 
module oragate (output s, 
input p, 
input r); 

assign s = p | r; 
endmodule // or

module orgate (output s, 
input p, 
input q, 
input r); 
wire w;
oragate as1 (w, p, q);
oragate as2 (s, w, r);
endmodule // or
// --------------------- 
// -- test ORgate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a,b,c; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a= 1'b0; 
b= 1'b0;  
c= 1'b0;  
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exerc0010 - Pedro Henrique Vilar Locatelli  - 427453"); 
$display("Test or gate"); 
$display("\n a ^ b ^ c = s\n");
$monitor("%b ^ %b ^ %b = %b", a, b, c, s); 
#1 a=1'b0; b=1'b0; c=1'b1;
#1 a=1'b0; b=1'b1; c=1'b0;
#1 a=1'b0; b=1'b1; c=1'b1;
#1 a=1'b1; b=1'b0; c=1'b0;
#1 a=1'b1; b=1'b0; c=1'b1;
#1 a=1'b1; b=1'b1; c=1'b0;
#1 a=1'b1; b=1'b1; c=1'b1;
end 
endmodule // testandgate 