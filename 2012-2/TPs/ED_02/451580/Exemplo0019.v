// --------------------------
// Exemplo0019 - BASE
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------


// --------------------------
// Test number system
// --------------------------
   module test_base_01;
	
	
// -------------------------- Definir dados
   reg[7:0]a;
	reg[6:0]b;
	reg[5:0]c;
	reg[4:0]d;
	reg[7:0]e;


// -------------------------- Parte principal
   initial begin
	   $display("Exemplo0019 - Isabel Bicalho Amaro - 451580");
		$display("Test number system\n");
		
		
		a = ~(43)+1;
		b = ~(57)+1;
		c = ~(27)+1;
		d = ~(12)+1;
		e = ~(17)+1;
		
		$display("~101011(2)+1 = %d(10) = %b(2)",a,a);
		$display("~321(4)+1 = %d(10) = %b(2)",b,b);
		$display("~27(10)+1 = %d(10) = %b(2)",c,c);
		$display("C(16)+1 = %d(10) = %b(2)",d,d);
		$display("~21(8)+1 = %d(10) = %b(2)",e,e);
   end
	
endmodule // test_base


//    Exemplo0019 - Isabel Bicalho Amaro - 451580
//    Test number system
//    
//    ~101011(2)+1 = 213(10) = 11010101(2)
//    ~321(4)+1 =  71(10) = 1000111(2)
//    ~27(10)+1 = 37(10) = 100101(2)
//    C(16)+1 = 20(10) = 10100(2)
//    ~21(8)+1 = 239(10) = 11101111(2)