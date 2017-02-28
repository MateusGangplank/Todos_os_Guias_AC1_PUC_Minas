// --------------------- 
// Exemplo0007 - NOR 
// Nome: Rafael Tadeu Cmapos de Medeiros 
// Matricula: 451605 
// --------------------- 
// --------------------- 
// -- nor gate 
// --------------------- 
module norgate (output s, 
input  p, 
input  q); 
assign s = ~(p|q) ; 
endmodule // norgate
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg  a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0;

end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0007 - Rafael Tadeu - 451609"); 
$display("Test NOR gate"); 
$display("\n a ~| b = s\n"); 
$monitor("%b ~| %b = %b", a, b, s); 
#1 a=0; b=0;  
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule // testnorgate 

//Exemplo0007 - Rafael Tadeu - 451609
    //Test NOR gate
    //
     //a ~| b = s
    //
    //0 ~| 0 = 1
    //0 ~| 1 = 0
    //1 ~| 0 = 0
    //1 ~| 1 = 0