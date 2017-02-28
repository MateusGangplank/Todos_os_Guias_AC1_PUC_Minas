// Guia 02 -  NAND - EXTRA
// Nome : Jessica Luisa Betonico Andrade
// Matricula : 412748

//-----------------------------------------------------

//-- Construindo NAND por NOR --

//-----------------------------------------------------

module nandgate(s, p, q);
	output s;
	input p, q;
	wire temp, temp1, temp2;
	
nor NAND1(temp, p);
nor NAND2(temp1, q);
nor NAND3(temp2, temp, temp1);

	assign s = ~(temp2 | temp2);
	
endmodule // nandgate

// ----------------------------------------------
// -- teste NAND gate --
//-----------------------------------------------

module testandogate;
	reg a, b;
	wire s;
	
	// instancia
	
nandgate NAND1 (s, a, b);
	
	// parte principal
	
initial begin
	 $display ("Guia_02_EXTRA -  Jessica Luisa Betonico Andrade -  412748");
	 $display("\n Teste NOR contruida por NANDS \n ");
	 $display("\n ~(a | b) = s\n");
	 $monitor(" ~(%b | %b)=%b", a,b,s);
	 		a=0; b=0;
			
	#1    a=1; b=0;
	#1		a=0; b=1;
	#1		a=1; b=1;
	
end

endmodule // testandogate