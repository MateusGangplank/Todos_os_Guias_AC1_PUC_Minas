// --------------------- 
// Exemplo0014 - OR 
// Nome: Rafael Tadeu Cmapos de Medeiros 
// Matricula: 451605 
// --------------------- 
// --------------------- 
// -- or gate 
// --------------------- 
module orgate (output s, 
input  p, q); 
assign s = p | q; 
endmodule // orgate
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg  a,b,c; // definir registrador 
wire s1, s2; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s1, a, b); 
orgate OR2 (s2, s1, c);
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0;

end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0014 - Rafael Tadeu - 451609"); 
$display("Test OR gate"); 
$display("\n (a | b) | c  = s\n"); 
$monitor("((%b | %b) | %b) = %b", a, b, c, s2); 
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end
endmodule // testorgate
//
 //Exemplo0014 - Rafael Tadeu - 451609
    //Test OR gate
    //
    // (a | b) | c  = s
    //
    //((0 | 0) | 0) = 0
    //((0 | 0) | 1) = 1
    //((0 | 1) | 0) = 1
    //((0 | 1) | 1) = 1
    //((1 | 0) | 0) = 1
    //((1 | 0) | 1) = 1
    //((1 | 1) | 0) = 1
    //((1 | 1) | 1) = 1