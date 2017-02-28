// --------------------- 
// Exemplo0012 - XNOR 
// Nome: Rafael Tadeu Cmapos de Medeiros 
// Matricula: 451605 
// --------------------- 
// --------------------- 
// -- xnor gate 
// --------------------- 
module xnorgate (output s, 
input  p, q); 
assign s = (p & q) |( (~p) &(~q))  ; 
endmodule // xnorgate
// --------------------- 
// -- test xnor gate 
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
$display("Exemplo0012 - Rafael Tadeu - 451609"); 
$display("Test XNOR gate"); 
$display("\n ab | a' b'  = s\n"); 
$monitor("%b | ~(%b) = %b", a, b, s); 
#1 a=0; b=0;  
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule // testxnorgate 

//Exemplo0012 - Rafael Tadeu - 451609
    //Test XNOR gate
    //
    //ab | a' b'  = s
    //
    //0 | ~(0) = 1
    //0 | ~(1) = 0
    //1 | ~(0) = 0
    //1 | ~(1) = 1