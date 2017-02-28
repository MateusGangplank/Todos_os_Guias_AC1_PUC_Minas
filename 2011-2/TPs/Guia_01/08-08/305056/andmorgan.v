// ------------------------- 
// and com 3 entradas usando a definicao de De Morgan
// Nome: Rama Alvim Sales Schiavo 
// Matricula: 305056 
// --------------------------

// -- or gate
module orgate (output s,
								input a,
								input b,
								input c);
	assign s = a | b | c;
endmodule// orgate
//  -- not gate
module notgate( output s,
							 input p);
assign s= ~p;
endmodule// notgate

// -- and gate De Morgan

module andgate;
reg a, b, c;
wire s0, s1, n1, n2, n3;

notgate NOT1(n1, a);

notgate NOT2(n2, b);

notgate NOT3(n3, c);

orgate OR1(s1, n1, n2, n3);

notgate NOT4(s0, s1);

initial begin:start
a=0; b=0; c=0;
end

initial begin
$display("ANDGATE 3 entradas por De Morgan - Rama Alvim Sales Schiavo -  305056");
$display("\n ~(~a | ~b | ~c ) = s\n");
$monitor("%b | %b | %b = %b", a, b, c, s0);

#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end
endmodule // andgate De Morgan