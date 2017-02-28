// -----------------------
// Guia 02 - Exercicio 01
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// --- or usando nand ---

// -- module nand gate--

module nandgate (s, p, q);
 output s;
 input p, q;

 assign s = ~(p & q);
 
 endmodule // nandgate
 
// -- module teste or gate --

module testeorgate;
 reg p, q;
 wire s1, s2, s3;
                               // SE POSSIVEL, DEFINIR EM OUTRO MODULO
 nandgate NAND1 (s1, p, p);
 nandgate NAND2 (s2, q, q);
 nandgate NAND3 (s3, s1, s2);
 
 // parte principal
 initial begin
      $display("Guia 02 - Exercicio 01");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Teset Or gate using nand");
      $display("\n(p | q) = s\n");
  		p=0; q=0; 
	  $monitor(" %b & %b = %b", p, q, s3);
      #1 p=0; q=0;
		#1 p=0; q=1;
		#1 p=1; q=0;
		#1 p=1; q=1;

   
	end

endmodule // testeorgate

// OBS.: EVITAR ESPACO EM BRANCO NO NOME DO ARQUIVO