//------------------
//Exemplo0035 - F4
//Matricula: 471906
//------------------

module ex35(output s,
            input a,b,c1,c2,c3);

 wire temp[0:16];

 not NOT1(temp[0], a);
 not NOT2(temp[1], b);
 or  OR1(temp[2], a,b);
 nor NOR1(temp[3], a,b);
 and AND1(temp[4], a,b);
 nand NAND1(temp[5], a,b);
 xor XOR1(temp[6], a,b);
 xnor XNOR1(temp[7], a,b);
// USAR PORTA not PARA ~c1, ~c2, ~c3 TAMBEM
 and AND2(temp[8],  temp[0],~c1,~c2,~c3);
 and AND3(temp[9],  temp[2],~c1,~c2,c3);
 and AND4(temp[10], temp[3],~c1,c2,~c3);
 and AND5(temp[11], temp[4],~c1,c2,c3);
 and AND6(temp[12], temp[5],c1,~c2,~c3);
 and AND7(temp[13], temp[6],c1,~c2,c3);
 and AND8(temp[14], temp[7],c1,c2,~c3);
 and AND9(temp[15], temp[1],c1,c2,c3);

 or ORf(temp[16], temp[8],temp[9],temp[10],temp[11],temp[12],temp[13],temp[14],temp[15]);

 assign s = temp[16];

endmodule


module teste;

reg a,b,c1,c2,c3;
wire s;

ex35 exercicio(s, a,b,c1,c2,c3);

initial begin:start
 a=0;b=0;c1=0;c2=0;c3=0;
end


initial begin:main
  $display("Exemplo0035 - Ana Paulo da Silva - 471906");
  
  $monitor("%b %b %b %b %b s:%b", a, b, c1, c2, c3, s);

#1 a= 0; b= 0; c1=0; c2=0; c3=0;
#1 a= 0; b= 0; c1=0; c2=0; c3=1;
#1 a= 0; b= 0; c1=0; c2=1; c3=0;
#1 a= 0; b= 0; c1=0; c2=1; c3=1;
#1 a= 0; b= 0; c1=1; c2=0; c3=0;
#1 a= 0; b= 0; c1=1; c2=0; c3=1;
#1 a= 0; b= 0; c1=1; c2=1; c3=0;
#1 a= 0; b= 0; c1=1; c2=1; c3=1;
#1 a= 0; b= 1; c1=0; c2=0; c3=0;
#1 a= 0; b= 1; c1=0; c2=0; c3=1;
#1 a= 0; b= 1; c1=0; c2=1; c3=0;
#1 a= 0; b= 1; c1=0; c2=1; c3=1;
#1 a= 0; b= 1; c1=1; c2=0; c3=0;
#1 a= 0; b= 1; c1=1; c2=0; c3=1;
#1 a= 0; b= 1; c1=1; c2=1; c3=0;
#1 a= 0; b= 1; c1=1; c2=1; c3=1;
#1 a= 1; b= 0; c1=0; c2=0; c3=0;
#1 a= 1; b= 0; c1=0; c2=0; c3=1;
#1 a= 1; b= 0; c1=0; c2=1; c3=0;
#1 a= 1; b= 0; c1=0; c2=1; c3=1;
#1 a= 1; b= 0; c1=1; c2=0; c3=0;
#1 a= 1; b= 0; c1=1; c2=0; c3=1;
#1 a= 1; b= 0; c1=1; c2=1; c3=0;
#1 a= 1; b= 0; c1=1; c2=1; c3=1;
#1 a= 1; b= 1; c1=0; c2=0; c3=0;
#1 a= 1; b= 1; c1=0; c2=0; c3=1;
#1 a= 1; b= 1; c1=0; c2=1; c3=0;
#1 a= 1; b= 1; c1=0; c2=1; c3=1;
#1 a= 1; b= 1; c1=1; c2=0; c3=0;
#1 a= 1; b= 1; c1=1; c2=0; c3=1;
#1 a= 1; b= 1; c1=1; c2=1; c3=0;
#1 a= 1; b= 1; c1=1; c2=1; c3=1;

end
endmodule
