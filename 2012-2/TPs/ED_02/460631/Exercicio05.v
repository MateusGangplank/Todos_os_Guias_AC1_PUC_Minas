// Exercicio05
// Wadson Gomes Ferreira
// 460631

module complemento(output[7:0] s,input[7:0] a);
       assign s = ~a+1;
endmodule

module exercicio;
       reg[7:0] a,b,d;
       wire[7:0] c;
       complemento C2(c,b);
       initial begin
               //inicializašao e teste
               #1
                 a=0; b=0; d=a+c;
                 $display("a=%b - b=%b => d=%b  (c=%b)",a,b,d,c);

               //alternativa a
               #1
                 a=8'b00101010;
                 b=8'b00001001;
               #1
                 d=a+c;
                 $display("a=%b - b=%b => d=%b  (c=%b)",a,b,d,c);

               //alternativa b
               #1
                 a=8'b00011011;
                 b=8'o15;
               #1
                 d=a+c;
                 $display("a=%b - b=%b => d=%b  (c=%b)",a,b,d,c);

               //alternativa c
               #1
                 a=8'o34; //11100
                 b=8'hc; //1100
               #1
                 d=a+c;
                 $display("a=%b - b=%b => d=%b  (c=%b)",a,b,d,c);

               //alternativa d
               #1
                 a=8'hda; //11011010
                 b=8'b10111001; //10111001
               #1
                 d=a+c;
                 $display("a=%b - b=%b => d=%b  (c=%b)",a,b,d,c);
                 
               //alternativa e
               #1
                 a=27; //00011011
                 b=8'h1b; //00011011 -> 11100100 + 1 -> 11100101 -> 100000000
               #1
                 d=a+c;
                 $display("a=%b - b=%b => d=%b  (c=%b)",a,b,d,c);

       end
endmodule
