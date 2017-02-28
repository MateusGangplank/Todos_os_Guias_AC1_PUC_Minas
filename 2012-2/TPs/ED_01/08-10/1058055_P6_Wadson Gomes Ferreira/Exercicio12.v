// Exercicio 12 (Extra)
// Wadson Gomes Ferreira
// 460631

module onebit(output s, input[7:0] x);
       assign s = x[0] | x[1] | x[2] | x[3] | x[4] | x[5] | x[6] | x[7];
endmodule

module teste;
       reg[7:0] b=8'hff;
       wire s;
       onebit B1(s,b);
       initial begin
               #1
                 $display("Exercicio12 Extra - Wadson Gomes Ferreira - 460631");
                 $monitor("b=%b => s=%b",b,s);
               #1 b=8'b0101_0101;
               #1 b=8'o7;
               #1 b=8'b0;
       end
endmodule