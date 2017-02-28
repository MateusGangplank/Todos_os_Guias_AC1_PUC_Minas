//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 02 - Exemplo 003
//@Matricula: 420139
//----------------

//----------------
//--- NAND GATE ---
//----------------

module nandgate (s1, e1, e2);
   output s1;
   input  e1, e2;
	assign s1 = ~(e1&e2);
endmodule

//----------------
//--- NOT TEST ---
//----------------

module testandgate;
reg e1;
wire sfinal;

nandgate nand1 (sfinal, e1, e1);



//--------------------------------------------
initial begin: start
 	e1 = 0;
end
//--------------------------------------------
//--------------------------------------------
initial begin: main
$display("Guia 02 - Exemplo 03");
      $display("NOT Gate");
		$monitor("~%b = %b", e1, sfinal);
		
		#1 e1 = 1;		
end
//--------------------------------------------	
endmodule

//---- TESTES -----
//-- Guia 02 - Exemplo 03
//-- NOT Gate
//-- ~0 = 1
//-- ~1 = 0