// -------------------------
// Exemplo0023
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

module compigual (output s, 
                 input [5:0]a, 
                 input [5:0]b); 
		wire [5:0]Sxor;
		wire comp1;
		wire comp2;
		wire comp3;
		wire comp4;

	xnor XNOR1 [5:0] (Sxor,a,b);
	and AND1 (comp1,Sxor[0:0],Sxor[1:1]);
	and AND2 (comp2,Sxor[2:2],Sxor[3:3]);
	and AND3 (comp3,Sxor[4:4],Sxor[5:5]);
	and AND4 (comp4,comp1,comp2);
	and AND5 (s,comp4,comp3);


endmodule //compigual;

	module test_compigual; 
	
// ------------------------- definir dados 
           reg [5:0] x; 
           reg [5:0] y; 
           wire s; 

 
			  
	compigual ERROR (s,x,y);
		
// ------------------------- parte principal
 initial begin
 		x = 6'b000000;		y=6'b111111;
		
   $display("Exemplo0021 - Wender Zacarias Xavier - 427472");
	$display("Test Comparador Igualdade");
	$display("\n *** Resultado ***  ");
	$monitor("x = %b 	 y = %b 	Igualdade = %b",x,y,s);

#1 x=6'b001111;	y = 6'b111011;
#1 x=6'b001111;	y = 6'b001111;
#1 x=6'b010011;	y = 6'b110011;

	
		end

endmodule //circ
