// Exercicio02
// Wadson Gomes Ferreira
// 460631

module exercicio02;
       //alternativa a
       reg[6:0] a,b,c;
       //alternativa b
       reg[5:0] d,e,f;
       //alternativa c
       reg[10:0] g;
       reg[5:0] h;
       reg[3:0] i;
       //alternativa d
       reg[8:0] j,k;
       reg[6:0] l;
       //alternativa e
       reg[4:0] m,n;
       reg[6:0] p;
       reg[9:0] q;
       initial begin
               #1
                 a=7'b101010;
                 b=7'b11011;
                 c=a+b;
                 $display("\nAlternativa A\n %b(2) + %b(2) = %b(2)",a,b,c);
               #1
                 d=6'b11011;
                 e=6'o25;
                 f=d+e;
                 $display("\nAlternativa B\n %b(2) + %o(8) = %b(2)",d,e,f);
               #1
                 g=11'o1234;
                 h=6'h3c;
                 i=g/h;
                 $display("\nAlternativa C\n %o(8) / %h(16) = %4b(2)",g,h,i);
               #1
                 j=9'h1ba;
                 k=9'b101110001;
                 l=j-k;
                 $display("\nAlternativa D\n %h(16) - %b(2) = %7b(2)",j,k,l);
               #1
                 m=5'd25;
                 n=5'o32;
                 p=7'h7a;
                 q=(m*n)+p;
                 $display("\nAlternativa E\n %d(10) * %o(8) + %h(16) = %b(2)",m,n,p,q);

       end
endmodule
