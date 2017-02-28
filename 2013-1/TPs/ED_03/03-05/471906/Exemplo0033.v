//------------------
//Exemplo0033 - F4
//Matricula: 471906
//------------------

module ex33(output s,
            input a,b,c);

 wire temp[0:8];

or OR1(temp[0], a, b);
and AND1(temp[1], a, b);
nor NOR1(temp[2], a, b);
nand NAND(temp[3], a,b);

or OR1(temp[4], temp[0], temp[1]);
or OR1(temp[5], temp[2], temp[3]);
and AND2(temp[6], temp[4], ~c);
and AND3(temp[7], temp[5], c);


 or ORf(temp[8], temp[6],temp[7]);

 assign s = temp[8];

endmodule


module teste;

reg a,b,c;
wire s;

ex33 exercicio(s, a,b,c);

initial begin:start
 a=0;b=0;c=0;
end


initial begin:main
  $display("Exemplo0033 - Ana Paulo da Silva - 471906");
  
  $monitor("%b %b %b s:%b", a, b, c, s);

#1  a=0;  b=0;  c=0;
#1  a=0;  b=0;  c=1;
#1  a=0;  b=1;  c=0;
#1  a=0;  b=1;  c=1;
#1  a=1;  b=0;  c=0;
#1  a=1;  b=0;  c=1;
#1  a=1;  b=1;  c=0;
#1  a=1;  b=1;  c=1;

end
endmodule
