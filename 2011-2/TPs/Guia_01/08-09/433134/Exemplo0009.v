// -------------------------
// Exemplo0009 - AND Com 3 portas
// Nome: Douglas Cruz de Matos 
// Matricula: 433134
// ------------------------- 
// ------------------------- 
// -- and3 gate
// ------------------------- 
	module and3gate ( output s, input p, input q,input r);
		assign s = ~(~p|~q|~r); 
	endmodule // and3gate
// --------------------- 
// -- test and3 gate
// ---------------------
	module testand3gate;
// ------------------------- dados locais 
		reg a, b,c; // definir registradores 
		wire s; // definir conexao (fio) 
// ------------------------- instancia 
		and3gate AND2 (s, a, b,c);
// ------------------------- preparacao 
		initial begin:start 
			a=0; b=0;c=0;
		end
// ------------------------- parte principal 
		initial begin 
			$display("Exemplo0009 - Douglas Cruz de Matos - 433134"); 
			$display("Testando a porta AND com 3 entradas"); 
			$display("\na & b & c = s\n"); 
			a=0; b=0;c=0; 
			#1 $display("%b & %b & %b= %b", a, b,c, s); 
			a=0; b=0;c=1; 
			#1 $display("%b & %b & %b= %b", a, b,c, s); 
			a=0; b=1;c=0; 
			#1 $display("%b & %b & %b= %b", a, b,c, s); 
			a=0; b=1;c=1; 
			#1 $display("%b & %b & %b= %b", a, b,c, s); 
			a=1; b=0;c=0;
			#1 $display("%b & %b & %b= %b", a, b,c, s);
			a=1; b=0;c=1;
			#1 $display("%b & %b & %b= %b", a, b,c, s);
			a=1; b=1;c=0;
			#1 $display("%b & %b & %b= %b", a, b,c, s);
			a=1; b=1;c=1;
			#1 $display("%b & %b & %b= %b", a, b,c, s);	
		end 
endmodule // testand3gate 