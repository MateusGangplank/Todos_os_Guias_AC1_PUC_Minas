// ------------------------- 
// Exercicio02-06 - complemento de 1
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// ------------------------- 
// ------------------------- 
// -- complemento de 1
// ------------------------- 
 
module test; 
// ------------------------- dados locais 
reg a, b, c,d,e,f,g,h; // definir registradores 
wire l,m,n,o,p,q,r,s; // definir conexao (fio) 
// ------------------------- instancia 
not NOT1 (l, a); 
not NOT2 (m, b);
not NOT1 (n, c); 
not NOT2 (o, d);
not NOT1 (p, e); 
not NOT2 (q, f);
not NOT1 (r, g); 
not NOT2 (s, h);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio02-06 - extra - Lucas Siqueira Chagas - 380783"); 
$display("complemento de 1"); 
$display("\n (a | b | c | d | e | f | g | h )          =     l | m | n | o | p | q | r | s   s\n"); 
$monitor("(%b | %b | %b | %b | %b | %b | %b | %b )     =    %b | %b | %b | %b | %b | %b | %b | %b ", a, b, c, d, e, f, g, h, l,m,n,o,p,q,r,s);
#1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
#1 a=1; b=1; c=1; d=1; e=1; f=1; g=1; h=1; 
#1 a=1; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
#1 a=0; b=1; c=1; d=1; e=1; f=1; g=1; h=1; 
#1 a=0; b=1; c=0; d=1; e=1; f=0; g=1; h=1; 
#1 a=1; b=0; c=1; d=0; e=0; f=1; g=0; h=0; 

end 
endmodule