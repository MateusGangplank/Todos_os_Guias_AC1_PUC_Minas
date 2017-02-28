// ------------------------- 
// Exemplo0004 - OR
// Nome: Rama Alvim Sales Schiavo 
// Matricula: 305056 
// ------------------------- 
// ------------------------- 
// -- or gate
// ------------------------- 
module orgate (output s, input p,  input q); 
assign s = p | q;  
endmodule // orgate 
// ------------------------- 
// -- test or gate 
// ------------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a,b; // definir registradores
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
orgate OR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0;
end 
// ------------------------- parte principal 
initial begin
	$display("Exemplo 0004 - Rama Alvim Sales Schiavo - 305056"); 
	$display("Test OR gate:"); 
	$display("\na & b =s\n"); 
	a=0; b=0;
#1 $display("%b & %b = %b", a, b, s);
	a=0; b=1;
#1 $display("%b & %b = %b", a, b, s);
	a=1; b=0;
#1 $display("%b & %b = %b", a, b, s);
	a=1; b=1;
#1 $display("%b & %b = %b", a, b, s);

end 
endmodule // testbuffer 