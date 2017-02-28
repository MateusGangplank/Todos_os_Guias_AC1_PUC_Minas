// Giselle Caroline Vieira
// Matricula:424649

module exercicioNOR (s,a,b);

output s;
input a,b;
wire t1,t2;

nand nand1 (t1,a);
nand nand2 (t2,b);


assign s = ~(~(t1&t2));
 



endmodule // fim exercicio OR

module testenor;



reg a,b;
wire s;
exercicioNOR nor1 (s,a,b);

 initial begin
      $display("\Exercicio 04\n");
      $display("NOR usando apenas NAND\n");
      $display("\n~(a | b) = s\n");
      $monitor("~(%b | %b) = %b", a, b, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
 end
 
endmodule // fim testeor
 