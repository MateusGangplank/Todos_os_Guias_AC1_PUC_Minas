//-----------------------
//Felipe Cássio - 451552
//-----------------------

module multiplexador(output s, input p, input q, input r);

wire temp1, temp2, temp3;

not(temp3,            r);
and(temp1,     p, temp3);
and(temp2,     q,     r);
or (    s, temp1, temp2);

endmodule

module exemplo0035(output s, input p, input q, input [2:0]chave);

wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14;

or  (temp1, p, q);
and (temp2, p, q);
nor (temp3, p, q);
nand(temp4, p, q);
xor (temp5, p, q);
xnor(temp6, p, q);
not (temp7,    p);
not (temp8,    q);

multiplexador MULT ( temp9,   temp1,  temp2, chave[0]);
multiplexador MULT2(temp10,   temp3,  temp4, chave[0]);
multiplexador MULT3(temp11,   temp5,  temp6, chave[0]);
multiplexador MULT4(temp12,   temp7,  temp8, chave[0]);
multiplexador MULT5(temp13,   temp9, temp10, chave[1]);
multiplexador MULT6(temp14,  temp11, temp12, chave[1]);
multiplexador MULT7(     s,  temp13, temp14, chave[2]);

endmodule

module testexemplo0035;
reg[0:0]     a;
reg[0:0]     b;
reg[4:0] count;
reg[2:0]     c;
wire[0:0]    s;

exemplo0035 Q05(s, a, b, c);

initial begin
a= 1'b0;
b= 1'b0;
c= 3'b000;

#1 $monitor("%3b %3b %3b = %3b", a, b, c, s);

count = 0;
	repeat(31)begin
		count <= count+1;
		
		#1 a<=count[4]; b<=count[3]; c[2]<=count[2]; c[1]<=count[1];c[0]<=count[0];

	end
end
endmodule