// ------------------------- 
// Exemplo0002 - NOT
// Nome: Rama Alvim Sales Schiavo 
// Matricula: 305056 
// ------------------------- 
// ------------------------- 
// -- not gate
// ------------------------- 
module notgate (output s, input p); 
assign s = ~p;  
endmodule // notgate 
// ------------------------- 
// -- test not gate 
// ------------------------- 
module testnotgate; 
// ------------------------- dados locais 
reg a; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
notgate NOT1 (s, a); 
// ------------------------- preparacao 
initial begin:start 
a=0; 
end 
// ------------------------- parte principal 
initial begin:main 
	$display("Exemplo 0002 - Rama Alvim Sales Schiavo - 305056"); 
	$display("Test NOt gate:"); 
	$display("\n~a = s\n"); 
	a=0;
#1 $display("~%b =%b", a, s);
	a=1;
#1 $display("~%b = %b",a,s);

end 
endmodule // testbuffer 