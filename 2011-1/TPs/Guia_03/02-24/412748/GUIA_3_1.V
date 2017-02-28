// Guia 03_01 - Meia SOma
// Nome: jessica Luisa Betonico Andrade
// MAtricula: 412748

//------------------------------------------------------------

// -- MEIA SOMA --

//------------------------------------------------------------


module HalfAdder(s, p, q);
	
	output s, s0;
	input p, q;
	wire temp1, temp2;
	
	and AND1(s0, p , q);
	and AND2(temp1, ~p, q);
	and AND3(temp2, p ,~q);
	or OR1(s, temp1, temp2);
	
endmodule // meia soma

//-----------------------------------------------------------------

// -- TEST MEIA SOMA --

// -----------------------------------------------------------------

module testandomsoma;
	
	reg a, b;
	wire s, s0, tmp1, tmp2;
	
				// instancia
				
	and AND1(s0, a, b);
	and AND2(tmp1, ~a, b);
	and AND3(tmp2, a, ~b);
	or OR1(s, tmp1, tmp2);
	
				// parte principal
				
	initial begin
		$display(" Guia_03_1 - Jessica Luisa Betonico Andrade -  412748");
		$display("\nTest Meia Soma");
		$display("\n a \tb \ts0 \ts \n");
		$monitor("  %b   +\t %b \t %b \t  %b", a, b, s0, s);
			
		 a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // Testandom_Soma