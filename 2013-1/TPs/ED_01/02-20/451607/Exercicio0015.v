// Rafael Guimarães de Sousa - 451607

module or1 (output s, input  p, input q);

assign s = p|q;

endmodule

module or2 (output s2, input  p, input q, input r);

or1 OR1 (s, p, q);
assign s2 = s|r;

endmodule

module testandgate;

reg a,b,c;
wire s;

or2 OR2 (s, a, b, c);

initial begin:start

a=0;b=0;c=0;

end

initial begin:main

$display("Exercicio0015 - Rafael Guimarães de Sousa - 451607");
$monitor("%b %b %b | %b",a,b,c,s);

#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end

endmodule

