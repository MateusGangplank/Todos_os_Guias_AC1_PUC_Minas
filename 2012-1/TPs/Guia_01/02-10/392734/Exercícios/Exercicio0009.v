// ------------------------- 
// Exercicio 0009 - AND 
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ------------------------- 
// ------------------------- 
// -- and gate 
// -------------------------
module andgate1 (output s1,input a,input b);
	assign s1 = a&b;
endmodule

module andgate ( output s, input s1,input c); 
	assign s = s1&c ; 
endmodule // andgate

// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
 reg a, b, c; // definir registradores 
 wire s,s1; // definir conexao (fio) 
// ------------------------- instancia 
 andgate1 AND1 (s1, a, b); 
 andgate AND2 (s,s1,c);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
	a=0; b=0;c=0 ;
end 
// ------------------------- parte principal 
initial begin 
	$display("Exercicio 0009 - João Henrique Mendes de Oliveira - 392734"); 
	$display("Test AND gate"); 
	$display("\na & b & c = s\n"); 
	a=0; b=0;c=0;
	$monitor("%b & %b & %b = %b", a, b, c, s); 
	#1 a=0;b=0;c=1;
	#1 a=0;b=1;c=0;
	#1 a=0;b=1;c=1;
	#1 a=1;b=0;c=0;
	#1 a=1;b=0;c=1;
	#1 a=1;b=1;c=0;
	#1 a=1;b=1;c=1;
 end 
endmodule // testnandgate 