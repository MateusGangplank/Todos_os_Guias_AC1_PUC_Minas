// Nome: Andre Sulivam 391998
// Guia 08 ex04

module notnand (saida,entrada);
	input entrada;
	output saida;
	
	nand NAND1 (saida,entrada);
endmodule //end notnand


module andnand (saida,e1,e2,e3);
	input e1,e2,e3;
	output saida;
	wire w1;
	
	nand NAND1 (w1,e1,e2,e3);
	nand NAND2 (saida,w1);
endmodule // end andnand


module ornand (saida,e1,e2,e3);
	input e1,e2,e3;
	output saida;
	wire w1,w2,w3;
	
	nand NAND1 (w1,e1);
	nand NAND2 (w2,e2);
	nand NAND3 (w3,e3);
	nand NAND4 (saida,w1,w2,w3);
endmodule// end ornand

module andnand2 (saida,e1,e2);
	input e1,e2;
	output saida;
	wire w1;
	
	nand NAND1 (w1,e1,e2);
	nand NAND2 (saida,w1);
endmodule //end andnand2	

module guia08;
	reg a,b,c,d;
	wire w1,w2,w3,w4,w5,w6,w7,w8;
	
	notnand NN1 (w1,a);
	notnand NN2 (w2,b);
	notnand NN3 (w3,c);
	notnand NN4 (w4,d);
	
	andnand2 AN1 (w5,w1,c);
	andnand AN2 (w6,a,b,w4);
	andnand AN3 (w7,a,w2,c);
	ornand ON1 (w8,w5,w6,w7);
	
initial begin:start
end

initial begin:main
 $display("Andre Sulivam 391998");
      $display("Guia 08 Ex:04\n");

$display ("a b c d = s\n");
	#1	a = 0; b= 0; c = 0; d = 0;
	$monitor ("%b %b %b %b = %b", a,b,c,d,		 w8);
	#1 a = 1;
	#1 a = 0; b = 1;
	#1 b = 0; c = 1;
	#1 c = 0; d = 1;
	#1 d = 0;
	#1 a = 1; b = 1; c = 1; d = 1;
	#1 a = 0; c = 0;
	#1 a = 1; c = 1;
	
end
endmodule

/*

    
    Andre Sulivam 391998
    Guia 08 Ex:04
    
    a b c d = s
    
    0 0 0 0 = 0
    1 0 0 0 = 0
    0 1 0 0 = 0
    0 0 1 0 = 1
    0 0 0 1 = 0
    0 0 0 0 = 0
    1 1 1 1 = 0
    0 1 0 1 = 0
    1 1 1 1 = 0

*/