// ------------------------- 
// Exemplo2 - NOR 
// Nome: Julio Miranda Machado
// Matricula: 435666-7  
// ------------------------- 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate ( output s, 
input p, q); 
assign s = p ~| q; 
endmodule // orgate 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate OR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo2 - Julio Miranda Machado- 435666-7"); 
$display("Test NOR gate"); 
$display("\n\ttime	a & b = s\n"); 
a=0; b=0;
$monitor("%d\t~(%b|%b) = %b ", $time,a ,b ,s); 
#1a=0; b=1; 
#1a=1; b=0; 
#1a=1; b=1; 
end 
endmodule // testnorgate 