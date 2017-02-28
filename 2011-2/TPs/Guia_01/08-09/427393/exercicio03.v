// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

module xnorgate(output s, input a, input b);
	assign s = (~(a^b));
endmodule // xnorgate

module testxnorgate;
// -- dados
	reg a, b;
	wire s;
	
// -- instancia
	xnorgate XNOR1(s, a, b);
	
// -- preparaçao
	initial begin: start
		a=0; b=0;
	end
	
// -- principal
	initial begin
		$display("XNOR");
		$display("a b   s");
		#1 $display("%b %b = %b", a, b, s);
			a=1; b=0;
		#1 $display("%b %b = %b", a, b, s);
			a=0; b=1;
		#1 $display("%b %b = %b", a, b, s);
			a=1; b=1;
		#1 $display("%b %b = %b", a, b, s);
	end

endmodule // testxnorgate