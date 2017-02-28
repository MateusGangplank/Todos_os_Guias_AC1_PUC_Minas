// ------------------------- 
// Exercicio0010 - OR 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// -------------------------

// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, 
input a, 
input b); 
assign s = (a | b); 
endmodule // ORgate 

module orgate2 (output t,
input s,
input c);
assign t = (s | c);
endmodule //ORgate

// --------------------- 
// -- test OR gate 
// --------------------- 
module testorgate; 

// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s, t; // definir conexao (fio) 

// ------------------------- instancia 
orgate OR1 (s, a, b); 
orgate2 OR2 (t, s, c);

// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end 

// ------------------------- parte principal 
initial begin 
$display("Exercicio0010 - Lucas Cardoso - 441694"); 
$display("Test OR gate"); 
$display("\na & b & c = s\n"); 
a=0; b=0; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, t); 
a=0; b=0; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, t);
a=0; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, t); 
a=0; b=1; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, t); 
a=1; b=0; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, t);
a=1; b=0; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, t); 
a=1; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, t);
a=1; b=1; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, t);
end 
endmodule // testandgate 

