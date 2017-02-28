// --------------------------
// Exemplo0014 - BASE
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------


// --------------------------
// Test number system
// --------------------------
   module test_base_01;
	
	
// -------------------------- Definir dados
   reg[2:0]a;
	reg[3:0]b;
	reg[4:0]c;
	reg[4:0]d;


// -------------------------- Parte principal
   initial begin
	   $display("Exemplo0014 - Isabel Bicalho Amaro - 451580");
		$display("Test number system");
		
		a = 5;
		b = 10;
		c = 15;
		d = 20;
		
		$display("\nPositive Value");
		$display("a = %d = %3b", a,a);
		$display("a = %d = %4b", a,a);
		$display("a = %d = %5b", a,a);
		
		$display("b = %d = %4b", b,b);
		$display("c = %d = %5b", c,c);
		
		$display("d = %d = %5b", d,d);
		$display("d = %d = %5o", d,d);
		$display("d = %d = %5h", d,d);
		
		a = -5;
		b = -5;
		c = -5;
		
		$display("\nNegative value");
		$display("a = -5[3] = %d = %3b", a,a);
		$display("b = -5[4] = %d = %4b", b,b);
		$display("c = -5[5] = %d = %5b", c,c);
		
		a = ~5+1;
		b = ~5+1;
		c = ~5+1;
		
		$display("\nNegative mixed expression");
		$display("a = %d = %3b", a,a);
		$display("b = %d = %4b", b,b);
		$display("c = %d = %5b", c,c);
		
		a = 5+3;
		b = 5+3;
		c = 10-5+25+3+1;
		
		$display("\nOverflow");
		$display("a = %d = %3b", a,a);
		$display("b = %d = %4b", b,b);
		$display("c = %d = %5b", c,c);
   end
	
endmodule // test_base


//    Exemplo0014 - Isabel Bicalho Amaro - 451580
//    Test number system
//    
//    Positive Value
//    a = 5 = 101
//    a = 5 =  101
//    a = 5 =   101
//    b = 10 = 1010
//    c = 15 = 01111
//    d = 20 = 10100
//    d = 20 =    24
//    d = 20 =    14
//  
//    Negative value
//    a = -5[3] = 3 = 011
//    b = -5[4] = 11 = 1011
//    c = -5[5] = 27 = 11011
//
//    Negative mixed expression
//    a = 3 = 011
//    b = 11 = 1011
//    c = 27 = 11011
//
//    Overflow
//    a = 0 = 000
//    b = 8 = 1000
//    c = 2 = 00010