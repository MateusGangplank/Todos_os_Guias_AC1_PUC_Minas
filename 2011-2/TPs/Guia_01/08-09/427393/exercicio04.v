// --Nome: Camila Guedes Silveira
// --Matr�cula: 427393
// --

module andgate (output s, input a, input b, input c);
	assign s = ~(~(a&b&c));
endmodule // andgate

module testandgate;
// -- dados
	reg a, b, c;
	wire s;
	
// -- instancia
	andgate	AND1(s, a, b, c);
	
// -- prepara�ao
	initial begin:start
		a=0; b=0; c=0;
	end
	
// -- principal
	initial begin
		$display("AND - propriedade de Morgan");
		$display("a b c   s");
		$monitor("%b %b %b = %b", a, b, c, s);
			#1 a=1; b=0; c=0;
			#1 a=0; b=1; c=0;
			#1 a=0; b=0; c=1;
			#1 a=1; b=1; c=0;
			#1 a=1; b=0; c=1;
			#1 a=0; b=1; c=1;
			#1 a=1; b=1; c=1;
	end
endmodule // testandgate