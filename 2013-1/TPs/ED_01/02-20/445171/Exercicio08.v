// --------------------- 
// Exercicio08
// Nome: Raphael Quintao 
// Matricula: 445171 
// ---------------------

 
module andgate (output s, input a, input b, input c); 
assign s = (a & b & c) ; 
endmodule // 
// --------------------- 
// -- 
// --------------------- 
module test; 
// ------------------------- dados locais 
reg a,b,c; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate and1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0;  
b=0;
c=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio 08 - Raphael Quintao - 445171"); 
$display("Test AND gate"); 
$display("\n(a & b & c) = s\n");
$monitor("%b & %b & %b = %b", a, b, c, s);
#1 a=0; b=0; c=0; 
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end 
endmodule // 