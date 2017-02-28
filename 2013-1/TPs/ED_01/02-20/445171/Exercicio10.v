// --------------------- 
// Exercicio10
// Nome: Raphael Quintao 
// Matricula: 445171 
// ---------------------


module orgate0 (output s, input a, input b); 
assign s = (a | b) ; 
endmodule // 
 
module orgate (output s, input a, input b, input c); 
wire x;
orgate0 or0 (x, a, b);
orgate0 or1 (s, x, c);
endmodule // 
// --------------------- 
// -- 
// --------------------- 
module test; 
// ------------------------- dados locais 
reg a,b,c; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate or2 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0;  
b=0;
c=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio 10 - Raphael Quintao - 445171"); 
$display("Test OR gate"); 
$display("\n(a | b | c) = s\n");
$monitor("%b | %b | %b = %b", a, b, c, s);
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