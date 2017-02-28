// ------------------------- 
// Exemplo0018 - Guia02 - Exercicio 3
// Nome: Eduardo Manoel de Paula Juniot 
// Matricula: 427396
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module calculos; 
// ------------------------- definir dados 
	reg [3:0] quatrobits;
	reg [3:0] compquatro;

	reg [4:0] cincobits;
	reg [4:0] compcinco;

	reg [5:0] seisbits;
	reg [5:0] compseis;
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0018 - Eduardo Manoel - 427396"); 
		
		$display("\nComplemento de 2 de: 100111(2)"); 
		seisbits = (32 +4 + 2 + 1);
		compseis = ~seisbits;
		compseis = compseis + 1;
   	$display("a = %d = %6b -> C2 = %6b", seisbits, seisbits, compseis ); 
		
		$display("\nComplemento de 2 de: 54(8)"); 
		//54(8) = 101100
		seisbits = ( (5*8) + 4);
		compseis = ~seisbits;
		compseis = compseis + 1;
   	$display("a = %d = %6b -> C2 = %6b", seisbits, seisbits, compseis ); 
		
		$display("\nComplemento de 2 de: 13(10)"); 
		//13(10) = 1101
		quatrobits = 13;
		compquatro = ~quatrobits;
		compquatro = compquatro + 1;
   	$display("a = %d = %4b -> C2 = %4b", quatrobits, quatrobits, compquatro );

		$display("\nComplemento de 2 de: 1B(16)"); 
		//1B(16) = 00011011(2) = 11011(2)
		cincobits = ( 16 + 11 );
		compcinco = ~cincobits;
		compcinco = compcinco + 1;
   	$display("a = %d = %5b -> C2 = %5b", cincobits, cincobits, compcinco );
		
		$display("\nComplemento de 2 de: 25 - 36"); 
		// 25 = 11001
		// 36 = 100100
		cincobits = 25;
		seisbits = 36;
		quatrobits = cincobits - seisbits;
		compquatro = ~quatrobits;
		compquatro = compquatro + 1;
   	$display("a - b = %d - %d = %4b - %4b = %4b -> C2 = %4b", seisbits, cincobits, seisbits, cincobits, quatrobits, compquatro );
	end 
endmodule // calculos