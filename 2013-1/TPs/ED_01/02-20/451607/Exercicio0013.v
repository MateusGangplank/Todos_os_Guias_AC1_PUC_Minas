// Rafael Guimarães de Sousa - 451607

module andgate (output s, input  p, input q, input r);

assign s = q&p&r;

endmodule

module testandgate;

reg a,b,c;
wire s;

andgate AND1 (s, a, b, c);

initial begin:start

a=0;b=0;c=0;

end

initial begin:main

$display("Exercicio0013 - Rafael Guimarães de Sousa - 451607");
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

