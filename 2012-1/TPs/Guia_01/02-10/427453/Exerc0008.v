// ------------------------- 
// Exerc0008
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// --------------------- 
// --------------------- 
module andgate (output s, 
input p, 
input q, 
input r); 

assign s = p & q & r; 
endmodule // and 
// --------------------- 
// -- test ANDgate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a,b,c; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a= 1'b0; 
b= 1'b0;  
c= 1'b0;  
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exerc0008 - Pedro Henrique Vilar Locatelli  - 427453"); 
$display("Test and gate"); 
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