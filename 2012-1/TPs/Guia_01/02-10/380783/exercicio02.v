// --------------------- 
// Exercicio01-02 - NOR
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
// -- NOR
// --------------------- 
module norgate (output s, 
input p, 
input q); 
assign s = ~(p|q); 
endmodule // norgate 
// --------------------- 
// -- test norgate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; 
b=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01-02 - Lucas Siqueira Chagas - 380783"); 
$display("Test nor gate"); 
$display("\n ~(a | b) = s\n"); 
$monitor("~(%b | %b) = %b", a, b, s);
//#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule // testnandgate 