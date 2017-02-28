// ------------------------- 
// Exercicio0010 - OR 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// -- or gate 
// -------------------------
module orgate1 (output s1,input a,input b);
assign s1 = a|b;
endmodule
module orgate ( output s, input s1,input c); 
assign s = s1|c ; 
endmodule // andgate
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s,s1; // definir conexao (fio) 
// ------------------------- instancia 
orgate1 OR1 (s1, a, b); 
orgate OR2 (s,s1,c);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0;c=0 ;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0010 - Filipe Viana de Miranda - 446415"); 
$display("Test NO gate"); 
$display("\na & b & c = s\n"); 
a=0; b=0;c=0;
$monitor("%b & %b & %b = %b", a, b, c, s); 
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end 
endmodule // testnandgate 