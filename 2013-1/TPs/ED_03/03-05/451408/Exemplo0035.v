// Exemplo0035 - BASE
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

module f4(output s, input a, input b, input [2:0] chave);
	wire alpha, beta, gama, delta, epsilon, digama, temp01, temp02, temp03, temp04, temp05, temp06, temp07, temp08;
	
	or   (temp01, a, b);
	and  (temp02 , a, b);
	multiplexador aa(alpha , temp01, temp02, chave[0]);
	
	nor  (temp03, a, b);
	nand (temp04, a, b);
	multiplexador ab(beta , temp03, temp04, chave[0]);
	
	xor  (temp05, a, b);
	xnor (temp06, a, b);
	multiplexador ac(gama , temp05, temp06, chave[0]);
	
	not a(temp07, a);
	not b(temp08, b);
	multiplexador ad(delta, temp07, temp08, chave[0]);
	
	multiplexador ae(epsilon, alpha, beta, chave[1]);
	multiplexador af(digama, gama, delta, chave[1]);
	
	multiplexador rep(s, epsilon, digama, chave[2]);
	
endmodule

module teste_f4;
	reg[4:0] count;
	reg[2:0] chave;
	reg[0:0] x;
	reg[0:0] y;
	wire[0:0] z;
	
	f4 modulo (z, x, y, chave);
	
	initial begin
		$display("Exemplo0035 - Lucas Porto Lopes - 451408");
		$display("test LU's module");
		
		chave = 3'b000;
		x = 1'b0;
		y = 1'b0;
		
		#1
		$monitor("%3b %3b %3b = %3b", x, y,chave, z);
			count = 0;
      	  repeat (31) begin
        	    count <= count + 1;
				 #1 x<=count[4]; y<=count[3]; chave[2]<=count[2]; chave[1]<=count[1]; chave[0]<=count[0];
		end		
		
	end
	
endmodule