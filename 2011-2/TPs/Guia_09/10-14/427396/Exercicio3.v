// ------------------------- 
// Guia 09 -Exercicio3
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

//-----------------------------
// -- CLOCK
//-----------------------------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
endmodule // clock ( )

// -------------------------
// -- FLIP FLOP T
// -------------------------
module tff ( output q, output qnot, input t, input clk, input preset, input clear ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
		if ( ~clear ) 
			begin 
			q = 0;
			qnot = ~q; 
			end 
		else 
			if ( ~preset ) 
				begin 
				q = 1;
				qnot = ~q; 
				end 
			else 
				begin 
				if ( t ) 
					begin 
					q = ~q;
					qnot = ~q; 
			end 
		end 
	end 
endmodule // tff 

// -------------------------
// -- Contador contador decádico decrescente
// -------------------------
module ContDecaDec (output [3:0] s, input t, input clk, input present);

	wire qnot0, qnot1, qnot2, qnot3, clear, notT, a;
	
	not NOT1 (notT, t);

	and AND1(a, qnot0, ~qnot1, ~qnot2, qnot3);

	/* como o modulo fft usa a entrada clear negada para se zerar
	usaremos a negação da OR para termos esse resultado seguindo 
	a lógica do circuito montado */

	nor NOR1(clear, a, notT);

	/*
	as portas XOR abaixo tem como objetivo sincronizar todas as
	portas para serem limpas quando o clear for ativado, pois,
	se tivermos a clear no condição de ativado (~clear no caso == 1)
	devemos sincronizar todas as entradas clock com o clock pricipal
	caso contrario, deve ser o clock normal de cada porta
	*/
	
	wire clk1, clk2, clk3;
	xor XOR1(clk1, s[0], ~clear);
	xor XOR3(clk2, s[1], ~clear);
	xor XOR2(clk3, s[2], ~clear);

	tff TFF0 (s[0], qnot0, t, clk, present, clear);
	tff TFF1 (s[1], qnot1, t, clk1, present, clear);
	tff TFF2 (s[2], qnot2, t, clk2, present, clear);
	tff TFF3 (s[3], qnot3, t, clk3, present, clear);

endmodule //ContDecaDec

// -------------------------
// -- Exercicio3
// -------------------------
module Exercicio3;
	reg t, present;
	wire clk;
	wire [3:0] saida;
	
	clock CLK1 (clk);
	ContDecaDec CNT1 (saida, t, clk, present);
	initial begin
		#1 t = 1; present = 0;
		
		$display("CLK SAIDA T PST");
		$monitor("%1b   %4b  %1b  %1b", clk, saida, t, present);
		
		#24 present = 1;
		#456 $finish;
	end

endmodule //Exercicio3