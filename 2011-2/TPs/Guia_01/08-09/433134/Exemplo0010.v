// -------------------------
// Exemplo0009 - OR Com 3 portas
// Nome: Douglas Cruz de Matos 
// Matricula: 433134
// -------------------------
// ------------------------- 
// -- or3 gate
// ------------------------- 
	module or3gate ( output s, input p, input q,input r);
		assign s = ~(~p&~q&~r); 
	endmodule // or3gate
// --------------------- 
// -- test or3 gate
// --------------------- 
	module testor3gate;
// ------------------------- dados locais 
		reg a, b,c; // definir registradores 
		wire s; // definir conexao (fio) 
// ------------------------- instancia 
		or3gate OR2 (s, a, b,c);
// ------------------------- preparacao 
		initial begin:start 
			a=0; b=0;c=0;
		end
// ------------------------- parte principal 
		initial begin 
			$display("Exemplo0009 - Douglas Cruz de Matos - 433134"); 
			$display("Testando a porta OR com 3 entradas"); 
			$display("\na | b | c = s\n"); 
			a=0; b=0;c=0; 
			#1 $display("%b | %b | %b= %b", a, b,c, s); 
			a=0; b=0;c=1; 
			#1 $display("%b | %b | %b= %b", a, b,c, s); 
			a=0; b=1;c=0; 
			#1 $display("%b | %b | %b= %b", a, b,c, s); 
			a=0; b=1;c=1; 
			#1 $display("%b | %b | %b= %b", a, b,c, s); 
			a=1; b=0;c=0;
			#1 $display("%b | %b | %b= %b", a, b,c, s);
			a=1; b=0;c=1;
			#1 $display("%b | %b | %b= %b", a, b,c, s);
			a=1; b=1;c=0;
			#1 $display("%b | %b | %b= %b", a, b,c, s);
			a=1; b=1;c=1;
			#1 $display("%b | %b | %b= %b", a, b,c, s);	
		end 
endmodule // testor3gate