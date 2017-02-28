// -- Exemplo0036 - versao 2.0 -----------------------
// -- Ana Carolina Conceição de Jesus ---
// -- Matricula 449517 ------------------

module Comparador (output s, input a, input b);
        xor XOR1 (s,a,b) ;
endmodule

module teste;

	reg a,b;
	wire s;
	
	Comparador teste (s,a,b);
	
	initial begin : main
	
	      $display("Exemplo0036 - Ana Carolina - 449517");
	      $display("\nComaparador test versao 2");

              a = 0; b = 0;
              $display(" 0 - bits são iguais 1 - bits diferentes");
		
  #1 $monitor(" entradas  %b %b saida = %b",a,b,s);
  #1 a = 0; b = 1;
  #1 a = 1; b = 0;
  #1 a = 1; b = 1;
		
end

endmodule