// --------------------- 
// Exemplo0011 - XOR 
// Nome: Rafael Tadeu Cmapos de Medeiros 
// Matricula: 451605 
// --------------------- 
// --------------------- 
// -- xor gate 
// --------------------- 
module xorgate (output s, 
input  p, q); 
assign s = ((~p)& q) |( p &(~q))  ; 
endmodule // xorgate
// --------------------- 
// -- test xor gate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
reg  a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xorgate XOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0;

end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0011 - Rafael Tadeu - 451609"); 
$display("Test XOR gate"); 
$display("\n a'b | a b'  = s\n"); 
$monitor("~(%b | %b )= %b", a, b, s); 
#1 a=0; b=0;  
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule // testxorgate 

//Exemplo0011 - Rafael Tadeu - 451609
    //Test XOR gate
    //
     //a'b | a b'  = s
    //
    //~(0 | 0 )= 0
    //~(0 | 1 )= 1
    //~(1 | 0 )= 1
    //~(1 | 1 )= 0