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

module q04 (output s0, input p, input q, input [1:0] chave);

wire temp1, temp2, temp3, temp4, temp5, temp6;

xor  (temp1, p, q);
or (temp2, p, q);
multiplexador lol  (temp5, temp1, temp2, chave[0]);
xnor  (temp3, p, q);
nor (temp4, p, q);
multiplexador lols (temp6, temp3, temp4, chave[0]);
multiplexador lol3 (s0, temp5, temp6, chave[1]);

endmodule


module testq04;

reg a,b;
reg [1:0]c;
wire s0;

q04 Q03 (s0, a,b,c);

initial begin


a= 'b0;
b= 'b0;
c= 'b00;

#1
$monitor("%3b %3b %3b = %3b", a, b,c, s0);
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









