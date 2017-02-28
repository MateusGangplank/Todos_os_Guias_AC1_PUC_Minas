// ------------------------- 
// Exemplo0016 - Guia02 - Exercicio 1
// Nome: Eduardo Manoel de Paula Juniot 
// Matricula: 427396
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module calculos; 
// ------------------------- definir dados 
	reg [0:0] unitario;
	
	reg [1:0] doisbits; 
	
	reg [2:0] tresbits1;
	reg [2:0] tresbits2;
	
	reg [3:0] quatrobits1;
	reg [3:0] quatrobits2;
	
	reg [4:0] cincobits;
	
	reg [5:0] seisbits;
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0016 - Eduardo Manoel - 427396"); 
		
		$display("\nTest: 2 + 14"); 
		doisbits = 2;
		quatrobits1 = 14; 
		cincobits = doisbits + quatrobits1; 
		$display("a = %d = %2b", doisbits, doisbits); 
		$display("b = %d = %4b", quatrobits1, quatrobits1); 
		$display("a + b =  %5b", cincobits); 
		
		$display("\nTest: 3 * 7"); 
		doisbits = 3;
		tresbits1 = 7;
		cincobits = doisbits * tresbits1;
		$display("a = %d = %2b", doisbits, doisbits); 
		$display("b = %d = %4b", tresbits1, tresbits1); 
		$display("a * b =  %5b", cincobits); 
		
		$display("\nTest: 34 / 3"); 
		tresbits1 = 3;
		seisbits = 34;
		quatrobits1 = seisbits / tresbits1;
		$display("a = %d = %3b", tresbits1, tresbits1); 
		$display("b = %d = %4b", seisbits, seisbits); 
		$display("b / a =  %4b", quatrobits1); 
		
		$display("\nTest: 19 - 11"); 
		cincobits = 19;
		quatrobits1 = 11;
		quatrobits2 = cincobits - quatrobits1;
		$display("a = %d = %5b", cincobits, cincobits); 
		$display("b = %d = %4b", quatrobits1, quatrobits1); 
		$display("a - b =  %5b", quatrobits2); 
		
		$display("\nTest: 2 * 4 + 6 - 1"); 
		doisbits = 2;
		tresbits1 = 4;
		tresbits2 = 6;
		unitario = 1;
		quatrobits1 = doisbits * tresbits1 + tresbits2 - unitario;
		$display("a * b + c - d =  %4b", quatrobits1); 
	end 
endmodule // calculos