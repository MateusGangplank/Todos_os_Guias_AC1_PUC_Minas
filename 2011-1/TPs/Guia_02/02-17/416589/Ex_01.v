// ---------------------
// Guia 02_01 - Porta OR usando portas NAND
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- or gate
// ---------------------

module orgate (s, a, b);
 output s;
 input  a, b;
 wire temp1, temp2;

 assign temp1 = ~(a & a);
 assign temp2 = ~(b & b);
 assign s = ~(temp1 & temp2);


endmodule // orgate

// ---------------------
// -- test or gate
// ---------------------

module testorgate;
 reg   a,b;
 wire  s;
          
			 // instancia
 orgate OR1 (s,a,b);
 
 initial begin:start
      a=0; b=0;
 end
          // parte principal
 initial begin:main
      $display("Guia 02_01 - Alyson Deives - 416589");
      $display("PORTA OR (USANDO PORTAS NAND)");
		$display("\nA ^ B = S\n");
      $monitor("%b ^ %b = %b", a, b, s);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
  end

endmodule // testorgate

// OBS.: SE POSSIVEL, TENTE USAR AS DEFINICOES DE PORTAS
//       E DEIXE AS EXPRESSOES SOMENTE PARA QUANDO FOR ESTRITAMENTE NECESSARIO.

