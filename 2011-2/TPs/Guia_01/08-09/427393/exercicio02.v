// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

module norgate(output s, input a, input b);
	assign s = (~(a|b));
endmodule // norgate

module testnorgate;
// -- dados
	reg a, b;
	wire s;
	
// -- instancia
	norgate NOR1(s, a, b);
	
// -- preparaçao
	initial begin: start
		a=0; b=0;
	end
	
// -- principal
	initial begin
		$display("NOR");
		$display("a b   s");
		$monitor("%b %b = %b", a, b, s);
		#1	a=1; b=0;
		#1	a=0; b=1;
		#1 a=1; b=1;
		
	end
endmodule // testnorgate