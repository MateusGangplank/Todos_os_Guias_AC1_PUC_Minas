//------------------
// Exemplo0032 - F4
//Matricula: 471906
//------------------

module ex32(output s,
            input a,b,c);

 wire temp[0:4];

or OR1(temp[0], a, b);
and AND1(temp[1], a, b);

and AND2(temp[2], temp[0], ~c);
and AND3(temp[3], temp[1], c);


 or ORf(temp[4], temp[2],temp[3]);

 assign s = temp[4];

endmodule


module teste;

reg a,b,c;
wire s;

ex32 exercicio(s, a,b,c);

initial begin:start
 a=0;b=0;c=0;
end


initial begin:main
  $display(" Exemplo0032 - Ana Paula da Silva - 471906");
  
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
