// ------------------------- 
// Exemplo0002 - NOT 
// Nome: Julio Miranda Machado
// Matricula: 435666-7 
// ------------------------- 
// ------------------------- 
// -- not gate 
// ------------------------- 
module notgate (output s, 
input p); 
assign s = ~p; 
endmodule // notgate 
// ------------------------- 
// -- test not gate 
// ------------------------- 
module testnotgate; 
// ------------------------- dados locais 
reg r;  
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
notgate NOT1 (s, r); 
// ------------------------- preparacao 
initial begin:start 
r=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0002 -Julio Miranda Machado - 435666-7"); 
$display("Test NOT gate"); 
$display("\n~a = s\n"); 
r=0; 
#1 $display("~%b = %b", r, s); 
r=1; 
#1 $display("~%b = %b", r, s); 
end 
endmodule // testnotgate 