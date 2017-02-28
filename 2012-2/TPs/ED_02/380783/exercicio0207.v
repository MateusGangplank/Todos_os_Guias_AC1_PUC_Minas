// ------------------------- 
// Exercicio02-07 - complemento de 2
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// ------------------------- 
// ------------------------- 
// -- complemento de 2
// ------------------------- 

module testandgate; 
// ------------------------- dados locais 
reg a, b, c, d, e, f, g, h, i ; // definir registradores 
wire l,m,n,o,p,q,r,s,t1,t2,t3,t4,t5,t6,t7,t8; // definir conexao (fio) 
// ------------------------- instancia 
xor XOR1 (l, ~a, 1); 
and AND1 (t1, ~a, 1);
xor XOR2 (m, ~b, t1); 
and AND2 (t2, ~b, t1);
xor XOR3 (n, ~c, t2); 
and AND3 (t3, ~c, t2);
xor XOR4 (o, ~d, t3); 
and AND4 (t4, ~d, t3);
xor XOR5 (p, ~e, t4); 
and AND5 (t5, ~e, t4);
xor XOR6 (q, ~f, t5); 
and AND6 (t6, ~f, t5);
xor XOR7 (r, ~g, t6); 
and AND7 (t7, ~g, t6);
xor XOR8 (s, ~h, t7); 
and AND8 (t8, ~h, t7);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio01-09 - Lucas Siqueira Chagas - 380783"); 
$display("complemento de 2"); 
$display("\n (h | g | f | e | d | c | b | a )          =     s | r | q | p | o | n | m | l   \n"); 
$monitor("(%b | %b | %b | %b | %b | %b | %b | %b )     =    %b | %b | %b | %b | %b | %b | %b | %b ", s, r, q, p, o, n, m, l, h,g,f,e,d,c,b,a);
#1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
#1 a=1; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
#1 a=1; b=1; c=1; d=1; e=1; f=1; g=1; h=1; 
#1 a=1; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
#1 a=0; b=1; c=1; d=1; e=1; f=1; g=1; h=1; 
#1 a=0; b=1; c=0; d=1; e=1; f=0; g=1; h=1; 
#1 a=1; b=0; c=1; d=0; e=0; f=1; g=0; h=0; 

end 
endmodule