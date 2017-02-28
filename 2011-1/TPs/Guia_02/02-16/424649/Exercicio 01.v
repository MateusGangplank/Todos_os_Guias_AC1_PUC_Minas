// Giselle Caroline Vieira
// Matricula:424649

module exercicioOR (s,a,b);

output s;
input a,b;
wire t1,t2;

nand nand1 (t1,a);
nand nand2 (t2,b);

                           // PODE USAR OUTRA NAND
assign s = ~(t1&t2);

endmodule // fim exercicio OR

module testeor;



reg a,b;
wire s;
exercicioOR or1 (s,a,b);

 initial begin
      $display("\Exercicio 01\n");
      $display("OR usando apenas NAND\n");
      $display("\na | b = s\n");
      $monitor("%b | %b = %b", a, b, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // fim testeor

// OBS.: EVITAR ESPACO EM BRANCO NO NOME DO ARQUIVO