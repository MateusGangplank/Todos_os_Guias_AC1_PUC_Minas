// Giselle Caroline Vieira
// Matricula:424649

module exercicioNAND (s,a,b);

output s;
input a,b;
wire t1,t2;

nor nor1 (t1,a);
nor nor2 (t2,b);


assign s = ~(~(t1|t2));
 



endmodule // fim exercicio OR

module testenand;



reg a,b;
wire s;
exercicioNAND nand1 (s,a,b);

 initial begin
      $display("\Exercicio 05\n");
      $display("NAND usando apenas NOR\n");
      $display("\n~(a & b) = s\n");
      $monitor("~(%b & %b) = %b", a, b, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
 end
 
endmodule // fim testeor
 