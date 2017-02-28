
module SubtratorMeio (s0,s1,e1,e2);
       input e1,e2;
       output s0,s1;

       xor XOR1 (s0,e1,e2);
       and AND1 (s1,~e1,e2);
endmodule

module SubtratorCompleto2bits (s0,s1,e1,e2,e3);
       input e1,e2,e3;
       output s0,s1;

       SubtratorMeio HS1 (f1,f2,e1,e2);
       SubtratorMeio HS2 (s0,f3,f1,e3);
       or OR1 (s1,f3,f2);
endmodule //2bits

module SomaMeia (s0,s1,e1,e2);
       input e1,e2;
       output s0,s1;

       and AND1 (s1,e1,e2);
       xor XOR1 (s0,e1,e2);
endmodule

module SomaCompleta (s0,s1,e1,e2,e3);
       input e1,e2,e3;
       output s0,s1;
       wire   b,d,c;

       SomaMeia HA1 (b,d,e2,e3);
       SomaMeia HA2 (s0,c,e1,b);

       or OR1 (s1,c,d);
endmodule //2bits

module SomaCompleta4bits (s,overflow,a,b);
       output overflow;
       output [3:0] s;
       input [3:0] a,b;

       SomaCompleta SC1 (c1,s[0],a[0],b[0],0);
       SomaCompleta SC2 (c3,s[1],a[1],b[1],c1);
       SomaCompleta SC3 (c5,s[2],a[2],b[2],c3);
       SomaCompleta SC4 (overflow,s[3],a[3],b[3],c5);
endmodule

module ALU (s,a,b);
       output overflow;
       output [3:0] s;
       input [3:0] a,b;

       SomaCompleta SC1 (c1,s[0],a[0],b[0],0);
       SomaCompleta SC2 (c3,s[1],a[1],b[1],c1);
       SomaCompleta SC3 (c5,s[2],a[2],b[2],c3);
       SomaCompleta SC4 (overflow,s[3],a[3],b[3],c5);



endmodule