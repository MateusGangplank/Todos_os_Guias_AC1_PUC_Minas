// Exercicio06
// Wadson Gomes Ferreira
// 460631

module complementoUm(output[7:0] s,input[7:0] a);
       /*
       reg[7:0] temp;
       assign s=temp;
       integer contador;
       initial begin
               for(contador=0; contador<8; contador=contador+1)
               begin
                    temp[contador]=~a[contador];
               end
       end
       */
       //A estrutura acima deixa todos os bits indeterminas. ????
       assign s=~a;
endmodule

module teste;
        reg[7:0] teste;
        wire[7:0] saida;
        complementoUm C1(saida,teste);
        initial begin
                #1 //declarando monitor, valores indeterminados. (x)
                $monitor("entrada=%b -> saida=%b",teste,saida);
                #1 //teste 1
                teste=8'b10101010;
                #1 //teste 2
                teste=8'b11111110;
                #1 //teste 3
                teste=8'b10001000;
        end
endmodule
