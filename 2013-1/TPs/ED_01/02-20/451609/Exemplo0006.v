// --------------------- 
// Exemplo0006 - NAND 
// Nome: Rafael Tadeu Cmapos de Medeiros 
// Matricula: 451605 
// --------------------- 
// --------------------- 
// -- nand gate 
// --------------------- 
module nandgate (output s, 
input  p, 
input  q); 
assign s = ~(p&q) ; 
endmodule // nandgate
// --------------------- 
// -- test nand gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg  a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0;

end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0006 - Rafael Tadeu - 451609"); 
$display("Test NAND gate"); 
$display("\n a ~& b = s\n"); 

a=0; b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=0; b=1; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1; b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1; b=1; 
#1 $display("%b ~& %b = %b", a, b, s); end 
endmodule // testnandgate 

//Exemplo0006 - Rafael Tadeu - 451609
    //Test NAND gate
    //
     //a ~& b = s
    //
    //0 ~& 0 = 1
    //0 ~& 1 = 1
    //1 ~& 0 = 1
    //1 ~& 1 = 0