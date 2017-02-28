// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

module orgate(output s, input a, input b, input c);
	assign s = ~(~(a|b|c));
endmodule // orgate

module testorgate;
// -- dados
	reg a, b, c;
	wire s;
	
// -- instancia
	orgate OR1(s, a, b, c);
	
// -- preparaçao
	initial begin: start
		a=0; b=0; c=0;
	end
	
// -- principal
	initial begin 
		$display("OR - propriedade de Morgan");
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
endmodule // testorgate