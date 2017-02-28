// Rafael Guimarães de Sousa - 451607

module xorgate (output s, input  p, input q);

assign s = ~p&q + p&~q;

endmodule

module testxorgate;

reg a,b;
wire s;

xorgate XOR1 (s, a, b);

initial begin:start

a=0;b=0;

end

initial begin:main

$display("Exercicio0011 - Rafael Guimarães de Sousa - 451607");
$monitor("%b %b | %b",a,b,s);

#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end

endmodule

