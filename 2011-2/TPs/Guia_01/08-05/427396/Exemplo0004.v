// ------------------------- 
// Exemplo0004 - OR 
// Nome: Eduardo Manoel de Paula Júnior 
// Matricula: 427396
// ------------------------- 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, input p, q); 
	assign s = p | q; 
endmodule // orgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
	reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
	a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0004 - Eduardo Manoel - 427396"); 
	$display("Test OR gate"); 
	$display("\na OR b = s\n"); 
	a=0; b=0; 
	#1 $display("%b OR %b = %b", a, b, s); 
	a=0; b=1; 
	#1 $display("%b OR %b = %b", a, b, s); 
	a=1; b=0; 
	#1 $display("%b OR %b = %b", a, b, s); 
	a=1; b=1; 
	#1 $display("%b OR %b = %b", a, b, s); 
end 
endmodule // testorgate 