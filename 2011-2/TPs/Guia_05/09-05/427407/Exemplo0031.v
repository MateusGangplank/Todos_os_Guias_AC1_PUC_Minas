// -------------------------
// Exemplo0031 - SUM/SUB 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// ------------------------- 
// sum/sub
// ------------------------- 


// descrever por portas 

module xorGate (output sx,
					 input a,
					 input b);
//assign sx = (a ^ b);
  xor XOR1 (sx,a,b);
endmodule // xorGate

module fullAdder (output s,
						output cout,
					 	input a,
					 	input b,
						input cin);
assign s = ((a ^ b) ^ cin);
assign cout = ((a & b) | (a & cin) | (b & cin));
endmodule // fullAdder

module soma (output s0,
						output s1,
					 	input a,
					 	input b,
						input op);
wire sx1, cout;

	xorGate bonanza (sx1, b, op);
	fullAdder danubio (s0, cout, a, sx1, op);
	xorGate bilara (s1, cout, op);
endmodule // fullAdder

module test_sumsub;
// ------------------------- definir dados
	reg a;
	reg b;
	reg op;
	wire s0;
	wire s1;
	
	soma soma1 (s0,s1,a,b,op);

// ------------------------- parte principal
initial begin
	a = 1'b0; b = 1'b1; op = 1'b0;
end

initial begin
	$display("Exemplo0031 - Guilherme Terra - 427407");
	$display("Test ALU's sum/sub");

  #1    $display("\n%b (+ ou -) %b com op %b = %b", a, b, op, s1, s0);
  #1  	a = 1'b0; b = 1'b1; op = 1'b0;
  #1    $display("\n%b (+ ou -) %b com op %b = %b", a, b, op, s1, s0);

end

endmodule // test_sumsub