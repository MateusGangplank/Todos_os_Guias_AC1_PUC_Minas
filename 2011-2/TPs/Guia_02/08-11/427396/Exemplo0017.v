// ------------------------- 
// Exemplo0017 - Guia02 - Exercicio 2
// Nome: Eduardo Manoel de Paula Juniot 
// Matricula: 427396
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module calculos; 
// ------------------------- definir dados 
	reg [3:0] quatrobits;

	reg [4:0] cincobits1;
	reg [4:0] cincobits2;
	
	reg [5:0] seisbits1;
	reg [5:0] seisbits2;
	
	reg [6:0] setebits;
	
	reg [8:0] novebits1;
	reg [8:0] novebits2;
	
	reg [9:0] dezbits;
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0017 - Eduardo Manoel - 427396"); 
		
		$display("\nTest: 100010(2) + 11010(2)"); 
		seisbits1 = (32 + 2);
		cincobits1 = (16 + 8 + 2); 
		seisbits2 = seisbits1 + cincobits1; 
		$display("a = %d = %6b", seisbits1, seisbits1); 
		$display("b = %d = %5b", cincobits1, cincobits1); 
		$display("a + b =  %6b", seisbits2); 
		
		$display("\nTest: 11010(2) + 23(8) ");
		cincobits1 = (16 + 8 + 2);
		//23(8) = 010011
		cincobits2 = ( (2*8) + 3 );
		seisbits1 = cincobits1 + cincobits2;
		$display("a = %d = %5b", cincobits1, cincobits1); 
		$display("b = %d = %5b", cincobits2, cincobits2); 
		$display("a + b =  %6b", seisbits1); 
		
		$display("\nTest: 1234(8) / 2D(16) ");
		//1234(8) = 001010011100(2) = 1010011100(2)
		dezbits = ( (1 * 8 * 8 * 8) + (2 * 8 * 8) + (3 * 8) + 4);
		//2D(16) = 00101101(2) = 101101(2)
		seisbits1 = ( (2 * 16) + 13 );
		quatrobits = dezbits / seisbits1;
		$display("a = %d = %10b", dezbits, dezbits); 
		$display("b = %d = %6b", seisbits1, seisbits1); 
		$display("a / b =  %4b", quatrobits); 
		
		$display("\nTest: 1A9(16) - 101101001(2) ");
		//1A9(16) = 000110101001(2) = 110101001(2)
		novebits1 = ( (1 * 16 * 16) + (10 * 16) + 9);
		novebits2 = ( 256 + 64 + 32 + 8 + 1);
		setebits = novebits1 - novebits2;
		$display("a = %d = %9b", novebits1, novebits1);
		$display("b = %d = %9b", novebits2, novebits2);
		$display("a - b =  %7b", setebits); 
		
		$display("\nTest: 25 * 41(8) + 6B(16)");
		//25 = 11001(2)
		cincobits1 = 25;
		//41(8) = 100001(2)
		seisbits1 = ( (4*8) + 1 );
		//6B(16) = 01101011(2) = 1101011(2)
		setebits = ( (6*16) + 11 );
		dezbits = ( cincobits1 * seisbits1) + setebits;
		$display("a = %d = %5b", cincobits1, cincobits1);
		$display("b = %d = %6b", seisbits1, seisbits1);
		$display("c = %d = %7b", setebits, setebits);
		$display("a * b + c = %10b", dezbits); 
	end 
endmodule // calculos