// --------------------------
// Exemplo0018 - BASE
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
	reg[5:0]c;
	reg[6:0]d;
	reg[4:0]e;


// -------------------------- Parte principal
   initial begin
	   $display("Exemplo0018 - Isabel Bicalho Amaro - 451580");
		$display("Test number system\n");
		
		
		a = ~(38)+1;
		b = ~(20)+1;
		c = ~(25)+1;
		d = ~(45)+1;
		e = ~(-10)+1;
		
		$display("~100110(2)+1 = %d(10) = %b(2)",a,a);
		$display("~24(2)+1 = %d(10) = %b(2)",b,b);
		$display("~25(10)+1 = %d(10) = %b(2)",c,c);
		$display("2D(16)+1 = %d(10) = %b(2)",d,d);
		$display("~(27(10)-37(10))+1 = %d(10) = %b(2)",e,e);
   end
	
endmodule // test_base


//    Exemplo0018 - Isabel Bicalho Amaro - 451580
//    Test number system
//    
//    ~100110(2)+1 =  90(10) = 1011010(2)
//    ~24(2)+1 = 44(10) = 101100(2)
//    ~25(10)+1 = 39(10) = 100111(2)
//    2D(16)+1 =  83(10) = 1010011(2)
//    ~(27(10)-37(10))+1 = 10(10) = 01010(2)