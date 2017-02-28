// ------------------------- 
// or com 3 entradas usando a definicao de De Morgan
// Nome: Rama Alvim Sales Schiavo 
// Matricula: 305056 
// --------------------------

// -- and gate
module andgate (output s,
								input a,
								input b,
								input c);
	assign s = a & b & c;
endmodule// andgate
//  -- not gate
module notgate( output s,
							 input p);
assign s= ~p;
endmodule// notgate

// --  orgate De Morgan

module norgate;
reg a, b, c;
wire n1, n2, n3, s1, s2;

notgate NOT1(n1, a);
notgate NOT2(n2, b);
notgate NOT3(n3, c);
andgate AND1(s1, n1, n2, n3);
notgate NOT4(s2, s1);

initial begin:start
a=0; b=0; c=0;
end

initial begin
$display("NORGATE 3 entradas por De Morgan - Rama Alvim Sales Schiavo -  305056");
$display("\n ~( ~a & ~b & ~c ) = s\n");
$monitor("%b & %b & %b = %b", a, b, c, s2);

#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end
endmodule // norgate De Morgan