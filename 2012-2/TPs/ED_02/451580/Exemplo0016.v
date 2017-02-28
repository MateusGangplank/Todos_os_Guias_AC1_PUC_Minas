// --------------------------
// Exemplo0016 - BASE
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------


// --------------------------
// Test number system
// --------------------------
   module test_base_01;
	
	
// -------------------------- Definir dados
   reg[4:0]a;
	reg[4:0]b;
	reg[2:0]c;
	reg[3:0]d;
	reg[4:0]e;


// -------------------------- Parte principal
   initial begin
	   $display("Exemplo0016 - Isabel Bicalho Amaro - 451580");
		$display("Test number system\n");
		
		a = 2+14;
		b = 3*9;
		c = 32/5;
		d = 24-11;
		e = 2*6+7-1;
		
		$display("2+14 = %d = %b",a,a);
		$display("3*9 = %d = %b",b,b);
		$display("32/5 = %d = %b",c,c);
		$display("24-11 = %d = %b",d,d);
		$display("2*6+7-1 = %d = %b",e,e);
   end
	
endmodule // test_base


//    Exemplo0016 - Isabel Bicalho Amaro - 451580
//    Test number system
//    
//    2+14 = 16 = 10000
//    3*9 = 27 = 11011
//    32/5 = 6 = 110
//    24-11 = 13 = 1101
//    2*6+7-1 = 18 = 10010