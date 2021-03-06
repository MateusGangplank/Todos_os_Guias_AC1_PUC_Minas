//Wadson Ferreira
//460631
//OBS: Não consegui mostrar apenas em posedge
//porque estava omitindo movimentações.

module shift(output[4:0] saida, input entrada, input load, input clock, input reset);
	reg[4:0] saida;
	wire entradaProcessada;
	and A1(entradaProcessada,load,entrada);
	always @(posedge clock) begin
		saida[4]=saida[3];                         // usar os flip-flops
		saida[3]=saida[2];
		saida[2]=saida[1];
		saida[1]=saida[0];
		saida[0]=entradaProcessada;
	end
endmodule

module Exercicio01;
	wire[4:0] saida;
	reg entrada,clock,load;
	shift S(saida,entrada,load,clock,0);
	initial begin
		clock=0;
		#5 entrada=1; load=1;
		#5 load=0;
		#5 entrada=1;
		#10 entrada=1;
		#10 entrada=1; load=1;
		#10 entrada=1; load=0;
		#10 $finish;
	end
	always begin #5 clock=~clock; end
	always @(clock) begin
		$display("%d %b %b",$time,entrada,saida);
	end
endmodule

/*
Saida esperada
 0 x xxxxx
 5 1 xxxxx
10 1 xxxx1
15 1 xxxx1
20 1 xxx10
25 1 xxx10
30 1 xx100
35 1 xx100
40 1 x1001
45 1 x1001
50 1 10010
55 1 10010
*/
