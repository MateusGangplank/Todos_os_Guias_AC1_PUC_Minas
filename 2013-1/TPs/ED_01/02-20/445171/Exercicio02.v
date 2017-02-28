// --------------------- 
// Exercicio02
// Nome: Raphael Quintao 
// Matricula: 445171 
// ---------------------

 
module norgate (output s, input p, input q); 
assign s = ~(p|q)  ; 
endmodule // nor 
// --------------------- 
// -- 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate nor1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;  
b=0; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio 02 - Raphael Quintao - 445171"); 
$display("Test NOR gate"); 
$display("\n ~(p|q) = s\n");
$monitor("~(%b | %b) = %b", a, b, s);
#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1; 

end 
endmodule // testxorgate 