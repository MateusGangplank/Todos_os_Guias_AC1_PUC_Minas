// -------------------------
// Exemplo0005 - NOR 
// Nome: Douglas Cruz de Matos 
// Matricula: 433134
// ------------------------- 
// ------------------------- 
// -- nord gate 
// ------------------------- 
	module norgate ( output s, input p, input q);
		assign s = ~(p | q); 
	endmodule // norgate
// --------------------- 
// -- test nor gate
// --------------------- 
	module testnorgate;
// ------------------------- dados locais 
		reg a, b; // definir registradores 
		wire s; // definir conexao (fio) 
// ------------------------- instancia 
		norgate NOR1 (s, a, b);
// ------------------------- preparacao 
		initial begin:start 
			a=0; b=0; 
		end
// ------------------------- parte principal 
		initial begin 
			$display("Exemplo0005 - Douglas Cruz de Matos - 433134"); 
			$display("Testando a porta NOR"); 
			$display("\n~(a | b) = s\n"); 
			a=0; b=0; 
			#1 $display("~(%b | %b) = %b", a, b, s); 
			a=0; b=1; 
			#1 $display("~(%b | %b) = %b", a, b, s); 
			a=1; b=0; 
			#1 $display("~(%b | %b) = %b", a, b, s); 
			a=1; b=1; 
			#1 $display("~(%b | %b) = %b", a, b, s); 
		end 
endmodule // testnorgate