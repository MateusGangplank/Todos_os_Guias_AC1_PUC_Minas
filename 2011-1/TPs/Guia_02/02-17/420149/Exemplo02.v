//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 02 - Exemplo 002
//@Matricula: 420139
//----------------

//----------------
//--- NOR GATE ---
//----------------

module norgate (s1, e1, e2);
   output s1;
   input  e1, e2;
	assign s1 = ~(e1|e2);
endmodule

//----------------
//--- AND TEST ---
//----------------

module testandgate;
reg e1, e2;
wire s1, s2, sfinal;

norgate nor1 (s1, e1, e1);
norgate nor2 (s2, e2, e2);
norgate nor3 (sfinal, s1, s2);


//--------------------------------------------
initial begin: start
 	e1 = 0;
 	e2 = 0;
end
//--------------------------------------------
//--------------------------------------------
initial begin: main
$display("Guia 02 - Exemplo 02");
      $display("AND Gate");
		$monitor("~(%b & %b) = %b", e1, e2, sfinal);
		
		#1 e1 = 0; e2 = 1;
		#1 e1 = 1; e2 = 0;
		#1 e1 = 1; e2 = 1;		
end
//--------------------------------------------	
endmodule

//---- TESTES -----
//-- Guia 02 - Exemplo 02
//-- AND Gate
//-- ~(0 & 0) = 0
//-- ~(0 & 1) = 0
//-- ~(1 & 0) = 0
//-- ~(1 & 1) = 1