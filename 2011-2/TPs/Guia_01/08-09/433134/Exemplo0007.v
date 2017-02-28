// -------------------------
// Exemplo0007 - XOR 
// Nome: Douglas Cruz de Matos 
// Matricula: 433134
// ------------------------- 
// ------------------------- 
// -- xor gate
// ------------------------- 
	module xorgate ( output s, input p, input q);
		assign s =p ^ q; 
	endmodule // xorgate
// --------------------- 
// -- test xor gate 
// --------------------- 
	module testxorgate;
// ------------------------- dados locais
		reg a, b; // definir registradores 
		wire s; // definir conexao (fio) 
// ------------------------- instancia 
		xorgate XOR1 (s, a, b);
// ------------------------- preparacao 
		initial begin:start 
			a=0; b=0; 
		end
// ------------------------- parte principal 
		initial begin 
			$display("Exemplo0007 - Douglas Cruz de Matos - 433134"); 
			$display("Testando a porta XOR"); 
			$display("\n(a ^ b) = s\n"); 
			a=0; b=0; 
			#1 $display("(%b ^ %b) = %b", a, b, s); 
			a=0; b=1; 
			#1 $display("(%b ^ %b) = %b", a, b, s); 
			a=1; b=0; 
			#1 $display("(%b ^ %b) = %b", a, b, s); 
			a=1; b=1; 
			#1 $display("(%b ^ %b) = %b", a, b, s); 
		end 
endmodule // testXORgate