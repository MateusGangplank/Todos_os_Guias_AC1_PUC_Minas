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

module q02 (output s, input p, input q, input chave);

wire temp1, temp2;

and(temp1, p, q );
or (temp2, p, q );
multiplexador lol(s, temp1, temp2, chave);

endmodule

module testq02;
reg a,b,c;
wire s;

q02 Q02 (s, a,b,c);

initial begin

a= 'b0;
b= 'b0;
c= 'b0;

#1
$monitor("%3b %3b %3b = %3b", a, b, c, s);
#1a= 'b0;b= 'b0;c= 'b1;

#1a= 'b0;b= 'b1;c= 'b0;

#1a= 'b0;b= 'b1;c= 'b1;

#1a= 'b1;b= 'b0;c= 'b0;

#1a= 'b1;b= 'b0;c= 'b1;

#1a= 'b1;b= 'b1;c= 'b0;

#1a= 'b1;b= 'b1;c= 'b1;






end
endmodule
