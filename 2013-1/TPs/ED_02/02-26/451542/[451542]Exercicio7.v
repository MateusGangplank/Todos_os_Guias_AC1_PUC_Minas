//----------------
// TP02 EXTRA 2- 451542
//----------------

module base(output[7:0] s, input[7:0] p, input[7:0]q);
assign s = ~p+q;
endmodule //base

module testbase;
//------------------
	 reg[7:0]a;
	 reg[7:0]b;
	wire[7:0]s;
//------------------
base BASE(s, a, b);
initial begin:start
	a = 'b00000010;
	b = 'b00000001;
	end
	
	initial begin
	a = 'b00000010;
	b = 'b00000001;
	#1 $display("Complemento 2: %b + %b= %5b", a, b, s);
	
	end
endmodule //test_base