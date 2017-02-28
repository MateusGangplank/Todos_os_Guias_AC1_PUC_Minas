// Nome: Isabella Gonçales
// Matrícula: 420120

module metodomeiasoma(saida,carry,e1,e2);
output saida,carry;
input e1,e2;

xor xor1 (saida,e1,e2);
and and1 (carry,e1,e2);

endmodule


module metodosomacompleta (soma,carryout,e1,e2,carryin);
output soma,carryout;
input e1,e2,carryin;
wire carry2;

metodomeiasoma MeiaSoma1 (saida,carry,e1,e2);
metodomeiasoma MeiaSoma2 (soma,carry2,saida,carryin);
or OR1 (carryout,carry2,carry);


endmodule


module testsomacompleta;
reg e1,e2,carryin;
wire soma,carryout;

metodosomacompleta SomaCompleta (soma,carryout,e1,e2,carryin);


initial begin: start
		e1 = 0;  e2 = 0; carryin=0;
		
end


initial begin:main

		$display("Circuito Soma Completa ");
		#1 $display("  e1 + e2  + carryin =  soma  carryout ");
		#1 $monitor("  %d + %d  +  %d    =         %d      %b", e1,e2,carryin,soma,carryout);

		#1 e1 = 0; e2 = 0; carryin=1;
		#1 e1 = 0; e2 = 1; carryin=0;
		#1 e1 = 0; e2 = 1; carryin=1;
		#1 e1 = 1; e2 = 0; carryin=0;
		#1 e1 = 1; e2 = 0; carryin=1;
		#1 e1 = 1; e2 = 1; carryin=0;
		#1 e1 = 1; e2 = 1; carryin=1;

end

endmodule


/*  Circuito Soma Completa 
      e1 + e2  + carryin =  soma  carryout 
      0 + 0  +  0    =         0      0
      0 + 0  +  1    =         1      0
      0 + 1  +  0    =         1      0
      0 + 1  +  1    =         0      1
      1 + 0  +  0    =         1      0
      1 + 0  +  1    =         0      1
      1 + 1  +  0    =         0      1
      1 + 1  +  1    =         1      1
    
     ----jGRASP: operation complete.
    
*/

