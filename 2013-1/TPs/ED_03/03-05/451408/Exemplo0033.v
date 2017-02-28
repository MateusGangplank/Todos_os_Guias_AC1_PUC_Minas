// Exemplo0033 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//gates

module multiplexador(output s, input a, input b, input chave);
	wire alpha, beta, tmp;
	
	not (tmp, chave);
	and (beta, b, chave);	
	and (alpha, a , tmp);
	
	or (s, alpha, beta);
	
endmodule

module f4(output s, output w, input a, input b, input chave);
	wire alpha, beta, gama, delta;
	
	or  (alpha, a, b);
	nor (beta , a, b);
	multiplexador m(s, alpha, beta, chave);
	and  (gama, a, b);
	nand (delta, a, b);
	multiplexador h(w, gama, delta, chave);	
	
endmodule

module teste_f4;
	reg[0:0] chave;
	reg[0:0] x;
	reg[0:0] y;
	wire[0:0] z;
	wire[0:0] w;
	
	f4 modulo (w, z, x, y, chave);
	
	initial begin
		$display("Exemplo0033 - Lucas Porto Lopes - 451408");
		$display("test LU's module");
		
		chave = 1'b0;
		x = 1'b0;
		y = 1'b0;
		
		#1
		$display("%3b %3b %3b", x, y, z);
		$display("%3b %3b %3b", x, y, w);
		
		
	end
	
endmodule