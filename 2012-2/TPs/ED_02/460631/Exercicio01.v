// Exercicio01
// Wadson Gomes Ferreira
// 460631

module exercicio01;
       //alternativa a
       reg[4:0] a,b,c;
       //alternativa b
       reg[4:0] d,e,f;
       //alternativa c
       reg[4:0] g,h;
       reg[2:0] i;
       //alternativa d
       reg[3:0] j,k,l;
       //alternativa e
       reg[4:0] m,n,o,p,q;
       initial begin
               #1 a=2; b=14;
                  c=a+b;
                  $display("2 + 14 = %b",c);
               #1 d=3; e=9;
                  f=d*e;
                  $display("3 * 9 = %b",f);
               #1 g=32; h=5;
                  i=32/5;
                  $display("32 / 5 = %b",i);
               #1 j=24; k=11;
                  l=j-k;
                  $display("24 - 11 = %b",l);
               #1 m=2; n=6; o=7; p=1;
                  q=(2*6)+7-1;
                  $display("24 - 11 = %b",q);

       end
endmodule
