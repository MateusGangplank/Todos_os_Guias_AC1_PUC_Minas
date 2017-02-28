// --------------------- 
// Exercicio06
// Nome: Raphael Quintao 
// Matricula: 445171 
// ---------------------

 
module xorgate (output s, input a, input b); 
assign s = (~a & b) | (a & ~b) ; 
endmodule // 
// --------------------- 
// -- 
// --------------------- 
module test; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xorgate xor1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;  
b=0; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio 06 - Raphael Quintao - 445171"); 
$display("Test XOR gate"); 
$display("\n(~a & b) | (a & ~b) = s\n");
$monitor("%b XOR %b = %b", a, b, s);
#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1; 

end 
endmodule // 