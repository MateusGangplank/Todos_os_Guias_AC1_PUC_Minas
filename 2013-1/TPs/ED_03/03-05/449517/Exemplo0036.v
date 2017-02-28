// -- Exemplo0036 -----------------------
// -- Ana Carolina Conceição de Jesus ---
// -- Matricula 449517 ------------------

module Comparador (output s, input a, input b);

	wire s0,s1;
	wire tmp0,tmp1;
	
	not NOT1 (s0,a);
	not NOT2 (s1,b);
	
	and AND1 (tmp0,s0,b);
	and AND2 (tmp1,a,s1);
	
	or OR1(s,tmp0,tmp1);
	
endmodule

module teste;

	reg a,b;
	wire s;
	
	Comparador teste (s,a,b);
	
	initial begin : main
	
		$display("Exemplo0036 - Ana Carolina - 449517");
			$display("\nComaparador test");

		a = 0; b = 0;
		$display(" 0 - bits são iguais 1 - bits diferentes");
		
		#1 $monitor(" entradas  %b %b saida = %b",a,b,s);
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

		
end 

endmodule