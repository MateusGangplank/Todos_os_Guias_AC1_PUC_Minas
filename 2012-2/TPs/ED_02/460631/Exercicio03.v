// Exercicio03
// Wadson Gomes Ferreira
// 460631

module complemento;
       //alternativa a
       reg[5:0] a;
       reg[4:0] b;
       //alternativa b
       reg[4:0] c;
       reg[3:0] d;
       //alternativa c
       reg[4:0] e,f;
       //alternativa d
       reg[5:0] g;
       reg[4:0] h;
       //alternativa e
       reg[4:0] i;
       reg[5:0] j,k;
       reg[3:0] l;
       initial begin
               #1
                 a=6'b100110;
                 b=~a+1;
                 $display("\nAlternativa A\nC2(%b(2)) = %b(2)",a,b);
               #1
                 c=5'o24;
                 d=~c+1;
                 $display("\nAlternativa B\nC2(%b(2)) = %b(2)",c,d);
               #1
                 e=25;
                 f=~a+1;
                 $display("\nAlternativa C\nC2(%b(2)) = %b(2)",e,f);
               #1
                 g=6'h2d;
                 h=~g+1;
                 $display("\nAlternativa D\nC2(%b(2)) = %b(2)",g,h);
               #1
                 i=27;
                 j=37;
                 k=i-j;
                 l=~k+1;
                 $display("\nAlternativa E\nC2(%b(2) - %b(2) = %b(2)) = %b(2)",i,j,k,l);
       end
endmodule