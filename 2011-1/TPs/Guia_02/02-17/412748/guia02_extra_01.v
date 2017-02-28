// Guia 02 - NOR - EXTRA
// Nome: Jessica Luisa Betonico Andrade
// Matricula: 412748

//-----------------------------------------------
//-- Contruindo NOR por NANDS --
//-----------------------------------------------

module norgate(s, p, q);
	output s;
	input p, q;
	wire temp, temp1, temp2;
	
nand NAND1(temp, p);
nand NAND2(temp1, q);
nand NAND3(temp2, temp, temp1);

	assign s = ~(temp2 & temp2);
	
endmodule // norgate

// ----------------------------------------------
// -- teste NOR gate --
//-----------------------------------------------

module testnorgate;
	reg a, b;
	wire s;
	
	// instancia
	
norgate NOR1 (s, a, b);
	
	// parte principal
	
initial begin
	 $display ("Guia_02_EXTRA -  Jessica Luisa Betonico Andrade -  412748");
	 $display("\n Teste NOR contruida por NANDS \n ");
	 $display("\n ~(a & b) = s\n");
	 $monitor(" ~(%b & %b)=%b", a,b,s);
	 		a=0; b=0;
			
	#1    a=1; b=0;
	#1		a=0; b=1;
	#1		a=1; b=1;
	
end

endmodule // testandogate