// Rafael Guimarães de Sousa - 451607

module nandgate (output s, input  p, input q);

assign s = ~(p & q);

endmodule

module testnandgate;

reg a,b;
wire s;

nandgate NAND1 (s, a, b);

initial begin:start

a=0;b=0;

end

initial begin:main

$display("Exercicio0006 - Rafael Guimarães de Sousa - 451607");
#1 $display("%b %b | %b",a,b,s);
a=0;b=1;
#1 $display("%b %b | %b",a,b,s);
a=1;b=0;
#1 $display("%b %b | %b",a,b,s);
a=1;b=1;
#1 $display("%b %b | %b",a,b,s);

end

endmodule

