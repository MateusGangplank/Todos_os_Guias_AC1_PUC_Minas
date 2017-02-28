// --------------------- 
// Exercicio04
// Nome: Raphael Quintao 
// Matricula: 445171 
// ---------------------

 
module nandgate (output s, input a, input b); 
assign s = (~a | ~b)   ; 
endmodule // 
// --------------------- 
// -- 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
nandgate nand1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;  
b=0; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio 04 - Raphael Quintao - 445171"); 
$display("Test NAND(de morgan) gate"); 
$display("\n(~a | ~b) = s\n");
$monitor("(~%b | ~%b) = %b", a, b, s);
#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1; 

end 
endmodule // 