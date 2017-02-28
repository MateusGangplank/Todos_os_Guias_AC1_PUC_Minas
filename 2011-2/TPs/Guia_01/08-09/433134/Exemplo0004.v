// -------------------------
// Exemplo0004 - OR 
// Nome: Douglas Cruz de Matos 
// Matricula: 433134
// ------------------------- 
// ------------------------- 
// -- or gate
// ------------------------- 
	module orgate ( output s, input p, input q);
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
			$display("Exemplo0004 - Douglas Cruz de Matos - 433134"); 
			$display("Testando a porta OR"); 
			$display("\na | b = s\n"); 
			a=0; b=0; 
			#1 $display("%b | %b = %b", a, b, s); 
			a=0; b=1; 
			#1 $display("%b | %b = %b", a, b, s); 
			a=1; b=0; 
			#1 $display("%b | %b = %b", a, b, s); 
			a=1; b=1; 
			#1 $display("%b | %b = %b", a, b, s); 
		end 
endmodule // testorgate