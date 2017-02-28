// -------------------------
// Exemplo0024
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

module compdif (output s, 
                 input [5:0]a, 
                 input [5:0]b); 
		wire [5:0]Sxor;

	xnor XNOR1 [5:0] (Sxor,a,b);
	// [0:0] = [0]
	nand NAND1 (s,Sxor[0:0],Sxor[1:1],Sxor[2:2],Sxor[3:3],Sxor[4:4],Sxor[5:5]);


endmodule //compdif;

	module test_compdif; 
	
// ------------------------- definir dados 
           reg [5:0] x; 
           reg [5:0] y; 
           wire s; 

 
			  
	compdif ERROR (s,x,y);
		
// ------------------------- parte principal
 initial begin
 		x = 6'b000000;		y=6'b111111;
		
   $display("Exemplo0021 - Wender Zacarias Xavier - 427472");
	$display("Test Comparador Diferença");
	$display("\n *** Resultado ***  ");
	$monitor("x = %b 	 y = %b 	Igualdade = %b",x,y,s);

#1 x=6'b001111;	y = 6'b111011;
#1 x=6'b001111;	y = 6'b001111;
#1 x=6'b010011;	y = 6'b110011;

	
		end

endmodule //circ
