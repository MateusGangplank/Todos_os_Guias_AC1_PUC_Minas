//-----------------------
//TP03 - 45142
//-----------------------

module multiplexador(output s, input p, input q, input r);

wire temp1, temp2, temp3;

not(temp3, r);
and(temp1, p, temp3);
and(temp2, q, r);
or (   s,temp1, temp2);

endmodule

module exemplo0033(output s,	output s1, input p, input q, input chave);

wire temp1, temp2, temp3, temp4;

and(temp1, p, q);
nand(temp2, p, q);
or (temp3, p, q);
nor(temp4, p, q);

multiplexador MULT(s, temp1, temp2, chave);
multiplexador MULT2(s1, temp3, temp4, chave);

endmodule

module testexemplo0033;
reg a, b, c;
wire s, s1;

exemplo0033 Q03(s, s1, a, b, c);

initial begin
a = 'b0;
b = 'b0;
c = 'b0;

#1$monitor("%3b %3b %3b = %3b %3b", a, b, c, s, s1);

#1a= 'b0;b= 'b0;c= 'b1;
#1a= 'b0;b= 'b1;c= 'b0;
#1a= 'b0;b= 'b1;c= 'b1;
#1a= 'b1;b= 'b0;c= 'b0;
#1a= 'b1;b= 'b0;c= 'b1;
#1a= 'b1;b= 'b1;c= 'b0;
#1a= 'b1;b= 'b1;c= 'b1;

end
endmodule