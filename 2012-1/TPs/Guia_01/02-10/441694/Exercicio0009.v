// ------------------------- 
// Exercicio0009 - AND 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// -------------------------

// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
input p, 
input q); 
assign s = (p & q); 
endmodule // andgate 

module andgate2 (output t,
input s,
input u);
assign t = (s & u);
endmodule //andgate

// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 

// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s, t; // definir conexao (fio) 

// ------------------------- instancia 
andgate AND1 (s, a, b); 
andgate AND2 (t, c, s);

// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end 

// ------------------------- parte principal 
initial begin 
$display("Exercicio0009 - Lucas Cardoso - 441694"); 
$display("Test AND gate"); 
$display("\na & b & c = s\n"); 
a=0; b=0; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=0; b=0; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=0; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=0; b=1; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=1; b=0; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=1; b=0; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=1; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=1; b=1; c=1;
end 
endmodule // testandgate 