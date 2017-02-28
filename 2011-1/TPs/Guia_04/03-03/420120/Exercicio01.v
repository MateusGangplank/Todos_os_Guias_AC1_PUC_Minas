// Nome: Isabella Gonçales
// Matricula: 420120

module ornand (saida,e1,e2);
output saida;
input e1,e2;
wire temp1,temp2;

nand NAND1 (temp1,e1,e1);
nand NAND2 (temp2,e2,e2);
nand NAND3 (saida,temp1,temp2);

endmodule

module andnand (saida,e1,e2);
output saida;
input e1,e2;
wire temp1;

nand NAND1 (temp1,e1,e2);
nand NAND2 (saida,temp1,temp1);

endmodule

module notnand (saida,e);
output saida;
input e;

nand NAND1 (saida,e,e);

endmodule

// metodo para chamar as funçoes,em uma meia-soma temos
// 2 portas and, 1 porta not e uma or. Portanto vamos chamar
// a porta andnand 2 vezes.

module metodoMeiaSomaNands (soma,carry,e1,e2);
output soma,carry;
input e1,e2;
wire temp1,temp2;

ornand   OR1  (temp1,e1,e2);
andnand  AND1 (carry,e1,e2 );
notnand  NOT1 (temp2,carry);
andnand  AND2 (soma,temp1,temp2);

endmodule

module testmeiasomanand;
reg e1,e2;
wire soma,carry;


metodoMeiaSomaNands meiasoma (soma,carry,e1,e2);

initial begin: start
		e1 = 0;  e2 = 0;
		
end


initial begin:main

		$display("Circuito Meia-soma com portas NAND");
		#1 $display("  a + b =  carry  soma");
		#1 $monitor("  %d + %d =   %d    %d", e1,e2,carry,soma);

		#1 e1 = 0; e2 = 1;
		#1 e1 = 1; e2 = 0;
		#1 e1 = 1; e2 = 1;

end

endmodule


  
 /*   Circuito Meia-soma com portas NAND
      a + b =  carry  soma
      0 + 0 =   0    0
      0 + 1 =   0    1
      1 + 0 =   0    1
      1 + 1 =   1    0
    
     ----jGRASP: operation complete. 
 */
    
