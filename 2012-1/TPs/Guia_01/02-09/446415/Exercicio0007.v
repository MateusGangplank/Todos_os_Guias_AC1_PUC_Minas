// --------------------- 
// Exercicio0007 - xnor 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// --------------------- 
// --------------------- 
// -- xnor gate 
// --------------------- 
module xnorgate (output s,input  p,input  q); 
assign s = (p&q)|(~p&~q); 
endmodule // xnor 
// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
reg  a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0;  
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio0007 - Filipe Viana de Miranda - 446415"); 
$display("Test xnor gate"); 
$display("\na ~+ b = s\n"); 
$monitor("%b ~+ %b = %b", a, b, s); 
#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1;  
end 
endmodule // testxorgate 