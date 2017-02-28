// ------------------------- 
// Exercicio 01 - 04
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049 
// ------------------------- 
// ------------------------- 
// -- and3  gate 
// -------------------------  
module and3gate (output s, input a, input b, input c); 
assign s = (a&b&c) ; // criar vinculo permanente 
// (dependencia) 
endmodule // and3gate 
// --------------------- 
// -- test and3  gate 
// --------------------- 
module testand3gate; 
// ------------------------- dados locais 
reg a, b, c; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente )
// ------------------------- instancia 
and3gate AND3 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01 - Lorena Danielle Gonçalves Bento - 435049"); 
$display("Test and3 gate"); 
$display("\n (a & b & c)  = s\n"); 
#1 $display("%b %b %b= %b", a, b, c, s); 
a=0; b=0; c=1;
#1 $display("%b %b %b= %b", a, b, c, s); 
a=0; b=1; c=0;
#1 $display("%b %b %b= %b", a, b, c, s);  
a=0; b=1; c=1; 
#1 $display("%b %b %b= %b", a, b, c, s); 
a=1; b=0; c=0;  
#1 $display("%b %b %b= %b", a, b, c, s); 
a=1; b=0; c=1;
#1 $display("%b %b %b= %b", a, b, c, s);
a=1; b=1; c=0;
#1 $display("%b %b %b= %b", a, b, c, s);
a=1; b=1; c=1;
#1 $display("%b %b %b= %b", a, b, c, s);
a=1; b=1; c=1;

end 
endmodule // testand3gate 
