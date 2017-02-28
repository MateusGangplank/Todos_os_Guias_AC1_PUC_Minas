// Exercicio 11 (Extra)
// Wadson Gomes Ferreira
// 460631

module onebit(output s, input[7:0] x);
       assign s = ~(x[0] | x[1] | x[2] | x[3] | x[4] | x[5] | x[6] | x[7]);
endmodule

module teste;
       reg[7:0] a=8'b00001111;
       wire s;
       onebit B1(s,a);
       initial begin
               #1
                 $display("Exercicio11 Extra - Wadson Gomes Ferreira - 460631");
                 $monitor("a=%b => s=%b",a,s);
               #1 a=8'b1;
               #1 a=8'haa;
               #1 a=8'b00000000;
       end
endmodule