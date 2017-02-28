//-----------------------
//Felipe Cássio - 451552
//-----------------------

module multiplexador(output s, input p, input q, input r);

wire temp1, temp2, temp3;

not(temp3, r);
and(temp1, p, temp3);
and(temp2, q, r);
or (   s,temp1, temp2);

endmodule

module exemplo0034(output s, input p, input q, input [1:0]chave);

wire temp1, temp2, temp3, temp4, tem5, temp6;

xor  (temp1, p, q);
or   (temp2, p, q);
xnor (temp3, p, q);
nor  (temp4, p, q);

multiplexador MULT (temp5, temp1, temp2, chave[0]);
multiplexador MULT2(temp6, temp3, temp4, chave[0]);
multiplexador MULT3(    s, temp5, temp6, chave[1]);

endmodule

module testexemplo0034;
reg a, b;
reg [1:0]c;
wire s;

exemplo0034 Q04(s, a, b, c);

initial begin
a= 'b0;
b= 'b0;
c= 'b00;

#1 $monitor("%3b %3b %3b = %3b", a, b, c, s);

#1a= 'b0;b= 'b0;c= 'b01;
#1a= 'b0;b= 'b0;c= 'b10;
#1a= 'b0;b= 'b0;c= 'b11;
#1a= 'b0;b= 'b1;c= 'b00;
#1a= 'b0;b= 'b1;c= 'b01;
#1a= 'b0;b= 'b1;c= 'b10;
#1a= 'b0;b= 'b1;c= 'b11;
#1a= 'b1;b= 'b0;c= 'b00;
#1a= 'b1;b= 'b0;c= 'b01;
#1a= 'b1;b= 'b0;c= 'b10;
#1a= 'b1;b= 'b0;c= 'b11;
#1a= 'b1;b= 'b1;c= 'b00;
#1a= 'b1;b= 'b1;c= 'b01;
#1a= 'b1;b= 'b1;c= 'b10;
#1a= 'b1;b= 'b1;c= 'b11;

end
endmodule