// --------------------- 
// Exemplo0013 - AND 
// Nome: Rafael Tadeu Cmapos de Medeiros 
// Matricula: 451605 
// --------------------- 
// --------------------- 
// -- and gate 
// --------------------- 
module andgate (output s, 
input  p, q); 
assign s = p & q; 
endmodule // andgate
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg  a,b,c; // definir registrador 
wire s1, s2; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s1, a, b); 
andgate AND2 (s2, s1, c);
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0;

end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0013 - Rafael Tadeu - 451609"); 
$display("Test AND gate"); 
$display("\n (a & b) & c  = s\n"); 
$monitor("((%b & %b) & %b) = %b", a, b, c, s2); 
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end
endmodule // testandgate
//
 //Exemplo0013 - Rafael Tadeu - 451609
    //Test AND gate
    //
    // (a & b) & c  = s
    //
    //((0 & 0) & 0) = 0
    //((0 & 0) & 1) = 0
    //((0 & 1) & 0) = 0
    //((0 & 1) & 1) = 0
    //((1 & 0) & 0) = 0
    //((1 & 0) & 1) = 0
    //((1 & 1) & 0) = 0
    //((1 & 1) & 1) = 1