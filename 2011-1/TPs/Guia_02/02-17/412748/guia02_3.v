// Guia 02 -NOT
// Nome: Jessica Luisa Betonico Andrade
// MAtricula: 412748

//-------------------------------------------------------

//-- Contruindo NOT por NANDs --

//-------------------------------------------------------

module notgate(s, p);
	output s;  // saida
	input p;		// entrada
	
	assign s = ~(p&p); 	//operação final

endmodule // notgate

//---------------------------------------------------

//--- teste NOT gate ---

module testandogate;
	reg q;
	wire s;
	
	//instancia

notgate NOT1 (s, q);

	// parte principal

initial begin
	$display("Guia_02_3 - Jessica Luisa Betonico Andrade - 412748");
   $display("Test NOT gate construida por NAND");
	$display("\n ~q = s \n");
   $monitor("~%b = %b", q , s);
		
		q=0;
	#1 q=1;
	
end

endmodule // testandogate
	