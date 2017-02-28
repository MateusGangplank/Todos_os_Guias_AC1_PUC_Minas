// -------------------------
// Exercicio 6 
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//--------------------
//--EXTRAS
//-------------------

module ex_6(output[7:0] s, input[7:0]a);

	assign s = ~a;
	
endmodule

module test;

	reg[7:0]a;
	wire[7:0] s;
		
	ex_6 NOT1 (s,a);

//------------------parte principal
initial begin
	$display("Exercicio 6 - Thais Mairink - 441710");
	

	a = 8'b00000000;

	#1    $monitor("%b  =  %b", a, s);
	#1		a=8'b00000001;
	#1		a=8'b00000010;
	#1		a=8'b00000011;
	#1		a=8'b00000100;
	#1		a=8'b00000101;
	#1		a=8'b00000110;
	#1		a=8'b00000111;
	#1		a=8'b00001000;
	#1		a=8'b00001001;
	#1		a=8'b00001010;
	#1		a=8'b00001011;
	#1		a=8'b00001100;
	#1		a=8'b00001101;
	#1		a=8'b00001110;
	#1		a=8'b11111111;
 
	
end

endmodule
	
	
