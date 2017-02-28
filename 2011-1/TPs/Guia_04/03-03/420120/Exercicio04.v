// Nome: Isabella Gonçales
// Matrícula: 420120

module xornor (saida,e1,e2);
output saida;
input e1,e2;
wire temp1,temp2,temp3,temp4;

nor NOR1 (temp1,e1,e1);
nor NOR2 (temp2,e2,e2);
nor NOR3	(temp3,temp1,temp2);
nor NOR4	(temp4,e1,e2);
nor NOR5	(saida,temp3,temp4);

endmodule

module notnor (saida,e);
output saida;
input e;

nor NOR1 (saida,e,e);

endmodule

module andnor (sinal,e2,temp1);
output sinal;
input e2,temp1;
wire temp2,temp3;

nor NOR1 (temp2,e2,e2);
nor NOR2 (temp3,temp1,temp1);
nor NOR3 (sinal,temp2,temp3);

endmodule

module metodoMeiaDiferencaNor (saida,sinal,e1,e2);
output saida,sinal;
input e1,e2;
wire temp1,temp2;

xornor XOR1 (saida,e1,e2);
notnor NOT1 (temp1,e1);
andnor AND1 (sinal,temp1,e2);

endmodule

module testmeiadiferenca;
reg e1,e2;
wire saida,sinal;

metodoMeiaDiferencaNor MeiaDiferenca (saida,sinal,e1,e2);

initial begin : start
        e1=0;   e2=0;
		  
end

initial begin : main

      $display("Circuito Meia-Diferenca com portas NOR");
		#1 $display("  e1 - e2 =  sinal  saida ");
		#1 $monitor("  %d - %d =   %d    %d", e1,e2,sinal,saida);

		#1 e1 = 0; e2 = 1;
		#1 e1 = 1; e2 = 0;
		#1 e1 = 1; e2 = 1;

end

endmodule



/*     
    Circuito Meia-Diferenca com portas NOR
      e1 - e2 =  sinal  saida 
      0 - 0 =   0    0
      0 - 1 =   1    1
      1 - 0 =   0    1
      1 - 1 =   0    0
    
     ----jGRASP: operation complete.
    
*/