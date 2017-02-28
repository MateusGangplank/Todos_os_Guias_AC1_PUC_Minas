// ------------------------- 
// Exemplo0032 - SUM/SUB 
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

module xnorGate (output i,
					  input a,
					  input b);
assign i = ~(a ^ b);
endmodule // xnorGate

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
	xnorGate fox (i, s0, s1);

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0032 - Guilherme Terra - 427407"); 
	$display("Test ALU's sum/sub"); 

	a = 1'b0; b = 1'b0; op = 1'b0;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b igual a 0? %b", a, b, op, s1, s0, i);
	a = 1'b0; b = 1'b1; op = 1'b0;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b igual a 0? %b", a, b, op, s1, s0, i);
	a = 1'b1; b = 1'b0; op = 1'b0;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b igual a 0? %b", a, b, op, s1, s0, i);
	a = 1'b1; b = 1'b1; op = 1'b0;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b igual a 0? %b", a, b, op, s1, s0, i);
	a = 1'b1; b = 1'b0; op = 1'b1;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b igual a 0? %b", a, b, op, s1, s0, i);
	a = 1'b1; b = 1'b1; op = 1'b1;
#1	$display("\n%b (+ ou -) %b com op %b = %b%b igual a 0? %b", a, b, op, s1, s0, i);

end 

endmodule // test_sumsub 

/*
testes

Test ALU's sum/sub

0 (+ ou -) 0 com op 0 = 00 igual a 0? 1

0 (+ ou -) 1 com op 0 = 01 igual a 0? 0

1 (+ ou -) 0 com op 0 = 01 igual a 0? 0

1 (+ ou -) 1 com op 0 = 10 igual a 0? 0

1 (+ ou -) 0 com op 1 = 01 igual a 0? 0

1 (+ ou -) 1 com op 1 = 00 igual a 0? 1
*/