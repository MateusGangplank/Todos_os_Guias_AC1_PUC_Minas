


// ------------------------- 
// Exercicio 01 - 05
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049 
// ------------------------- 
// ------------------------- 
// -- or3  gate 
// -------------------------  
module or3gate (output s, input a, input b, input c); 
assign s = (a|b|c) ; // criar vinculo permanente 
// (dependencia) 
endmodule // or3gate 
// --------------------- 
// -- test or3  gate 
// --------------------- 
module testor3gate; 
// ------------------------- dados locais 
reg a, b, c; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente )
// ------------------------- instancia 
or3gate OR3 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01 - Lorena Danielle Gonçalves Bento - 435049"); 
$display("Test or3 gate"); 
$display("\n (a | b | c)  = s\n"); 
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
endmodule // testor3gate 