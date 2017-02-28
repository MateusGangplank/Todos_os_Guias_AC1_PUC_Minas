// --------------------------
// Exemplo0020 - BASE
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------


// --------------------------
// Test number system
// --------------------------
   module test_base_01;
	
	
// -------------------------- Definir dados
   reg[7:0]a;
	reg[7:0]b;
	reg[7:0]c;
	reg[7:0]d;
	reg[7:0]e;


// -------------------------- Parte principal
   initial begin
	   $display("Exemplo0020 - Isabel Bicalho Amaro - 451580");
		$display("Test number system\n");
		
		
		a = 42 + (~9+1);
		b = 27 + (~13+1);
		c = 28 + (~12+1);
		d = 218 + (~185+1);
		e = 27 + (~27+1);
		
		$display("101010(2) – 1001(2) = %d(10) = %b(2)",a,a);
		$display("11011(2) – 15(8) = %d(10) = %b(2)",b,b);
		$display("34(8) – C(16) = %d(10) = %b(2)",c,c);
		$display("DA(16) – 10111001(2) = %d(10) = %b(2)",d,d);
		$display("27 – 1B(16) = %d(10) = %b(2)",e,e);
   end
	
endmodule // test_base


//    Exemplo0020 - Isabel Bicalho Amaro - 451580
//    Test number system
//    
//    101010(2) – 1001(2) =  33(10) = 00100001(2)
//    11011(2) – 15(8) =  14(10) = 00001110(2)
//    34(8) – C(16) =  16(10) = 00010000(2)
//    DA(16) – 10111001(2) =  33(10) = 00100001(2)
//    27 – 1B(16) =   0(10) = 00000000(2)