//Nome: Isabella Gonçales
//Matrícula: 420120

module metodomeiasomanand ( carry,saida,e1,e2 );

output carry,saida;
input e1,e2;
wire temp1,temp2,temp3,temp4,temp5;

nand NAND1 ( temp1,e1,e1 );
nand NAND2 ( temp2,e2,e2 );
nand NAND3 ( temp3,temp1,temp2 );
nand NAND4 ( temp4,e1,e2 );
nand NAND5 ( carry,temp4 );
nand NAND6 ( temp5,temp3,temp4 );
nand NAND7 ( saida,temp5,temp5 );

endmodule

module testmeiasomanand;
reg e1,e2;
wire carry,s;

metodomeiasomanand meiasoma ( carry,saida,e1,e2 );

initial begin:start
        e1=0; e2=0;
		  
end

initial begin: main
 #1 $display (" Circuito meia-soma com portas NAND ");
 #1 $display (" e1 + e2 = carry  saida ");
    $monitor (" %b  + %b  =  %b   %b ", e1,e2,carry,saida );
   #1  e1=0;  e2=1;
	#1  e1=1;  e2=0;   
	#1  e1=1;  e2=1;
	
end
endmodule



/* Registrando os Resultados

  
     Circuito meia-soma com portas NAND 
     e1 + e2 = s  carry 
     0  + 0  =  0   0 
     0  + 1  =  1   0 
     1  + 0  =  1   0 
     1  + 1  =  0   1 
    
     ----jGRASP: operation complete.
 */