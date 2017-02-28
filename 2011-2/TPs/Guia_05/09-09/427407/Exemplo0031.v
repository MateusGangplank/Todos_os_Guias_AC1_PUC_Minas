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
assign sx = (a ^ b);
endmodule // xorGate

module fullAdder (output s,
						output cout,
					 	input a,
					 	input b,
						input cin);
assign s = ((a ^ b) ^ cin);
assign cout = ((a & b) | (a & cin) | (b & cin));
endmodule // fullAdder

module test_sumsub; 
// ------------------------- definir dados 
	reg a; 
	reg b;
	reg op;
	wire s0; 
	wire s1;
	xorGate bonanza (sx1, b, op);
	fullAdder danubio (s0, cout, sx1, a, op);
	xorGate bilara (s1, cout, op);

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0031 - Guilherme Terra - 427407"); 
	$display("Test ALU's sum/sub"); 

	a = 1'b0; b = 1'b1; op = 1'b0;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b", a, b, op, s1, s0);
	a = 1'b1; b = 1'b0; op = 1'b0;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b", a, b, op, s1, s0);
	a = 1'b1; b = 1'b1; op = 1'b0;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b", a, b, op, s1, s0);
	a = 1'b1; b = 1'b0; op = 1'b1;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b", a, b, op, s1, s0);
	a = 1'b0; b = 1'b1; op = 1'b1;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b", a, b, op, s1, s0);

end 

endmodule // test_sumsub 

/*
testes

 Test ALU's sum/sub
 
 0 (+ ou -) 1 com op 0 = 01
 
 1 (+ ou -) 0 com op 0 = 01
 
 1 (+ ou -) 1 com op 0 = 10
 
 1 (+ ou -) 0 com op 1 = 01
 
 0 (+ ou -) 1 com op 1 = 11
*/