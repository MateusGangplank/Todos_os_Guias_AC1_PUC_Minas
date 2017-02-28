 //  -- Exemplo0037 -- ED03 (Questao Extra 07)
 // -- Ana Carolina Conceição de Jesus ---
 // -- Matricula 449517 ------------------
 
 
 module Comparador(output s0, output s1, output s2, input a, input b);

         wire notb;
         wire nota;

         xnor XNOR1(s0,a,b);
         not NOT1(notb,b);
         and AND1(s1,notb,a);
         not NOT2(nota,a);
         and AND2 (s2,nota,b);

 endmodule
   
   module teste;
   
          reg a;
          reg b;
          wire s0,s1,s2;

          Comparador TESTE (s0,s1,s2,a,b);
          
          
    initial begin : main
	
	      $display("Exemplo0036 - Ana Carolina - 449517");
	      $display("\nComaparador test maior, menor e igual");

              a = 0; b = 0;
              $display(" 100 - bits são iguais , 001 - segundo maior , 010 - primeiro maior ");

      #1 $monitor(" entradas  %b %b saida = %b %b %b",a,b,s0,s1,s2);
      #1 a = 0; b = 1;
      #1 a = 1; b = 0;
      #1 a = 1; b = 1;
		
end

endmodule