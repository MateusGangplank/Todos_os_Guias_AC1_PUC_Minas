//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 02 - Exemplo 004
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
//--- NOT GATE ---
//----------------

module notgate (s1, e1);
   output s1;
   input  e1;
	assign s1 = ~e1;
endmodule

//----------------
//--- NOR TEST ---
//----------------

module testandgate;
reg e1, e2;
wire s1, s2, s3, sfinal;

nandgate and1 (s1, e1, e1);
nandgate and2 (s2, e2, e2);
nandgate and3 (s3, s1, s2);
notgate not1 (sfinal, s3);


//--------------------------------------------
initial begin: start
 	e1 = 0;
 	e2 = 0;
end
//--------------------------------------------
//--------------------------------------------
initial begin: main
$display("Guia 02 - Exemplo 04");
      $display("NOR Gate");
		$monitor("~(%b & %b) = %b", e1, e2, sfinal);
		
		#1 e1 = 0; e2 = 1;
		#1 e1 = 1; e2 = 0;
		#1 e1 = 1; e2 = 1;		
end
//--------------------------------------------	
endmodule

//---- TESTES -----
//-- Guia 02 - Exemplo 04
//-- NOR Gate
//-- ~(0 & 0) = 1
//-- ~(0 & 1) = 0
//-- ~(1 & 0) = 0
//-- ~(1 & 1) = 0