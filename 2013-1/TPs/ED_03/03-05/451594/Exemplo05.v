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

module q05 (output s0, input p, input q, input [2:0] chave);

wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14;



or (temp1, p, q);
and  (temp2, p, q);
multiplexador lol1  (temp9, temp1, temp2, chave[0]);
nor(temp3, p, q);
nand (temp4, p, q);
multiplexador lol2 (temp10, temp3, temp4, chave[0]);
xor (temp5, p, q);
xnor(temp6, p, q);
multiplexador lol3 (temp11, temp5, temp6, chave[0]);
not (temp7, p);
not (temp8, q);
multiplexador lol4 (temp12, temp7, temp8, chave[0]);

multiplexador lol5 (temp13, temp9, temp10, chave[1]);
multiplexador lol6 (temp14, temp11, temp12, chave[1]);
multiplexador lol7 (s0, temp13, temp14, chave[2]);


endmodule


module testq05;
reg [4:0]count;
reg [0:0]a,b;
reg [2:0]c;
wire [0:0]s0;

q05 Q05 (s0, a,b,c);

initial begin


a= 1'b0;b= 1'b0;c= 3'b000;

#1
$monitor("%3b %3b %3b = %3b", a, b,c, s0);
count = 0;
        repeat (31) begin
            count <= count + 1;
            #1 a<=count[4]; b<=count[3]; c[2]<=count[2]; c[1]<=count[1]; c[0]<=count[0]; 
				end

 

end
endmodule

// OBS.: SE POSSIVEL, TROCAR AS EXTENSOES PARA .v
//       FAVOR DEIXAR NOME E MATRICULA DENTRO DO ARQUIVO TAMBEM.









