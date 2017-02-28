// Exemplo0034 - BASE
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

module f4(output s, input a, input b, input [1:0] chave);
	wire alpha, beta, gama, delta, epsilon, digama;
	
	or  (alpha, a, b);
	nor (beta , a, b);
	multiplexador m(gama , alpha, beta, chave[0]);
	xor  (epsilon, a, b);
	xnor (digama , a, b);
	multiplexador h(delta, epsilon, digama, chave[0]);
	multiplexador g(s, gama, delta, chave[1]);
	
endmodule

module teste_f4;
	reg[1:0] chave;
	reg[0:0] x;
	reg[0:0] y;
	wire[0:0] z;
	
	f4 modulo (z, x, y, chave);
	
	initial begin
		$display("Exemplo0034 - Lucas Porto Lopes - 451408");
		$display("test LU's module");
		
		chave = 2'b00;
		x = 1'b0;
		y = 1'b0;
		
		#1
		$display("%3b %3b %3b", x, y, z);
		
		
	end
	
endmodule