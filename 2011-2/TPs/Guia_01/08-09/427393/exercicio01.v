module nandgate (output s, input a, input b);
	assign s = ~(a&b);
endmodule // nandgate

module testnandgate;
// -- dados
	reg a, b;
	wire s;
	
// -- instancia
	nandgate NAND1(s, a, b);
	
// -- preparaçao	
	initial begin:start
		a=0; b=0;
	end

// -- principal
	initial begin
		$display("NAND");
		$display("a b");
		#1 $display("%b %b = %b", a, b, s);
			a=0; b=1;
		#1 $display("%b %b = %b", a, b, s);
			a=1; b=0;
		#1 $display("%b %b = %b", a, b, s);
			a=1; b=1;
		#1 $display("%b %b = %b", a, b, s);
	end
endmodule // testnandgate