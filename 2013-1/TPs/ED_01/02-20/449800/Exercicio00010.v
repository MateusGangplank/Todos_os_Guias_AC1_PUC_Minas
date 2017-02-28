// ------------------------- 
// Exercicio0010 - NOT//3 entradas + modulo de 2 entradas
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 
// ------------------------- 
// -- NOT gate 
// ------------------------- 

module notgate2 ( output s, 
input p, 
input q);
assign s = (p | q);
 
endmodule // andgate

module notgate3 ( output s, 
input p, 
input q,
input r); 
wire a;

notgate2 not21(a, p, q);
notgate2 not22(s, a, r); 
endmodule // notgate

// --------------------- 
// -- test not gate 
// --------------------- 

module testnotgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
notgate3 NOT3 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end //

// ------------------------- parte principal 
initial begin 
$display("Exercicio0009 -Fabio Fiuza Pereira - 406087"); 
$display("Test NOT gate"); 
$display("\na & b & c = s\n"); 
a=0; b=0; c=0;
#1 $monitor("%b & %b & %b = %b", a, b, c, s); 
#1 a=0; b=0; c=1; 
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=1; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=1;
#1 a=0; b=0; c=0;


end 
endmodule // testnotgate 