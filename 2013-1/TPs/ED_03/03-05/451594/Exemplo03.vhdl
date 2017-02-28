//
//
//
//
//

module multiplexador (output s, input p, input q, input chave);

wire tmp1, tmp2, tmp3;

not(tmp3,chave);
and(tmp1, p, tmp3);
and(tmp2, q, chave);
or (s, tmp1, tmp2);

endmodule

module q03 (output s0, output s1, input p, input q, input chave);

wire temp1, temp2, temp3, temp4;

and  (temp1, p, q);
nand (temp2, p, q);
multiplexador lol  (s0, temp1, temp2, chave);
or  (temp3, p, q);
nor (temp4, p, q);
multiplexador lols (s1, temp3, temp4, chave);

endmodule


module testq03;

reg a,b,c;
wire s0, s1;

q03 Q03 (s0,s1, a,b,c);

initial begin


a= 'b0;
b= 'b0;
c= 'b0;

#1
$monitor("%3b %3b %3b = %3b |%3b", a, b, c, s0, s1);
#1a= 'b0;b= 'b0;c= 'b1;

#1a= 'b0;b= 'b1;c= 'b0;

#1a= 'b0;b= 'b1;c= 'b1;

#1a= 'b1;b= 'b0;c= 'b0;

#1a= 'b1;b= 'b0;c= 'b1;

#1a= 'b1;b= 'b1;c= 'b0;

#1a= 'b1;b= 'b1;c= 'b1;



end
endmodule









