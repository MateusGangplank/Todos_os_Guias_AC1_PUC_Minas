// -------------------------
// Exercicio11 - EXTRA
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//-------------------------------------------------------
//--Saida 1 quanto todos bist forem 0, entrada de 1 byte
//--------------------------------------------------------

module entradaZero (output s, input[7:0]p);

assign s = ~(p[0]|p[1]|p[2]|p[3]|p[4]|p[5]|p[6]|p[7]);

endmodule   //saidaZero

//-----------test
module test_entradaZero;
// ------------------------- dados locais 
   reg[7:0]a; 		// definir registrador 
   wire  s;    	// definir conexao (fio)

// ------------------------- instancia 
   entradaZero Z (s, a);
 
// ------------------------- preparacao 
initial begin:start 
  	 a= 8'b00000000; 
end 
	
// ------------------------- parte principal 
   initial begin:main 
         $display("Exercicio11 - Thais Mairink - 441710"); 
         $display("Test entrada zero"); 
         $display("\na  =  s\n"); 
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
 
endmodule // test_entradaZero

