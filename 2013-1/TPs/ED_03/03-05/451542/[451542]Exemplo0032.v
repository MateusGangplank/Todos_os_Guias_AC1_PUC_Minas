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

module exemplo0032(output s, input p, input q, input chave);

wire temp1, temp2;

and(temp1, p, q);
or (temp2, p, q);
multiplexador MULT(s, temp1, temp2, chave);

endmodule

module testexemplo0032;
reg a, b, c;
wire s;

exemplo0032 Q02(s, a, b, c);

initial begin
a = 'b0;
b = 'b0;
c = 'b0;

#1$monitor("%3b %3b %3b = %3b", a, b, c, s);

#1a= 'b0;b= 'b0;c= 'b1;
#1a= 'b0;b= 'b1;c= 'b0;
#1a= 'b0;b= 'b1;c= 'b1;
#1a= 'b1;b= 'b0;c= 'b0;
#1a= 'b1;b= 'b0;c= 'b1;
#1a= 'b1;b= 'b1;c= 'b0;
#1a= 'b1;b= 'b1;c= 'b1;

end
endmodule