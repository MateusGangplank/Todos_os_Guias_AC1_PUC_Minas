//----------------
// TP02 EXTRA - 451542
//----------------

module base(output[7:0] s, input[7:0] p);
assign s = ~p;
endmodule //base

module testbase;
//------------------
	 reg[7:0]a;
	wire[7:0]s;
//------------------
base BASE(s, a);
initial begin:start
	a = 'b00000001;
	end
	
	initial begin
	a = 'b00000001;
	
	#1 $display("Complemento 1: %b = %5b", a, s);
	
	end
endmodule //test_base