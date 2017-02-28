// Rafael Guimarães de Sousa - 451607

module xnorgate (output s, input  p, input q);

assign s = ~(p ^ q);

endmodule

module testxnorgate;

reg a,b;
wire s;

xnorgate XNOR1 (s, a, b);

initial begin:start

a=0;b=0;

end

initial begin:main

$display("Exercicio0008 - Rafael Guimarães de Sousa - 451607");
$monitor("%b %b | %b",a,b,s);

#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end

endmodule

