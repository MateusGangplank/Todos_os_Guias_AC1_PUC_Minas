// --------------------------
// Exemplo0017 - BASE
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------


// --------------------------
// Test number system
// --------------------------
   module test_base_01;
	
	
// -------------------------- Definir dados
   reg[6:0]a;
	reg[5:0]b;
	reg[3:0]c;
	reg[6:0]d;
	reg[9:0]e;


// -------------------------- Parte principal
   initial begin
	   $display("Exemplo0017 - Isabel Bicalho Amaro - 451580");
		$display("Test number system\n");
		
		
		a = 42+27;
		b = 27+21;
		c = 668/60;
		d = 442-369;
		e = 25*26+122;
		
		$display("101010(2) + 11011(2) = %d(10) = %b(2)",a,a);
		$display("11011(2) + 25(8) = %d(10) = %b(2)",b,b);
		$display("1234(8) / 3C(16) = %d(10) = %b(2)",c,c);
		$display("1BA(16) - 101110001(2) = %d(10) = %b(2)",d,d);
		$display("25(10) * 32(8) + 7A(16) = %d(10) = %b(2)",e,e);
   end
	
endmodule // test_base


//    Exemplo0017 - Isabel Bicalho Amaro - 451580
//    Test number system
//    
//    101010(2) + 11011(2) =  69(10) = 1000101(2)
//    11011(2) + 25(8) = 48(10) = 110000(2)
//    1234(8) / 3C(16) = 11(10) = 1011(2)
//    1BA(16) - 101110001(2) =  73(10) = 1001001(2)
//    25(10) * 32(8) + 7A(16) =  772(10) = 1100000100(2)