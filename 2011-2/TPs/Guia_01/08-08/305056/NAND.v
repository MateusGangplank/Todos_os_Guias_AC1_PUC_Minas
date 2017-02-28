// ------------------------- 
// NAND com 2 entradas
// Nome: Rama Alvim Sales Schiavo 
// Matricula: 305056 
// --------------------------

//  -- not gate
module notgate( output s,
							 input p);
assign s= ~p;
endmodule// notgate

// -- and gate
module andgate (output s,
								input a,
								input b);
	assign s = a & b;
endmodule// andgate

// ------------
// --- nand gate
// ------------
module nandgate;
reg a, b;
wire s1, s2;

andgate AND1(s1, a, b);
notgate NOT1(s2, s1);

initial begin:start
a=0; b=0;
end

initial begin
$display("NANDGATE - Rama Alvim Sales Schiavo -  305056");
$display("\na & b = s2\n");
a=0; b=0;

#1 $display("%b &%b = %b", a, b, s2);
	a=0; b=1;
#1 $display("%b &%b = %b", a, b, s2);
	a=1; b=0;
#1 $display("%b &%b = %b", a, b, s2);
	a=1; b=1;
#1 $display("%b &%b = %b", a, b, s2);
end

endmodule // nandgate
