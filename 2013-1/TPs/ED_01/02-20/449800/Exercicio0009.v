// ------------------------- 
// Exercicio0009 - AND//3 entradas + modulo de 2 entradas
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 
// ------------------------- 
// -- NOT gate 
// ------------------------- 

module andgate2 ( output s, 
input p, 
input q);
assign s = (p & q);
 
endmodule // andgate

module andgate3 ( output s, 
input p, 
input q,
input r); 
wire a;

andgate2 and21(a, p, q);
andgate2 and22(s, a, r); 
endmodule // andgate

// --------------------- 
// -- test and gate 
// --------------------- 

module testandgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate3 AND3 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end //

// ------------------------- parte principal 
initial begin 
$display("Exercicio0009 -Fabio Fiuza Pereira - 406087"); 
$display("Test AND gate"); 
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
endmodule // testandgate 