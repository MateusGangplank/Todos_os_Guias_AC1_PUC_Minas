// --------------------- 
// Exercicio01-12 - testa se algum dos bits de um byte é igual a 1
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
// -- testa se algum dos bits de um byte é igual a 1
// --------------------- 
module norgate (output s, 
input p, 
input q,
input r,
input t,
input u,
input v,
input x,
input y
); 
assign s = (p|q|r|t|u|v|x|y); 
endmodule // norgate 
// --------------------- 
// -- test norgate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a,b,c,d,e,f,g,h; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b,c,d,e,f,g,h); 
// ------------------------- preparacao 
initial begin:start 
a=0; 
b=0;
c=0;
d=0;
e=0;
f=0;
g=0;
h=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01-12 - Lucas Siqueira Chagas - 380783"); 
$display("Testa se algum dos  bits de um byte é igual a 1."); 
$display("\n (a | b | c | d | e | f | g | h ) = s\n"); 
$monitor("(%b | %b | %b | %b | %b | %b | %b | %b ) = %b", a, b, c, d, e, f, g, h, s);
#1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
#1 a=1; b=1; c=1; d=1; e=1; f=1; g=1; h=1; 
#1 a=1; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
#1 a=0; b=1; c=1; d=1; e=1; f=1; g=1; h=1; 
end 
endmodule 